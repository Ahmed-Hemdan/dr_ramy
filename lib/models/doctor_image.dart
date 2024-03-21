class DoctorImage {
  DoctorImage({
    required this.success,
    required this.statusCode,
    required this.message,
    required this.data,
  });
  late final bool success;
  late final int statusCode;
  late final String message;
  late final Data data;

  DoctorImage.fromJson(Map<String, dynamic> json){
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
    required this.image,
  });
  late final String image;

  Data.fromJson(Map<String, dynamic> json){
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image'] = image;
    return _data;
  }
}