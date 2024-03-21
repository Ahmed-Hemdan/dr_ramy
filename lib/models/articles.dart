class Articles {
  Articles({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });
  late final bool success;
  late final int statusCode;
  late final String message;
  late final List<Data> data;

  Articles.fromJson(Map<String, dynamic> json){
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
    required this.id,
    required this.image,
    this.category,
    required this.title,
    required this.brief,
    required this.body,
    required this.createdAt,
  });
  late final int id;
  late final String image;
  late final String? category;
  late final String title;
  late final String brief;
  late final String body;
  late final String createdAt;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    image = json['image'];
    category = null;
    title = json['title'];
    brief = json['brief'];
    body = json['body'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['image'] = image;
    _data['category'] = category;
    _data['title'] = title;
    _data['brief'] = brief;
    _data['body'] = body;
    _data['created_at'] = createdAt;
    return _data;
  }
}