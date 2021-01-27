// ignore: implementation_imports
import 'package:latlng/src/latlng.dart';
import 'package:weather_flutter/domain/repository/api_repository.dart';
import 'package:weather_flutter/domain/response/onecall_response.dart';
import 'package:weather_flutter/domain/response/geo_response.dart';
import 'package:weather_flutter/domain/response/current_response.dart';
import 'package:weather_flutter/domain/request/one_call_request.dart';
import 'package:weather_flutter/domain/service/http_service.dart';

class ApiRepositoryImpl extends ApiRepositoryInterface {
  final HttpService _httpService;

  ApiRepositoryImpl(this._httpService) : assert(_httpService != null);

  @override
  Future<GeoResponse> getCityLocalizatinNameByDirect(String city) {
    // TODO: implement getCityLocalizatinNameByDirect
    throw UnimplementedError();
  }

  @override
  Future<GeoResponse> getCityLocalizatinNameByindirect(LatLng location) {
    // TODO: implement getCityLocalizatinNameByindirect
    throw UnimplementedError();
  }

  @override
  Future<CurrentResponse> getCurrentWeatherByCityName(String city) {
    // TODO: implement getCurrentWeatherByCityName
    throw UnimplementedError();
  }

  @override
  Future<CurrentResponse> getCurrentWeatherByLocation(LatLng location) {
    // TODO: implement getCurrentWeatherByLocation
    throw UnimplementedError();
  }

  @override
  Future<OneCallResponse> getOneCallData(OneCallRequest oneCallRequest) {
    // TODO: implement getOneCallData
    throw UnimplementedError();
  }
}
