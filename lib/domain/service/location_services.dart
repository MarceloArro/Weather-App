import 'package:geolocator/geolocator.dart';
import 'package:latlng/latlng.dart';
import 'package:weather_flutter/domain/exception/location_exception.dart';

class LocationService {
  Position _position;
  LatLng _location;
  String _city;

  LatLng get location => _location;
  String get city => _city;

  Future getAllLocationData() async {
    try {
      if (await checkGPSStatus()) {
        await getCurrentPosition();
        await getCurrentLocation();
      } else {
        throw const LocationException("El gps no se encuentra activado");
      }
    } on Exception {
      throw const LocationException("Error al obtener toda la información ");
    }
  }

  Future<bool> checkGPSStatus() async {
    try {
      return await Geolocator.isLocationServiceEnabled();
    } on Exception {
      throw const LocationException("Error al verificar el estado del gps");
    }
  }

  Future getCurrentPosition() async {
    try {
      _position = await Geolocator.getCurrentPosition();
    } on Exception {
      _position = await Geolocator.getLastKnownPosition();
    }
  }

  Future getCurrentLocation() async {
    try {
      _location = LatLng(_position.latitude, _position.longitude);
    } on Exception {
      throw const LocationException("Error al obtener coordenadas");
    }
  }
}
