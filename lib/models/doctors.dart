/// success : true
/// status_code : 200
/// message : "Doctors Have Retrieved Successfully."
/// data : [{"id":1,"name":"mahmoud gad","job_title":"heart specialist","bio":"Lorem Ipsum is simply dummy text of the printing and typesetting industry","image":"https://drramyapp.be4maps.com/uploads/doctor/1632738420f1005f381f58665fe36f112a0a63ca1d.jpg","created_at":"3 months ago"},{"id":2,"name":"7oda Gad","job_title":"surgeon","bio":"is simply dummy text of the printing and typesetting industry.","image":"https://drramyapp.be4maps.com/uploads/doctor/16326511124fb5e1d07ca541be158950f859054555.jpg","created_at":"3 months ago"}]

class Doctors {
  Doctors({
      bool? success, 
      int? statusCode, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  Doctors.fromJson(dynamic json) {
    _success = json['success'];
    _statusCode = json['status_code'];
    _message = json['message'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  bool? _success;
  int? _statusCode;
  String? _message;
  List<Data>? _data;

  bool? get success => _success;
  int? get statusCode => _statusCode;
  String? get message => _message;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['status_code'] = _statusCode;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : 1
/// name : "mahmoud gad"
/// job_title : "heart specialist"
/// bio : "Lorem Ipsum is simply dummy text of the printing and typesetting industry"
/// image : "https://drramyapp.be4maps.com/uploads/doctor/1632738420f1005f381f58665fe36f112a0a63ca1d.jpg"
/// created_at : "3 months ago"

class Data {
  Data({
      int? id, 
      String? name, 
      String? jobTitle, 
      String? bio, 
      String? image, 
      String? createdAt,}){
    _id = id;
    _name = name;
    _jobTitle = jobTitle;
    _bio = bio;
    _image = image;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _jobTitle = json['job_title'];
    _bio = json['bio'];
    _image = json['image'];
    _createdAt = json['created_at'];
  }
  int? _id;
  String? _name;
  String? _jobTitle;
  String? _bio;
  String? _image;
  String? _createdAt;

  int? get id => _id;
  String? get name => _name;
  String? get jobTitle => _jobTitle;
  String? get bio => _bio;
  String? get image => _image;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['job_title'] = _jobTitle;
    map['bio'] = _bio;
    map['image'] = _image;
    map['created_at'] = _createdAt;
    return map;
  }

}