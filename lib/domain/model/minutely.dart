class Minutely {
  int dt;
  double precipitation;

  Minutely({this.dt, this.precipitation});

  Minutely.fromJson(Map<String, dynamic> json) {
    dt = json['dt'] as int;
    precipitation = json['precipitation'] as double;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dt'] = dt;
    data['precipitation'] = precipitation;
    return data;
  }
}
