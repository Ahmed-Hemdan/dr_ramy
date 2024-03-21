class Sliders {
  Sliders({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });
  late final bool success;
  late final int statusCode;
  late final String message;
  late final List<Data> data;

  Sliders.fromJson(Map<String, dynamic> json){
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['status_code'] = statusCode;
    _data['message'] = message;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.imagePath,
    required this.title,
    required this.brief,
    required this.description,
  });
  late final String imagePath;
  late final String title;
  late final String brief;
  late final String description;

  Data.fromJson(Map<String, dynamic> json){
    imagePath = json['image_path'];
    title = json['title'];
    brief = json['brief'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image_path'] = imagePath;
    _data['title'] = title;
    _data['brief'] = brief;
    _data['description'] = description;
    return _data;
  }
}