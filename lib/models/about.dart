/// success : true
/// status_code : 200
/// message : "All About Info Retrieved Successfully."
/// data : {"bio":"&nbsp;\r\n\r\n\r\n\t\r\n\t&raquo; عضو الجمعيه الأمريكيه لعلاج المياه البيضاء وعيوب الإبصار.\r\n\t\r\n\t\r\n\t&raquo; عضو الجمعيه الاوروبيه لعلاج المياه البيضاء وتصحيح الإبصار.\r\n\t\r\n\t\r\n\t&raquo; زميل المجلس العالمي لطب وجراحه العيون (كامبريدج).\r\n\t\r\n\t\r\n\tعمل بمستشفيات(معهد بحوث أمراض العيون بالجيزه &ndash; مستشفيات المغربي للعيون &ndash; مستشفيات الشرطه ).\r\n\t\r\n","about":"\r\n\t\r\n\tمركز دكتور عصام لتجميل و زراعة الاسنان واحد من اكبر مراكز تجميل و زراعة الاسنان بالشرق الاوسط و ذلك كنتيجة طبيعية لخبرة تناهز ثلاثون عاما تواصلت في البحث و استقدام كل\r\n\t\r\n\t\r\n\tما هو جديد في عالم تكنولوجيا الاسنان مع تدعيمها بمجموعة من اهم استشاري و اعضاء هيئة التدريس باعرق جامعات في السعودية و الحاصلين علي اعلي الدرجات العلمية من الجامعات الاوربية لتقديم مستوي جديد\r\n\t\r\n\t\r\n\tمن الخدمات الطبية الغير مسبوقة و التي تتميز بالدقة المتناهية و اعلي نسب النجاح العالمية في جو من الحداثة و الاناقة و الراحة النفسية تحت قيادة واحد من اشهر اطباء الاسنان بالشرق الاوسط اخذ علي عاتقه\r\n\t\r\n","bioImage":"https://drramyapp.be4maps.com/uploads/product/16399532521.jpg","aboutImage":"https://drramyapp.be4maps.com/uploads/product/16399532521.jpg","aboutImage2":"https://drramyapp.be4maps.com/uploads/product/16399532521.jpg","aboutImage3":"https://drramyapp.be4maps.com/uploads/product/16399532521.jpg","whatsapp":"+201004996929","created_at":"2 years ago"}

class About {
  About({
      bool? success, 
      int? statusCode, 
      String? message, 
      Data? data,}){
    _success = success;
    _statusCode = statusCode;
    _message = message;
    _data = data;
}

  About.fromJson(dynamic json) {
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

/// bio : "&nbsp;\r\n\r\n\r\n\t\r\n\t&raquo; عضو الجمعيه الأمريكيه لعلاج المياه البيضاء وعيوب الإبصار.\r\n\t\r\n\t\r\n\t&raquo; عضو الجمعيه الاوروبيه لعلاج المياه البيضاء وتصحيح الإبصار.\r\n\t\r\n\t\r\n\t&raquo; زميل المجلس العالمي لطب وجراحه العيون (كامبريدج).\r\n\t\r\n\t\r\n\tعمل بمستشفيات(معهد بحوث أمراض العيون بالجيزه &ndash; مستشفيات المغربي للعيون &ndash; مستشفيات الشرطه ).\r\n\t\r\n"
/// about : "\r\n\t\r\n\tمركز دكتور عصام لتجميل و زراعة الاسنان واحد من اكبر مراكز تجميل و زراعة الاسنان بالشرق الاوسط و ذلك كنتيجة طبيعية لخبرة تناهز ثلاثون عاما تواصلت في البحث و استقدام كل\r\n\t\r\n\t\r\n\tما هو جديد في عالم تكنولوجيا الاسنان مع تدعيمها بمجموعة من اهم استشاري و اعضاء هيئة التدريس باعرق جامعات في السعودية و الحاصلين علي اعلي الدرجات العلمية من الجامعات الاوربية لتقديم مستوي جديد\r\n\t\r\n\t\r\n\tمن الخدمات الطبية الغير مسبوقة و التي تتميز بالدقة المتناهية و اعلي نسب النجاح العالمية في جو من الحداثة و الاناقة و الراحة النفسية تحت قيادة واحد من اشهر اطباء الاسنان بالشرق الاوسط اخذ علي عاتقه\r\n\t\r\n"
/// bioImage : "https://drramyapp.be4maps.com/uploads/product/16399532521.jpg"
/// aboutImage : "https://drramyapp.be4maps.com/uploads/product/16399532521.jpg"
/// aboutImage2 : "https://drramyapp.be4maps.com/uploads/product/16399532521.jpg"
/// aboutImage3 : "https://drramyapp.be4maps.com/uploads/product/16399532521.jpg"
/// whatsapp : "+201004996929"
/// created_at : "2 years ago"

class Data {
  Data({
      String? bio, 
      String? about, 
      String? bioImage, 
      String? aboutImage, 
      String? aboutImage2, 
      String? aboutImage3, 
      String? whatsapp, 
      String? createdAt,}){
    _bio = bio;
    _about = about;
    _bioImage = bioImage;
    _aboutImage = aboutImage;
    _aboutImage2 = aboutImage2;
    _aboutImage3 = aboutImage3;
    _whatsapp = whatsapp;
    _createdAt = createdAt;
}

  Data.fromJson(dynamic json) {
    _bio = json['bio'];
    _about = json['about'];
    _bioImage = json['bioImage'];
    _aboutImage = json['aboutImage'];
    _aboutImage2 = json['aboutImage2'];
    _aboutImage3 = json['aboutImage3'];
    _whatsapp = json['whatsapp'];
    _createdAt = json['created_at'];
  }
  String? _bio;
  String? _about;
  String? _bioImage;
  String? _aboutImage;
  String? _aboutImage2;
  String? _aboutImage3;
  String? _whatsapp;
  String? _createdAt;

  String? get bio => _bio;
  String? get about => _about;
  String? get bioImage => _bioImage;
  String? get aboutImage => _aboutImage;
  String? get aboutImage2 => _aboutImage2;
  String? get aboutImage3 => _aboutImage3;
  String? get whatsapp => _whatsapp;
  String? get createdAt => _createdAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bio'] = _bio;
    map['about'] = _about;
    map['bioImage'] = _bioImage;
    map['aboutImage'] = _aboutImage;
    map['aboutImage2'] = _aboutImage2;
    map['aboutImage3'] = _aboutImage3;
    map['whatsapp'] = _whatsapp;
    map['created_at'] = _createdAt;
    return map;
  }

}