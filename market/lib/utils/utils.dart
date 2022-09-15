import 'dart:convert';
import 'dart:math';

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
