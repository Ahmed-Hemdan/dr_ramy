/// success : true
/// status_code : 200
/// message : "All User Weights Have Retrieved Successfully."
/// data : [{"id":29,"user_id":8,"weight":"100","weight_date":"2022-01-17","created_at":"4 days ago"},{"id":28,"user_id":8,"weight":"115","weight_date":"2021-12-15","created_at":"1 week ago"},{"id":27,"user_id":8,"weight":"115","weight_date":"2021-11-15","created_at":"1 week ago"},{"id":26,"user_id":8,"weight":"120","weight_date":null,"created_at":"1 week ago"},{"id":25,"user_id":8,"weight":"100","weight_date":null,"created_at":"1 week ago"},{"id":24,"user_id":8,"weight":"30","weight_date":null,"created_at":"1 week ago"},{"id":23,"user_id":8,"weight":"40","weight_date":null,"created_at":"1 week ago"},{"id":22,"user_id":8,"weight":"40","weight_date":null,"created_at":"1 week ago"},{"id":21,"user_id":8,"weight":"90","weight_date":null,"created_at":"1 week ago"},{"id":20,"user_id":8,"weight":"300","weight_date":null,"created_at":"1 week ago"},{"id":19,"user_id":8,"weight":"300","weight_date":null,"created_at":"1 week ago"},{"id":18,"user_id":8,"weight":"300","weight_date":null,"created_at":"1 week ago"},{"id":17,"user_id":8,"weight":"300","weight_date":null,"created_at":"1 week ago"},{"id":16,"user_id":8,"weight":"90","weight_date":null,"created_at":"1 week ago"},{"id":15,"user_id":8,"weight":"90","weight_date":null,"created_at":"1 week ago"},{"id":14,"user_id":8,"weight":"150","weight_date":null,"created_at":"1 week ago"},{"id":13,"user_id":8,"weight":"150","weight_date":null,"created_at":"1 week ago"},{"id":12,"user_id":8,"weight":"120","weight_date":null,"created_at":"1 week ago"},{"id":11,"user_id":8,"weight":"120","weight_date":null,"created_at":"1 week ago"},{"id":10,"user_id":8,"weight":"70","weight_date":null,"created_at":"1 week ago"},{"id":9,"user_id":8,"weight":"70","weight_date":null,"created_at":"1 week ago"},{"id":8,"user_id":8,"weight":"90","weight_date":null,"created_at":"1 week ago"},{"id":7,"user_id":8,"weight":"90","weight_date":null,"created_at":"1 week ago"},{"id":6,"user_id":8,"weight":"90","weight_date":null,"created_at":"2 weeks ago"},{"id":5,"user_id":8,"weight":"115","weight_date":null,"created_at":"2 weeks ago"},{"id":4,"user_id":8,"weight":"115","weight_date":null,"created_at":"2 weeks ago"}]

class UserWeight {
  UserWeight({
      bool? success, 
      int? statusCode, 
      String? message, 
      List<Data>? data,}){
    _success = success;
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  UserWeight.fromJson(dynamic json) {
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

/// id : 29
/// user_id : 8
/// weight : "100"
/// weight_date : "2022-01-17"
/// created_at : "4 days ago"

class Data {
  Data({
      int? id, 
      int? userId, 
      String? weight, 
      String? weightDate, 
      String? createdAt,}){
    _id = id;
    _userId = userId;
    _weight = weight;
    _weightDate = weightDate;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _userId = json['user_id'];
    _weight = json['weight'];
    _weightDate = json['weight_date'];
    _createdAt = json['created_at'];
  }
  int? _id;
  int? _userId;
  String? _weight;
  String? _weightDate;
  String? _createdAt;

  int? get id => _id;
  int? get userId => _userId;
  String? get weight => _weight;
  String? get weightDate => _weightDate;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['user_id'] = _userId;
    map['weight'] = _weight;
    map['weight_date'] = _weightDate;
    map['created_at'] = _createdAt;
    return map;
  }

}