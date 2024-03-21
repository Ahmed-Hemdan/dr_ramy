/// success : true
/// status_code : 200
/// message : "All Contact Info Retrieved Successfully."
/// data : {"phone":"0228124305","email":"mahmoudgad672@gmail.com","whatsapp":"+201004996929","messanger":"https://www.facebook.com/almeswak26","location":"https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d13810.273315112216!2d31.342725649999995!3d30.077905700000002!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sar!2seg!4v1565798249797!5m2!1sar!2seg","latitude":30.076893999999999351757651311345398426055908203125,"longitude":31.234286000000000882437234395183622837066650390625}

class Contact {
  Contact({
      bool? success, 
      int? statusCode, 
      String? message, 
      Data? data,}){
    _success = success;
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  Contact.fromJson(dynamic json) {
    _success = json['success'];
    _statusCode = json['status_code'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  int? _statusCode;
  String? _message;
  Data? _data;

  bool? get success => _success;
  int? get statusCode => _statusCode;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['status_code'] = _statusCode;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}
/// phone : "0228124305"
/// email : "mahmoudgad672@gmail.com"
/// whatsapp : "+201004996929"
/// messanger : "https://www.facebook.com/almeswak26"
/// location : "https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d13810.273315112216!2d31.342725649999995!3d30.077905700000002!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sar!2seg!4v1565798249797!5m2!1sar!2seg"
/// latitude : 30.076893999999999351757651311345398426055908203125
/// longitude : 31.234286000000000882437234395183622837066650390625

class Data {
  Data({
      String? phone, 
      String? email, 
      String? whatsapp, 
      String? messanger, 
      String? location, 
      double? latitude, 
      double? longitude,}){
    _phone = phone;
    _email = email;
    _whatsapp = whatsapp;
    _messanger = messanger;
    _location = location;
    _latitude = latitude;
    _longitude = longitude;
}

  Data.fromJson(dynamic json) {
    _phone = json['phone'];
    _email = json['email'];
    _whatsapp = json['whatsapp'];
    _messanger = json['messanger'];
    _location = json['location'];
    _latitude = json['latitude'];
    _longitude = json['longitude'];
  }
  String? _phone;
  String? _email;
  String? _whatsapp;
  String? _messanger;
  String? _location;
  double? _latitude;
  double? _longitude;

  String? get phone => _phone;
  String? get email => _email;
  String? get whatsapp => _whatsapp;
  String? get messanger => _messanger;
  String? get location => _location;
  double? get latitude => _latitude;
  double? get longitude => _longitude;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = _phone;
    map['email'] = _email;
    map['whatsapp'] = _whatsapp;
    map['messanger'] = _messanger;
    map['location'] = _location;
    map['latitude'] = _latitude;
    map['longitude'] = _longitude;
    return map;
  }

}