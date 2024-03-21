

import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import 'auth.dart';

var headers = {
  'Accept': 'application/json',
  'Content-Type': 'application/json',
  'lang':'ar'
};

var headers2 = {
  'Accept': 'application/json',
  'Content-Type': 'application/json',
  'Authorization': 'Bearer ${Auth().getToken()}',
  'lang':'ar'
};

String URL='https://drramyapp.be4maps.com/api/v1';

const String imageURl="https://drramyapp.be4maps.com/upload/";

void lanchWhatsapp({required String number})async{


  final link = WhatsAppUnilink(
    phoneNumber:'+2${number}',
    text: "Hey! Doctor Ramy team",
  );
  // Convert the WhatsAppUnilink instance to a string.
  // Use either Dart's string interpolation or the toString() method.
  // The "launch" method is part of "url_launcher".
  await launchUrlString('$link');

   // // var whatsapp ="+919144040888";
   //  var whatsappURl_android = "whatsapp://send?phone="+number+"&text=hello";
   //  var whatappURL_ios ="https://wa.me/$number?text=${Uri.parse("hello")}";
   //  if(Platform.isIOS){
   //    // for iOS phone only
   //    if( await canLaunch(whatappURL_ios)){
   //      await launch(whatappURL_ios, forceSafariVC: false);
   //    }else{
   //      ScaffoldMessenger.of(context).showSnackBar(
   //          SnackBar(content: new Text("whatsapp no installed")));
   //
   //    }
   //
   //  }else{
   //    // android , web
   //    if( await canLaunch(whatsappURl_android)){
   //      await launch(whatsappURl_android);
   //    }else{
   //      ScaffoldMessenger.of(context).showSnackBar(
   //          SnackBar(content: new Text("whatsapp no installed")));
   //
   //    }
   //
   //
   //  }

  }
  // String url = "https://wa.me/$number?text=hello dr/Ramy";
  // await canLaunch(url)?launch(url):print("can't open what'sapp");
 // await FlutterLaunch.launchWhatsapp(phone: number, message: 'hello dr/ramy');


void lanchMessangerapp({required url})async{
  await canLaunch(url)?launch(url):print("can't open messenger");
}

void lanchYoutube({required url})async{
  await canLaunch(url)?launch(url):print("can't open youtube");
}

void lanchMaps({required long,required lat})async{
  String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$long,$lat';
  try {
    await launch(googleUrl);
  } catch(e) {
    throw 'Could not open the map.';
  }
}