abstract class AppConfig {
  AppConfig._();

  static const env = String.fromEnvironment('APP_ENV', defaultValue: 'dev');

  static const baseUrl = String.fromEnvironment(
    'BASE_URL',
    defaultValue: 'http://127.0.0.1:3000/api/v1',
  );

  static const authority = String.fromEnvironment(
    'AUTHORITY',
    defaultValue: '127.0.0.1:3000',
  );

  static const apiPath = String.fromEnvironment(
    'API_PATH',
    defaultValue: '/api/v1',
  );

  static const appName = String.fromEnvironment('APP_NAME', defaultValue: 'Ecom');

  static bool get isProduction => env == 'prod';
  static bool get isDevelopment => env == 'dev';
}
