import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:market/data/models/address/address.dart';
import 'package:market/data/services/address.dart';
import 'package:market/data/services/service.dart';
import 'package:market/data/services/status.dart';

class SearchState extends Equatable {
  final ServiceStatus status;
  final String query;
  final Address? selected;

  const SearchState({
    this.status = ServiceStatus.initial,
    this.query = "",
    this.selected,
  });

  @override
  List<Object?> get props => [status, selected, query];
  SearchState copyWith({
    String? query,
    ServiceStatus? status,
    Address? location,
  }) {
    return SearchState(
      query: query ?? this.query,
      selected: location ?? selected,
      status: status ?? this.status,
    );
  }
}

class SearchBloc extends Cubit<SearchState> {
  final placeProvider = service<AddressProvider>();
  bool _shouldUpdate = true;
  final Completer<GoogleMapController> mapController = Completer();
  LatLng? _position;
  SearchBloc() : super(const SearchState());
  void queryChanged(String value) {
    emit(state.copyWith(query: value));
  }

  void mapPosChanged(LatLng latLng) async {
    _position = latLng;
  }

  void updatePosition() async {
    if (_position == null) return;
    if (!_shouldUpdate) {
      _shouldUpdate = true;
      return;
    }
    emit(
      state.copyWith(
        status: ServiceStatus.loading,
        location: Address(
          latitude: _position!.latitude,
          longitude: _position!.longitude,
          title: "Unnamed Address",
          address:
              "lat: ${_position!.latitude.toStringAsFixed(3)} lng: ${_position!.longitude.toStringAsFixed(3)} ",
        ),
      ),
    );
    final res = await placeProvider.reverseGeocoding(
      lat: _position!.latitude,
      lng: _position!.longitude,
    );
    res.when(
      onError: (error) {
        emit(
          state.copyWith(
            status: ServiceStatus.loadingFailure,
            query: "",
          ),
        );
      },
      onSuccess: (data) {
        emit(
          state.copyWith(
            status: ServiceStatus.loadingSuccess,
            location: data,
            query: "",
          ),
        );
      },
    );
  }

  void suggestionSelected(String value) async {
    //Prevent update of selected location from map movement
    _shouldUpdate = false;
    emit(
      state.copyWith(
        status: ServiceStatus.loading,
        query: "",
      ),
    );
    final res = await placeProvider.getPlaceDetailFromId(value);
    res.when(
      onError: (error) {
        emit(
          state.copyWith(
            status: ServiceStatus.loadingFailure,
          ),
        );
      },
      onSuccess: (data) async {
        CameraPosition update = CameraPosition(
          target: LatLng(data.latitude, data.longitude),
          zoom: 10.0,
        );
        await mapController.future.then(
          (c) => c.animateCamera(
            CameraUpdate.newCameraPosition(
              update,
            ),
          ),
        );
        emit(
          state.copyWith(
            status: ServiceStatus.loadingSuccess,
            location: data,
          ),
        );
      },
    );
  }
}
