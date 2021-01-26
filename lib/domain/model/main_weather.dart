class MainWeather {
  double temp;
  double feelsLike;
  double tempMin;
  double tempMax;
  int pressure;
  int humidity;

  MainWeather({this.temp, this.feelsLike, this.tempMin, this.tempMax, this.pressure, this.humidity});

  MainWeather.fromJson(Map<String, dynamic> json) {
    temp = json['temp'] as double;
    feelsLike = json['feels_like'] as double;
    tempMin = json['temp_min'] as double;
    tempMax = json['temp_max'] as double;
    pressure = json['pressure'] as int;
    humidity = json['humidity'] as int;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['temp'] = temp;
    data['feels_like'] = feelsLike;
    data['temp_min'] = tempMin;
    data['temp_max'] = tempMax;
    data['pressure'] = pressure;
    data['humidity'] = humidity;
    return data;
  }
}
