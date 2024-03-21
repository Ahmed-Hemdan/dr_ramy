class RegisterFailed {
  RegisterFailed({
    required this.success,
    required this.statusCode,
    required this.message,
  });
  late final bool success;
  late final int statusCode;
  late final String message;

  RegisterFailed.fromJson(Map<String, dynamic> json){
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['success'] = success;
    _data['status_code'] = statusCode;
    _data['message'] = message;
    return _data;
  }
}