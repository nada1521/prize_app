import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class ApiConstants {
  // URI
  static final String root = _showLocal ? _localHost : dotenv.get('DOMAIN');
  static final String baseUrl = "$root/api";

  // Endpoints
  static const String settings = "/settings";
  static const String refreshToken = "/refresh_token";
  static const String login = "/login";
  static const String signup = "/signup";
  static const String getProfile = "/user_data";
  static const String editProfile = "/edit-profile";
  static const String logout = "/logout";
  static const String resetPassword = "/reset_password_request";
  static const String confirmResetPassword = "/confirm_reset_password";
  static const String deleteAccount = "/delete-account";
  static const String search = "/search";
  static const String banners = "/banners";
  static const String contactUs = "/contact";
  static const String feedback = "/feedback";
  static const String getPackage = "/get_package";
  static const String getPaymentMethods = "/getPaymentMethods";
  static const String getSettings = "/get_settings";
  static const String publishProperty = "/publish_property";

  // LOCAL HOST
  static const _showLocal = kDebugMode && false;
  static const String _androidLocal = "http://10.0.2.2:8000";
  static const String _iosLocal = "http://127.0.0.1:8000";
  static final String _localHost = Platform.isAndroid ? _androidLocal : _iosLocal;
}
