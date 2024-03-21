class Web {
  Web({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });
  late final bool success;
  late final int statusCode;
  late final String message;
  late final List<Data> data;

  Web.fromJson(Map<String, dynamic> json){
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
    required this.image,
    required this.url,
    required this.title,
    required this.createdAt,
  });
  late final String image;
  late final String url;
  late final String title;
  late final String createdAt;

  Data.fromJson(Map<String, dynamic> json){
    image = json['image'];
    url = json['url'];
    title = json['title'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image'] = image;
    _data['url'] = url;
    _data['title'] = title;
    _data['created_at'] = createdAt;
    return _data;
  }
}