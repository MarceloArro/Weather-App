import 'package:latlng/latlng.dart';
import 'package:weather_flutter/domain/request/one_call_request.dart';
import 'package:weather_flutter/domain/response/current_response.dart';
import 'package:weather_flutter/domain/response/geo_response.dart';
import 'package:weather_flutter/domain/response/onecall_response.dart';

abstract class ApiRepositoryInterface {
  Future<CurrentResponse> getCurrentWeatherByLocation(LatLng location);
  Future<CurrentResponse> getCurrentWeatherByCityName(String city);
  Future<GeoResponse> getCityLocalizatinNameByDirect(String city);
  Future<GeoResponse> getCityLocalizatinNameByindirect(LatLng location);
  Future<OneCallResponse> getOneCallData(OneCallRequest oneCallRequest);
}
