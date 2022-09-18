import 'dart:convert';
import 'dart:math';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:market/constants.dart';
import 'package:market/data/models/user/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> storeAuthToken(String token) async {
  await SharedPreferences.getInstance().then(
    (value) => value.setString(AUTH_TOKEN_KEY, token),
  );
}

Future<String?> getAuthToken() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getString(AUTH_TOKEN_KEY);
}

Future<void> storeUserData(User user) async {
  await SharedPreferences.getInstance().then(
    (value) => value.setString(USER_DATA_KEY, jsonEncode(user.toJson())),
  );
}

///Gets user data from local storage
Future<User?> getUserData() async {
  final prefs = await SharedPreferences.getInstance();
  final data = prefs.getString(USER_DATA_KEY);
  if (data != null) {
    return User.fromJson(jsonDecode(data));
  }
  return null;
}

Random rand = Random();
String randomString(int len) {
  const chars = "ABCDEFDGUUIYKNMLPOUYZVFSHGD987462541432";
  return String.fromCharCodes(
    Iterable.generate(
      len,
      (_) => chars.codeUnitAt(
        rand.nextInt(chars.length),
      ),
    ),
  );
}

extension DateX on DateTime {
  String get format => "$year-${month.toString().padLeft(2, "0")}-"
      "${day.toString().padLeft(2, "0")} "
      "${hour.toString().padLeft(2, "0")}"
      ":${minute.toString().padLeft(2, "0")}";
}

LatLngBounds latLngBounds(LatLng p1, LatLng p2) {
  // Calculating to check that the position relative
// to the frame, and pan & zoom the camera accordingly.
  double miny = (p1.latitude <= p2.latitude) ? p1.latitude : p2.latitude;
  double minx = (p1.longitude <= p2.longitude) ? p1.longitude : p2.longitude;
  double maxy = (p1.latitude <= p2.latitude) ? p2.latitude : p1.latitude;
  double maxx = (p1.longitude <= p2.longitude) ? p2.longitude : p1.longitude;

  double southWestLatitude = miny;
  double southWestLongitude = minx;

  double northEastLatitude = maxy;
  double northEastLongitude = maxx;
  return LatLngBounds(
    northeast: LatLng(northEastLatitude, northEastLongitude),
    southwest: LatLng(southWestLatitude, southWestLongitude),
  );
}
