class LoginModel {
  LoginModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });
  late final bool success;
  late final int statusCode;
  late final String message;
  late final Data data;

  LoginModel.fromJson(Map<String, dynamic> json){
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['status_code'] = statusCode;
    _data['message'] = message;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.userInfo,
    required this.token,
  });
  late final UserInfo userInfo;
  late final String token;

  Data.fromJson(Map<String, dynamic> json){
    userInfo = UserInfo.fromJson(json['user_info']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_info'] = userInfo.toJson();
    _data['token'] = token;
    return _data;
  }
}

class UserInfo {
  UserInfo({
    required this.id,
    required this.name,
    required this.phone,
    required this.operationDate,
    required this.daysNumber,
    required this.height,
    required this.weight,
    required this.imagePath,
    this.lang,
    required this.createdAt,
  });
  late final int id;
  late final String name;
  late final String phone;
  late final String? operationDate;
  late final int daysNumber;
  late final String height;
  late final String weight;
  late final String imagePath;
  late final Null lang;
  late final String createdAt;

  UserInfo.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    operationDate = json['operation_date'] ?? null;
    daysNumber = json['days_number'];
    height = json['height'];
    weight = json['weight'];
    imagePath = json['image_path'];
    lang = null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['phone'] = phone;
    _data['operation_date'] = operationDate;
    _data['days_number'] = daysNumber;
    _data['height'] = height;
    _data['weight'] = weight;
    _data['image_path'] = imagePath;
    _data['lang'] = lang;
    _data['created_at'] = createdAt;
    return _data;
  }
}