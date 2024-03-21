/// success : true
/// status_code : 200
/// message : "All Gallery Images Retrieved Successfully"
/// data : [{"id":1,"image_path":"https://drramyapp.be4maps.com/uploads/product/16399532521.jpg"},{"id":2,"image_path":"https://drramyapp.be4maps.com/uploads/product/16399532521.jpg"},{"id":3,"image_path":"https://drramyapp.be4maps.com/uploads/product/16399532521.jpg"},{"id":4,"image_path":"https://drramyapp.be4maps.com/uploads/product/16399532521.jpg"},{"id":5,"image_path":"https://drramyapp.be4maps.com/uploads/product/16399532521.jpg"},{"id":6,"image_path":"https://drramyapp.be4maps.com/uploads/product/16399532521.jpg"}]

class GalleryModel {
  GalleryModel({
      bool? success, 
      int? statusCode, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  GalleryModel.fromJson(dynamic json) {
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
/// image_path : "https://drramyapp.be4maps.com/uploads/product/16399532521.jpg"

class Data {
  Data({
      int? id, 
      String? imagePath,}){
    _id = id;
    _imagePath = imagePath;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _imagePath = json['image_path'];
  }
  int? _id;
  String? _imagePath;

  int? get id => _id;
  String? get imagePath => _imagePath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image_path'] = _imagePath;
    return map;
  }

}