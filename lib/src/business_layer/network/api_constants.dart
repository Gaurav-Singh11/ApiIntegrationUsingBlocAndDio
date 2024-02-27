import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstants {
  /// Private constructor to prevent class instantiation
  ApiConstants._privateConstructor();

  /// Api URLS DEVELOPMENT
  static String urlDevServer = dotenv.env['API_BASE_URL'] ?? "";
      // 'http://sgfabricatordemo.netcarrots.in/SGFabricatorAPI/Service.svc/';
  static const devApiKey = '';

  /// Api URLS PRODUCTION
  static const urlProdServer = '';
  static const prodApiKey = '';

  /// Api URLS TESTING
  static const urlTestServer = '';
  static const testApiKey = '';

  static const googleLink = "google.com";

  static const login = "UserLoginAPI";
}
