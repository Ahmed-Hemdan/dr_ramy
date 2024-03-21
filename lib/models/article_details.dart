/// success : true
/// status_code : 200
/// message : "Blog Details Retrieved Successfully"
/// data : {"id":2,"image":"https://drramyapp.be4maps.com/uploads/product/16399534102.jpg","category":"dr ramy articles","title":"second blog","brief":"Lorem, ipsum dolor sit amet consectetur adipisicing elit. Libero eveniet alias voluptatibus odit..","body":"Lorem, ipsum dolor sit amet consectetur adipisicing elit. Libero eveniet alias voluptatibus odit error eligendi placeat ducimus architecto nisi repellendus fugit aspernatur modi, non nostrum quas soluta numquam temporibus ab. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Libero eveniet alias voluptatibus odit error eligendi placeat ducimus architecto nisi repellendus fugit aspernatur modi, non nostrum quas soluta numquam temporibus ab. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Libero eveniet alias voluptatibus odit error eligendi placeat ducimus architecto nisi repellendus fugit aspernatur modi, non nostrum quas soluta numquam temporibus ab. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Libero eveniet alias voluptatibus odit error eligendi placeat ducimus architecto nisi repellendus fugit aspernatur modi, non nostrum quas soluta numquam temporibus ab.\r\n\r\nmain h4 header\r\n\r\n\r\n\t\r\n\tLorem ipsum, dolor sit amet consectetur adipisicing elit. Blanditiis harum ea nemo velit vitae alias neque praesentium voluptates dolorum, id sint? Aliquid exercitationem eligendi pariatur enim similique incidunt quae quia.\r\n\t\r\n\t\r\n\tLorem ipsum, dolor sit amet consectetur adipisicing elit. Blanditiis harum ea nemo velit vitae alias neque praesentium voluptates dolorum, id sint? Aliquid exercitationem eligendi pariatur enim similique incidunt quae quia.\r\n\t\r\n","created_at":"2 years ago"}

class ArticleDetails {
  ArticleDetails({
      bool? success, 
      int? statusCode, 
      String? message, 
      Data? data,}){
    _success = success;
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  ArticleDetails.fromJson(dynamic json) {
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

/// id : 2
/// image : "https://drramyapp.be4maps.com/uploads/product/16399534102.jpg"
/// category : "dr ramy articles"
/// title : "second blog"
/// brief : "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Libero eveniet alias voluptatibus odit.."
/// body : "Lorem, ipsum dolor sit amet consectetur adipisicing elit. Libero eveniet alias voluptatibus odit error eligendi placeat ducimus architecto nisi repellendus fugit aspernatur modi, non nostrum quas soluta numquam temporibus ab. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Libero eveniet alias voluptatibus odit error eligendi placeat ducimus architecto nisi repellendus fugit aspernatur modi, non nostrum quas soluta numquam temporibus ab. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Libero eveniet alias voluptatibus odit error eligendi placeat ducimus architecto nisi repellendus fugit aspernatur modi, non nostrum quas soluta numquam temporibus ab. Lorem, ipsum dolor sit amet consectetur adipisicing elit. Libero eveniet alias voluptatibus odit error eligendi placeat ducimus architecto nisi repellendus fugit aspernatur modi, non nostrum quas soluta numquam temporibus ab.\r\n\r\nmain h4 header\r\n\r\n\r\n\t\r\n\tLorem ipsum, dolor sit amet consectetur adipisicing elit. Blanditiis harum ea nemo velit vitae alias neque praesentium voluptates dolorum, id sint? Aliquid exercitationem eligendi pariatur enim similique incidunt quae quia.\r\n\t\r\n\t\r\n\tLorem ipsum, dolor sit amet consectetur adipisicing elit. Blanditiis harum ea nemo velit vitae alias neque praesentium voluptates dolorum, id sint? Aliquid exercitationem eligendi pariatur enim similique incidunt quae quia.\r\n\t\r\n"
/// created_at : "2 years ago"

class Data {
  Data({
      int? id, 
      String? image, 
      String? category, 
      String? title, 
      String? brief, 
      String? body, 
      String? createdAt,}){
    _id = id;
    _image = image;
    _category = category;
    _title = title;
    _brief = brief;
    _body = body;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _image = json['image'];
    _category = json['category'];
    _title = json['title'];
    _brief = json['brief'];
    _body = json['body'];
    _createdAt = json['created_at'];
  }
  int? _id;
  String? _image;
  String? _category;
  String? _title;
  String? _brief;
  String? _body;
  String? _createdAt;

  int? get id => _id;
  String? get image => _image;
  String? get category => _category;
  String? get title => _title;
  String? get brief => _brief;
  String? get body => _body;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['image'] = _image;
    map['category'] = _category;
    map['title'] = _title;
    map['brief'] = _brief;
    map['body'] = _body;
    map['created_at'] = _createdAt;
    return map;
  }

}