class Weather {
  int id;
  String main;
  String description;

  Weather({this.id, this.main, this.description});

  Weather.fromJson(Map<String, dynamic> json) {
    id = json['id'] as int;
    main = json['main'] as String;
    description = json['description'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['main'] = main;
    data['description'] = description;
    return data;
  }
}
