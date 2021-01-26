class ApiResources {
  ApiResources._();

  /// Host of weather api
  static const String _host = 'http://api.openweathermap.org';

  /// versions of data
  static const String _dataVersion = '2.5';

  /// version of georeference
  static const String _geoVersion = '2.5';

  /// common data url
  static const String _data = '$_host/data/$_dataVersion';

  ///common georeference url
  static const String _geo = '$_host/geo/$_geoVersion/';

  /// Call all data posible by coordinates with diferent options
  ///
  ///Use [lat] to send latitude
  ///
  ///Use [lon] to send longitude
  ///
  ///Use [appid] to send the auth token
  ///
  /// Use [units] to change the data format:
  /// [metric] | [imperial]
  ///
  ///Use [exclude] to exclude a data on the response
  ///[current] | [minutely] | [hourly] | [daily] | [alerts]
  ///
  ///Example query [onecall?lat={{lat}}&lon={{long}}&exclude=current&appid={{ _.apikey }}]
  static const String oneCall = '$_data/onecall';

  static const String historical = '$oneCall/timemachine';
  static const String currentWeather = '$_data/weather';

  /// Get city name on different [localnames]  and [country code] by [city]
  ///
  ///Use [city] to send actual city name
  ///also you cand add a country code[  city,countryCode]
  ///
  ///Use [appid] to send the auth token
  ///
  static const String directGeo = '$_geo/direct';

  /// Get city name on different [localnames]  and [country code] by [lat][long]
  ///
  ///Use [lat] to send latitude
  ///
  ///Use [lon] to send longitude
  ///
  ///Use [appid] to send the auth token
  ///
  static const String reversedGeo = '$_geo/reverse';
}
