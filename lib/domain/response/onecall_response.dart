import 'package:weather_flutter/domain/model/current.dart';
import 'package:weather_flutter/domain/model/daily.dart';
import 'package:weather_flutter/domain/model/hourly.dart';
import 'package:weather_flutter/domain/model/minutely.dart';

class OneCallResponse {
  double lat;
  double lon;
  String timezone;
  int timezoneOffset;
  Current current;
  List<Minutely> minutely;
  List<Hourly> hourly;
  List<Daily> daily;

  OneCallResponse(
      {this.lat, this.lon, this.timezone, this.timezoneOffset, this.current, this.minutely, this.hourly, this.daily});

  OneCallResponse.fromJson(Map<String, dynamic> json) {
    lat = json['lat'] as double;
    lon = json['lon'] as double;
    timezone = json['timezone'] as String;
    timezoneOffset = json['timezone_offset'] as int;
    current = json['current'] != null ? Current.fromJson(json['current'] as Map<String, dynamic>) : null;
    if (json['minutely'] != null) {
      minutely = <Minutely>[];
      json['minutely'].forEach((v) {
        minutely.add(Minutely.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['hourly'] != null) {
      hourly = <Hourly>[];
      json['hourly'].forEach((v) {
        hourly.add(Hourly.fromJson(v as Map<String, dynamic>));
      });
    }
    if (json['daily'] != null) {
      daily = <Daily>[];
      json['daily'].forEach((v) {
        daily.add(Daily.fromJson(v as Map<String, dynamic>));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lon'] = lon;
    data['timezone'] = timezone;
    data['timezone_offset'] = timezoneOffset;
    if (current != null) {
      data['current'] = current.toJson();
    }
    if (minutely != null) {
      data['minutely'] = minutely.map((v) => v.toJson()).toList();
    }
    if (hourly != null) {
      data['hourly'] = hourly.map((v) => v.toJson()).toList();
    }
    if (daily != null) {
      data['daily'] = daily.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
