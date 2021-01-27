class NetworkException implements Exception {
  final String message;

  const NetworkException(this.message);

  @override
  String toString() {
    return "Instancia de NetworkException: $message";
  }
}
