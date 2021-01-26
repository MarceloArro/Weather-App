class LocationException implements Exception {
  final String message;

  const LocationException(this.message);

  @override
  String toString() {
    return "Instancia de LocationException: $message";
  }
}
