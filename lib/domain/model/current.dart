import 'weather.dart';

class Current {
  int dt;
  int sunrise;
  int sunset;
  double temp;
  double feelsLike;
  int pressure;
  int humidity;
  double dewPoint;
  double uvi;
  int clouds;
  int visibility;
  double windSpeed;
  int windDeg;
  List<Weather> weather;

  Current(
      {this.dt,
      this.sunrise,
      this.sunset,
      this.temp,
      this.feelsLike,
      this.pressure,
      this.humidity,
      this.dewPoint,
      this.uvi,
      this.clouds,
      this.visibility,
      this.windSpeed,
      this.windDeg,
      this.weather});

  Current.fromJson(Map<String, dynamic> json) {
    dt = json['dt'] as int;
    sunrise = json['sunrise'] as int;
    sunset = json['sunset'] as int;
    temp = json['temp'] as double;
    feelsLike = json['feels_like'] as double;
    pressure = json['pressure'] as int;
    humidity = json['humidity'] as int;
    dewPoint = json['dew_point'] as double;
    uvi = json['uvi'] as double;
    clouds = json['clouds'] as int;
    visibility = json['visibility'] as int;
    windSpeed = json['wind_speed'] as double;
    windDeg = json['wind_deg'] as int;

    if (json['weather'] != null) {
      weather = <Weather>[];
      json['weather'].forEach(
        (v) {
          weather.add(Weather.fromJson(v as Map<String, dynamic>));
        },
      );
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    data['sunrise'] = sunrise;
    data['sunset'] = sunset;
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    data['dew_point'] = dewPoint;
    data['uvi'] = uvi;
    data['clouds'] = clouds;
    data['visibility'] = visibility;
    data['wind_speed'] = windSpeed;
    data['wind_deg'] = windDeg;
    if (weather != null) {
      data['weather'] = weather.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
