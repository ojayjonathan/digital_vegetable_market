import 'dart:async';


import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:market/data/models/address/address.dart';
import 'package:market/data/models/address/location_search.dart';
import 'package:market/data/services/address.dart';
import 'package:market/data/services/service.dart';
import 'package:market/data/services/status.dart';
import 'package:market/presentation/features/address_search/bloc/location_search_bloc.dart';

class AddressPicker extends StatelessWidget {
  final LatLng? latLang;

  const AddressPicker({Key? key, this.latLang}) : super(key: key);
  close(BuildContext context, Address? data) {
    Navigator.of(context).pop(data);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (context) => SearchBloc(),
      child: Builder(
        builder: (context) {
          final bloc = context.read<SearchBloc>();
          return Scaffold(
            appBar: AppBar(
              elevation: 2,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop(bloc.state.selected);
                },
              ),
              title: _SearchInput(),
            ),
            body: Center(
              child: Stack(
                children: [
                  GoogleMap(
                    myLocationButtonEnabled: true,
                    mapType: MapType.normal,
                    zoomGesturesEnabled: true,
                    tiltGesturesEnabled: true,
                    gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
                      Factory<OneSequenceGestureRecognizer>(
                        () => EagerGestureRecognizer(),
                      ),
                    },
                    initialCameraPosition: CameraPosition(
                      target: latLang ??
                          const LatLng(-0.36932651926935073, 35.9313568419356),
                      zoom: 10.0,
                    ),
                    onMapCreated: (GoogleMapController controller) async {
                      bloc.mapController.complete(controller);
                    },
                    onCameraIdle: () {
                      bloc.updatePosition();
                    },
                    onCameraMove: (pos) {
                      // bloc.shouldUpdateAddressChange(false);
                      bloc.mapPosChanged(pos.target);
                    },
                  ),
                  const _Pin(),
                  const _Suggestion(),
                  const _Card(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Suggestion extends StatelessWidget {
  const _Suggestion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) => previous.query != current.query,
      builder: (context, state) {
        if (state.query.isEmpty) return const SizedBox();
        return FutureBuilder<List<Suggestion>>(
          future:
              service<AddressProvider>().fetchSuggestions(state.query, "en"),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return const LinearProgressIndicator();
            }
            if (snapshot.hasData) {
              return Container(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: snapshot.data!
                      .map(
                        (s) => _Tile(suggestion: s),
                      )
                      .toList(),
                ),
              );
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}

class _Pin extends StatelessWidget {
  const _Pin({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(Icons.place, size: 56),
            Container(
              decoration: const ShapeDecoration(
                shadows: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.black,
                  ),
                ],
                shape: CircleBorder(
                  side: BorderSide(
                    width: 4,
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 56),
          ],
        ),
      ),
    );
  }
}

class _Card extends StatelessWidget {
  const _Card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          child: BlocBuilder<SearchBloc, SearchState>(
            buildWhen: (previous, current) =>
                previous.selected != current.selected,
            builder: (context, state) {
              if (state.selected != null) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const _LinearLoader(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            child: Text(state.selected!.name),
                          ),
                          const SizedBox(width: 10),
                          FloatingActionButton(
                            backgroundColor: Theme.of(context).primaryColorDark,
                            onPressed: () {
                              Navigator.of(context).pop(state.selected);
                            },
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }
}

class _LinearLoader extends StatelessWidget {
  const _LinearLoader({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) => current.status != previous.status,
      builder: (context, state) {
        if (state.status == ServiceStatus.loading) {
          return const LinearProgressIndicator();
        }
        return const SizedBox(height: 5);
      },
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile({
    Key? key,
    required this.suggestion,
  }) : super(key: key);
  final Suggestion suggestion;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.location_on,
        color: Theme.of(context).primaryColorDark,
      ),
      title: Text(
        suggestion.description.split(",")[0],
      ),
      subtitle: Text(
        suggestion.description.split(",").sublist(1).join(","),
      ),
      onTap: () =>
          context.read<SearchBloc>().suggestionSelected(suggestion.placeId),
    );
  }
}

class _SearchInput extends StatelessWidget {
  _SearchInput({
    Key? key,
  }) : super(key: key);
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchBloc, SearchState>(
      listenWhen: (previous, current) => current.query.isEmpty,
      listener: (context, state) {
        FocusScope.of(context).unfocus();
        controller.text = "";
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Theme.of(context).brightness == Brightness.dark
              ? Colors.black54
              : Colors.white,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: <Widget>[
            const Icon(Icons.search),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                controller: controller,
                decoration: const InputDecoration(
                  hintText: 'Search place',
                  border: InputBorder.none,
                ),
                onChanged: (value) =>
                    context.read<SearchBloc>().queryChanged(value),
              ),
            ),
            const SizedBox(width: 8),
            BlocBuilder<SearchBloc, SearchState>(
              buildWhen: (previous, current) =>
                  current.query.isNotEmpty != previous.query.isNotEmpty,
              builder: (context, state) {
                return state.query.isNotEmpty
                    ? GestureDetector(
                        child: const Icon(Icons.clear),
                        onTap: () {
                          context.read<SearchBloc>().queryChanged("");
                        },
                      )
                    : const SizedBox();
              },
            )
          ],
        ),
      ),
    );
  }
}

Future<Address?> showAddressPicker(context, {LatLng? latLng}) =>
    showGeneralDialog<Address>(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black45,
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (BuildContext buildContext, Animation animation,
          Animation secondaryAnimation) {
        return AddressPicker(latLang: latLng);
      },
    );
