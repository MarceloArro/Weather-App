import 'package:latlng/latlng.dart';
import 'package:weather_flutter/domain/model/main_weather.dart';
import 'package:weather_flutter/domain/model/sys.dart';
import 'package:weather_flutter/domain/model/weather.dart';
import 'package:weather_flutter/domain/model/wind.dart';

class CurrentResponse {
  LatLng coord;
  List<Weather> weather;
  String base;
  MainWeather main;
  int visibility;
  Wind wind;
  Clouds clouds;
  int dt;
  Sys sys;
  int timezone;
  int id;
  String name;
  int cod;

  CurrentResponse(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  CurrentResponse.fromJson(Map<String, dynamic> json) {
    coord = json['coord'] != null ? LatLng(json['coord']['lat'] as double, json['coord']['lon'] as double) : null;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather.add(Weather.fromJson(v as Map<String, dynamic>));
      });
    }
    base = json['base'] as String;
    main = json['main'] != null ? MainWeather.fromJson(json['main'] as Map<String, dynamic>) : null;
    visibility = json['visibility'] as int;
    wind = json['wind'] != null ? Wind.fromJson(json['wind'] as Map<String, dynamic>) : null;
    clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds'] as Map<String, dynamic>) : null;
    dt = json['dt'] as int;
    sys = json['sys'] != null ? Sys.fromJson(json['sys'] as Map<String, dynamic>) : null;
    timezone = json['timezone'] as int;
    id = json['id'] as int;
    name = json['name'] as String;
    cod = json['cod'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (coord != null) {
      data['coord'] = coord;
    }
    if (weather != null) {
      data['weather'] = weather.map((v) => v.toJson()).toList();
    }
    data['base'] = base;
    if (main != null) {
      data['main'] = main.toJson();
    }
    data['visibility'] = visibility;
    if (wind != null) {
      data['wind'] = wind.toJson();
    }
    if (clouds != null) {
      data['clouds'] = clouds.toJson();
    }
    data['dt'] = dt;
    if (sys != null) {
      data['sys'] = sys.toJson();
    }
    data['timezone'] = timezone;
    data['id'] = id;
    data['name'] = name;
    data['cod'] = cod;
    return data;
  }
}
