class Search {
  Search({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });
  late final bool success;
  late final int statusCode;
  late final String message;
  late final List<Data> data;

  Search.fromJson(Map<String, dynamic> json){
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
    required this.title,
    required this.brief,
    required this.searchType,
    required this.createdAt,
  });
  late final int id;
  late final String image;
  late final String title;
  late final String brief;
  late final String searchType;
  late final String createdAt;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    image = json['image'];
    title = json['title'];
    brief = json['brief'];
    searchType = json['search_type'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['image'] = image;
    _data['title'] = title;
    _data['brief'] = brief;
    _data['search_type'] = searchType;
    _data['created_at'] = createdAt;
    return _data;
  }
}