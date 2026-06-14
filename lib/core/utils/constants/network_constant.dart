import 'package:ecom/core/config/app_config.dart';

abstract class NetworkConstants {
  NetworkConstants._();

  static const String baseUrl = AppConfig.baseUrl;
  static const String authority = AppConfig.authority;
  static const String apiPath = AppConfig.apiPath;

  static const Map<String, String> headers = {'Content-Type': 'application/json; charset=UTF-8'};

  static const int pageSize = 10;
}
