class AppCustomException implements Exception {
  final String message;
  AppCustomException(this.message);
  @override
  String toString() => message;
}
