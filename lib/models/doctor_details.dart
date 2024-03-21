class DoctorDetailsModel {
  DoctorDetailsModel({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });
  late final bool success;
  late final int statusCode;
  late final String message;
  late final Data data;

  DoctorDetailsModel.fromJson(Map<String, dynamic> json){
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
    required this.id,
    required this.name,
    required this.jobTitle,
    required this.bio,
    required this.image,
    required this.images,
    required this.phone,
    this.email,
    required this.createdAt,
  });
  late final int id;
  late final String name;
  late final String jobTitle;
  late final String bio;
  late final String image;
  late final List<String> images;
  late final String phone;
  late final Null email;
  late final String createdAt;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    jobTitle = json['job_title'];
    bio = json['bio'];
    image = json['image'];
    images = List.castFrom<dynamic, String>(json['images']);
    phone = json['phone'];
    email = null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['job_title'] = jobTitle;
    _data['bio'] = bio;
    _data['image'] = image;
    _data['images'] = images;
    _data['phone'] = phone;
    _data['email'] = email;
    _data['created_at'] = createdAt;
    return _data;
  }
}