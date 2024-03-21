class VideosModel {
  VideosModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });
  late final bool success;
  late final int statusCode;
  late final String message;
  late final List<Data> data;

  VideosModel.fromJson(Map<String, dynamic> json){
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
    required this.url,
    required this.image,
    required this.title,
    required this.brief,
    required this.description,
  });
  late final String url;
  late final String image;
  late final String title;
  late final String brief;
  late final String description;

  Data.fromJson(Map<String, dynamic> json){
    url = json['url'];
    image = json['image'];
    title = json['title'];
    brief = json['brief'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['url'] = url;
    _data['image'] = image;
    _data['title'] = title;
    _data['brief'] = brief;
    _data['description'] = description;
    return _data;
  }
}