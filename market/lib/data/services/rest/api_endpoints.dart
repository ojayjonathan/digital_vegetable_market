part of 'client.dart';

// ignore: constant_identifier_names
const BASE_URL = "http://192.168.43.232:8000";

class ApiEndpoints {
  static String login = "/auth/login/";
  static String register = "/auth/register/";
  static String profile = "/account/profile/";
  static String changePassword = "/account/update-password/";
  static String products = "/products/";
  static String wallet = "/products/";
  static String resetPasswordInit = "/auth/password-reset-init";
  static String passwordResetComplete = "/auth/password-reset-complete";
  static String orders = "/orders/";
  static String address = "/address/";
  static String feedback = "/feedback/";
}
