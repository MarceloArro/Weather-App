import 'fellslike.dart';
import 'temp.dart';
import 'weather.dart';

class Daily {
  int dt;
  int sunrise;
  int sunset;
  Temp temp;
  FeelsLike feelsLike;
  int pressure;
  int humidity;
  double dewPoint;
  double windSpeed;
  int windDeg;
  List<Weather> weather;
  int clouds;
  double pop;
  double uvi;
  double rain;
  double snow;

  Daily(
      {this.dt,
      this.sunrise,
      this.sunset,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.windSpeed,
      this.windDeg,
      this.weather,
      this.clouds,
      this.pop,
      this.uvi});

  Daily.fromJson(Map<String, dynamic> json) {
    dt = json['dt'] as int;
    sunrise = json['sunrise'] as int;
    sunset = json['sunset'] as int;
    temp = json['temp'] != null ? Temp.fromJson(json['temp'] as Map<String, dynamic>) : null;
    feelsLike = json['feels_like'] != null ? FeelsLike.fromJson(json['feels_like'] as Map<String, dynamic>) : null;
    pressure = json['pressure'] as int;
    humidity = json['humidity'] as int;
    dewPoint = json['dew_point'] as double;
    windSpeed = json['wind_speed'] as double;
    windDeg = json['wind_deg'] as int;
    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach((v) {
        weather.add(Weather.fromJson(v as Map<String, dynamic>));
      });
    }
    clouds = json['clouds'] as int;

    pop = json['pop'] as double;
    uvi = json['uvi'] as double;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    if (temp != null) {
      data['temp'] = temp.toJson();
    }
    if (feelsLike != null) {
      data['feels_like'] = feelsLike.toJson();
    }
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['dew_point'] = dewPoint;
    data['wind_speed'] = windSpeed;
    data['wind_deg'] = windDeg;
    if (weather != null) {
      data['weather'] = weather.map((v) => v.toJson()).toList();
    }
    data['clouds'] = clouds;
    data['pop'] = pop;
    data['uvi'] = uvi;
    return data;
  }
}
