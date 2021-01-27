import 'package:get_it/get_it.dart';
import 'package:weather_flutter/data/datasource/weather/api_repository_impl.dart';
import 'package:weather_flutter/domain/repository/api_repository.dart';
import 'package:weather_flutter/domain/service/http_service.dart';
import 'package:weather_flutter/domain/service/location_services.dart';

final _injector = GetIt.instance;

void setupLocator() {
  ///Services implementations

  _injector.registerLazySingleton<HttpService>(() => HttpService());
  _injector.registerLazySingleton<LocationService>(() => LocationService());

  _injector.registerLazySingleton<ApiRepositoryInterface>(() => ApiRepositoryImpl(_injector<HttpService>()));
}
