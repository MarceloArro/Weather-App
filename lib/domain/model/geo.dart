import 'localnames.dart';

class geo {
  String name;
  LocalNames localNames;
  double lat;
  double lon;
  String country;
  String state;

  geo({this.name, this.localNames, this.lat, this.lon, this.country, this.state});

  geo.fromJson(Map<String, dynamic> json) {
    name = json['name'] as String;
    localNames = json['local_names'] != null ? LocalNames.fromJson(json['local_names'] as Map<String, dynamic>) : null;
    lat = json['lat'] as double;
    lon = json['lon'] as double;
    country = json['country'] as String;
    state = json['state'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (localNames != null) {
      data['local_names'] = localNames.toJson();
    }
    data['lat'] = lat;
    data['lon'] = lon;
    data['country'] = country;
    data['state'] = state;
    return data;
  }
}
