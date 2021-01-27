import 'package:flutter/foundation.dart';

class OneCallRequest {
  double latitude;
  double longitud;
  String units;
  List<String> exclude;

  OneCallRequest({@required this.latitude, @required this.longitud, this.units = "metrics", this.exclude});

  OneCallRequest.fromJson(Map<String, dynamic> json) {
    latitude = json['lat'] as double;
    longitud = json['lon'] as double;
    units = json['units'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = latitude;
    data['lon'] = longitud;
    data[units] = units;
    data['exclude'] = exclude;
    return data;
  }
}
