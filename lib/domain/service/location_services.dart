import 'package:geolocator/geolocator.dart';
import 'package:latlng/latlng.dart';
import 'package:weather_flutter/domain/exception/location_exception.dart';
import 'package:weather_flutter/domain/model/lat_lon.dart';

class LocationService {
  Position _position;
  LatLng _location;
  String _direction = Strings.directionIncidenceHint;

  String get direction => _direction;
  LatLng get location => _location;

  Future<bool> checkGPSStatus() async {
    try {
      return await Geolocator.isLocationServiceEnabled();
    } on Exception {
      throw const LocationException("Error al obtener posición ");
    }
  }

  Future getAllLocationData() async {
    try {
      if (await checkGPSStatus()) {
        await getCurrentPosition();
        await getCurrentLocation();
        await getCurrentDirection();
      } else {
        _direction = "GPS no activado, seleccione la ubicación.";
        throw const LocationException("El gps no se encuentra activado");
      }
    } on Exception {
      throw const LocationException("Error al obtener toda la información ");
    }
  }

  Future getCurrentPosition() async {
    try {
      _position = await Geolocator.getCurrentPosition();
    } on Exception {
      throw const LocationException("Error al obtener posición ");
    }
  }

  Future getCurrentLocation() async {
    try {
      _location = LatLng(_position.latitude, _position.longitude);
    } on Exception {
      throw const LocationException("Error al obtener coordenadas");
    }
  }

  Future getCurrentDirection() async {
    try {
      final List<Placemark> placeMark =
          await Geolocator.placemarkFromCoordinates(_location.latitude, _location.longitude, localeIdentifier: "es_CL");
      _direction = "${placeMark[0].thoroughfare} ${placeMark[0].subThoroughfare}";
    } on Exception {
      throw const LocationException("Error al obtener la dirección");
    }
  }

  Future<Map<String, dynamic>> searchDirection(String address) async {
    try {
      final List<Placemark> placeMark =
          await _geolocator.placemarkFromAddress("$address, Temuco", localeIdentifier: "es_CL");

      if (placeMark[0].administrativeArea == "Araucanía" && placeMark[0].subAdministrativeArea == "Cautín") {
        return {
          "direction": "${placeMark[0].thoroughfare} ${placeMark[0].subThoroughfare}",
          "lat": placeMark[0].position.latitude,
          "long": placeMark[0].position.longitude
        };
      }
      throw const LocationException("La dirección ingresada no pertenece a Temuco");
    } on LocationException catch (e) {
      throw LocationException(e.message);
    } on Exception {
      throw const LocationException("No se pudo obtener la dirección");
    }
  }

  Future<Position> getCurrentTemporalPosition() async {
    try {
      if (await checkGPSStatus()) {
        return await Geolocator.getCurrentPosition();
      }
      throw const LocationException("El GPS no esta activado ");
    } on Exception {
      throw const LocationException("No se pudo obtener la ubicación ");
    }
  }

  Future<String> getTemporalDirection(LatLng temp) async {
    try {
      final List<Placemark> placeMark = await Geolocator.placemarkFromCoordinates(temp.latitude, temp.longitude);
      final String data = "${placeMark[0].thoroughfare} ${placeMark[0].subThoroughfare}";

      if (data.trim().isNotEmpty) {
        if (data.toLowerCase().trim() == "unnamed road") {
          return "Temuco";
        }
        return data;
      }
      return "Temuco";
    } on Exception {
      throw const LocationException("Error al obtener la dirección");
    }
  }

  Future setData(LatLng newLocation) async {
    _location = newLocation;
    _direction = await getTemporalDirection(_location);
  }

  Future checkLocality() async {
    try {
      final List<Placemark> placeMark =
          await Geolocator.placemarkFromCoordinates(_location.latitude, _location.longitude, localeIdentifier: "es_CL");
      if (placeMark[0].locality.toLowerCase().trim() != "temuco") {
        throw const LocationException("No se encuentra en Temuco");
      }
    } on PlatformException {
      throw const LocationException("No se pudo encontrar ninguna ubicación");
    } on LocationException catch (e) {
      throw LocationException(e.message);
    }
  }

  Future<void> checkPlacemarkAndStatus() async {
    try {
      if (await checkGPSStatus()) {
        await getCurrentPosition();

        final GeolocationStatus permissions = await Geolocator.checkGeolocationPermissionStatus();

        if (permissions.value != 2) {
          throw const LocationException("No tiene el permiso de ubicación activado");
        }
        await getCurrentLocation();
        await checkLocality();
        return;
      } else {
        throw const LocationException("La ubicación GPS se encuentra desactivada");
      }
    } on LocationException catch (e) {
      print("Error service ${e.message}");
      throw LocationException(e.message);
    }
  }
}
