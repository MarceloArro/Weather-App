import 'package:dio/dio.dart';
import 'package:weather_flutter/domain/exception/network_exception.dart';

class HttpService {
  final _dio = Dio();

  final _token = "a73303264898e9b72c1e28cd3cfac02f";

  HttpService() {
    _dio.interceptors.add(
      LogInterceptor(responseBody: true),
    );
  }

  Future<dynamic> getHttpUrlParams(String route, Map<String, dynamic> urlData) async {
    Response response;
    urlData['token'] = _token;

    try {
      response = await _dio.get(route, queryParameters: urlData);
    } on DioError catch (e) {
      throw NetworkException(e.message);
    }

    return response.data;
  }

  void dispose() {
    _dio.clear();
    _dio.close(force: true);
  }
}
