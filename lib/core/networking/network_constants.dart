class NetworkConstants {
  static const String contentType = 'application/json';
  static const String baseUrl = 'https://dummyjson.com';
  static const String productEndPoint = '$baseUrl/products';

  static const Duration connectTimeout = Duration(seconds: 10);
  static const Duration recieveTimeout = Duration(seconds: 10);

  static const String serviceError = 'Service Error';
  static const String unexpectedFormat = 'Unepxected Format';
}
