/// success : true
/// status_code : 200
/// message : "All Addresses Retrieved Successfully"
/// data : ["78- عمارات رابعة الاستثماري - مدينة نصر - القاهرة","78- عمارات رابعة الاستثماري - مدينة نصر - القاهرة","78- عمارات رابعة الاستثماري - مدينة نصر - القاهرة"]

class Address {
  Address({
      bool? success, 
      int? statusCode, 
      String? message, 
      List<String>? data,}){
    _success = success;
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  Address.fromJson(dynamic json) {
    _success = json['success'];
    _statusCode = json['status_code'];
    _message = json['message'];
    _data = json['data'] != null ? json['data'].cast<String>() : [];
  }
  bool? _success;
  int? _statusCode;
  String? _message;
  List<String>? _data;

  bool? get success => _success;
  int? get statusCode => _statusCode;
  String? get message => _message;
  List<String>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['status_code'] = _statusCode;
    map['message'] = _message;
    map['data'] = _data;
    return map;
  }

}