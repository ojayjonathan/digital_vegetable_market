import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:market/data/error/error_format.dart';
import 'package:market/data/error/error_object.dart';
import 'package:market/data/models/address/address.dart';
import 'package:market/data/models/address/location_search.dart';
import 'package:market/data/models/http/http.dart';
import 'package:market/secrets.dart';
import 'package:market/utils/utils.dart';

class AddressProvider {
  final client = Dio(
    BaseOptions(
        sendTimeout: 10000, connectTimeout: 10000, receiveTimeout: 10000),
  );
  final polylinePoints = PolylinePoints();
  Position? _position;
  final String sessionToken = randomString(10);
  Future<bool> openAppSettings() => Geolocator.openAppSettings();
  Future<bool> openLocationSettings() => Geolocator.openLocationSettings();
  Future<LocationPermission> checkPermission() => Geolocator.checkPermission();
  Future<LocationPermission> requestPermission() =>
      Geolocator.requestPermission();
  Future<Position> currentPosition() async {
    if (_position != null) return _position!;
    _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return _position!;
  }

  Future<Position?> getLastKnownPosition() => Geolocator.getLastKnownPosition();
  Future<bool> serviceEnabled() => Geolocator.isLocationServiceEnabled();

  final Stream<Position> positionStream = Geolocator.getPositionStream(
    locationSettings: const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    ),
  );
  final Stream<ServiceStatus> serviceStatus =
      Geolocator.getServiceStatusStream();

  Future<List<Suggestion>> fetchSuggestions(String input, String lang) async {
    try {
      String url =
          'https://maps.googleapis.com/maps/api/place/autocomplete/json?'
          'input=$input&types=address'
          '&components=country:ke'
          '&key=$googleMapsApiKey'
          '&sessiontoken=$sessionToken';
      final response = await client.get(url);
      final result = response.data;
      return result['predictions']
          .map<Suggestion>((p) => Suggestion.fromJson(p))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch suggestion');
    }
  }

  Future<HttpResult<Address>> getPlaceDetailFromId(String placeId) async {
    try {
      final url = 'https://maps.googleapis.com/maps/api/place/details/json?'
          'place_id=$placeId&fields=address_components,name,geometry'
          '&key=$googleMapsApiKey&sessiontoken=$sessionToken';
      final response = await client.get(url);

      final result = response.data;

      return HttpResult.onSuccess(
        data: formatedAddress(result["result"]),
      );
    } catch (e) {
      return HttpResult.onError(error: ErrorObject.fromException(e));
    }
  }

  Future<HttpResult<Address>> reverseGeocoding(
      {required double lat, required double lng}) async {
    try {
      final url =
          'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng'
          '&fields=address_components,name,geometry'
          '&key=$googleMapsApiKey';

      final response = await client.get(url);
      if (response.data["results"].length > 0) {
        return HttpResult.onSuccess(
          data: formatedAddress(response.data["results"][0]).copyWith(
            latitude: lat,
            longitude: lng,
          ),
        );
      }
    } catch (e) {
      return HttpResult.onError(
        error: getException(e),
      );
    }

    return HttpResult.onSuccess(
      data: Address(latitude: lat, longitude: lng),
    );
  }

  Address formatedAddress(result) {
    final components = result['address_components'] as List<dynamic>;
    String? street;
    String? premise;
    String floor = "";
    String room = "";
    String streetNumber = "";
    String country = "";
    String? locality;
    String subLocality = "";
    String route = "";
    String? adminArea1;
    String? adminArea2;
    String? adminArea3;

    // build result
    //construct place from google map api result
    for (var c in components) {
      final List type = c['types'];
      if (type.contains('premise')) {
        premise = c['long_name'];
      }
      if (type.contains('floor')) {
        floor = c['long_name'];
      }
      if (type.contains('room')) {
        room = c['long_name'];
      }
      if (type.contains('street_address')) {
        street = c['long_name'];
      }
      if (type.contains('street_number')) {
        streetNumber = c['long_name'];
      }
      if (type.contains('route')) {
        route = c['long_name'];
      }
      if (type.contains('locality')) {
        locality = c['long_name'];
      }
      if (type.contains('sublocality')) {
        subLocality = c['long_name'];
      }
      if (type.contains("administrative_area_level_1")) {
        adminArea1 = c["long_name"];
      }
      if (type.contains("administrative_area_level_2")) {
        adminArea2 = c["long_name"];
      }
      if (type.contains("administrative_area_level_3")) {
        adminArea3 = c["long_name"];
      }
      if (type.contains('country')) {
        country = c['long_name'];
      }
    }
    //set place name
    String? name = result['name'];
    //longitude latitude
    double lat = result['geometry']["Address"]["lat"];
    double lng = result['geometry']["Address"]["lng"];
    List<String> addressData = [
      floor,
      room,
      streetNumber,
      route,
      street ?? premise ?? "",
      subLocality,
      locality ?? adminArea1 ?? "",
      adminArea2 ?? "",
      adminArea3 ?? "",
      country,
    ].where((value) => value.isNotEmpty).toList();
    addressData =
        addressData.isEmpty ? [result['formatted_address'] ?? ""] : addressData;
    return Address(
      address: addressData.join(", "),
      title: name ?? addressData.join(", "),
      latitude: lat,
      longitude: lng,
    );
  }

  Future<HttpResult<List<Polyline>>> polyline(
    LatLng origin,
    LatLng destination,
  ) async {
    try {
      List<LatLng> polylineCoordinates = [];
      List<Polyline> polylines = [];

      final res = polylinePoints.getRouteBetweenCoordinates(
        googleMapsApiKey,
        PointLatLng(origin.latitude, origin.longitude),
        PointLatLng(destination.latitude, destination.longitude),
        travelMode: TravelMode.driving,
      );
      await res.then(
        (result) {
          if (result.points.isNotEmpty) {
            polylineCoordinates.clear();
            for (int i = 0; i < result.points.length; i++) {
              PointLatLng point = result.points[i];
              polylineCoordinates.add(LatLng(point.latitude, point.longitude));
            }
          }
          PolylineId id = PolylineId(randomString(10));
          Polyline polyline = Polyline(
            polylineId: id,
            color: Colors.blue,
            points: polylineCoordinates,
            width: 5,
          );
          polylines.add(polyline);
        },
      );
      return HttpResult.onSuccess(data: polylines);
    } catch (e) {
      return HttpResult.onError(error: getException(e));
    }
  }
}
