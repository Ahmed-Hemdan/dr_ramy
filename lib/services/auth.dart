import 'dart:convert';
import 'package:dr_ramy/models/Login.dart';
import 'package:dr_ramy/models/profile_info.dart';
import 'package:dr_ramy/models/update.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'const.dart';

class Auth{

  Future<String?> getToken() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String? token = _prefs.getString('user_token');
    return token;
  }
 // Login()
  Future<dynamic> NewAccount(String phone,String pass,String name,String date,int height, int weight,String deviceToken)async{

    var request = http.Request('POST', Uri.parse('${URL}/auth/register'));

    request.body = json.encode({
      "name": name,
      "height": height,
      "weight": weight,
      "operation_date": date,
      "phone": phone,
      "password": pass,
      "device_token":deviceToken,
      "lang": "ar"
    });
    request.headers.addAll(headers2);

    http.StreamedResponse response = await request.send();

    // try{
    //   final jsondata = json.decode(await response.stream.bytesToString());
    //   print(jsondata);
    //   return Register.fromJson(jsondata);
    // } catch(e){
    //   print(e);
    //   throw Exception(e);
    // }
    final jsondata = json.decode(await response.stream.bytesToString());

    if (response.statusCode == 200) {
      print(jsondata);

      SharedPreferences.getInstance().then((prefs) {
         prefs.setInt('user_id', jsondata['data']['userInfo']['id']);
        //  prefs.setInt('user_height', jsondata['data']['userInfo']['height']);
        // prefs.setInt('user_weight', jsondata['data']['userInfo']['weight']);
        //  prefs.setString('created_at', jsondata['data']['userInfo']['created_at']);
       });
     return jsondata;
    }
    else {
      print(response.reasonPhrase);
      print(response.statusCode);
      return jsondata;
     throw Exception('failed');
    }
  }
  Future<LoginModel>Login(String phone,String pass)async{

    var request = http.Request('POST', Uri.parse('https://drramyapp.be4maps.com/api/v1/auth/login'));

    request.body = json.encode({
      "phone": phone,
      "password": pass,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    final jsondata = json.decode(await response.stream.bytesToString());

    if (response.statusCode == 200) {
      print(jsondata);

      SharedPreferences.getInstance().then((prefs) {

        //"days_number": 27,
        prefs.setString('user_token', jsondata['data']['token']);
        prefs.setInt('user_id', jsondata['data']['user_info']['id']);
        prefs.setString('user_name', jsondata['data']['user_info']['name']);
        prefs.setString('operation_date', jsondata['data']['user_info']['operation_date'] ?? "ليس بعد");
        prefs.setString('user_height', jsondata['data']['user_info']['height']);
        prefs.setString('user_weight', jsondata['data']['user_info']['weight']);
        prefs.setString('user_image', jsondata['data']['user_info']['image_path']);
        prefs.setInt('days_number', jsondata['data']['user_info']['days_number']);
        print(prefs.getString('user_name'));

      });
      //return jsondata;
    }


    // else {
    //   print(response.reasonPhrase);
    //   print(response.statusCode);
    //  throw Exception('failed');
    //   return jsondata;
    // }
    return LoginModel.fromJson(jsondata);

   } 
  //Future<LoginModel>Login(String phone,String pass)async{

  //   var request = http.Request('POST', Uri.parse('https://drramyapp.be4maps.com/api/v1/auth/login'));

  //   request.body = json.encode({
  //     "phone": phone,
  //     "password": pass,
  //   });
  //   request.headers.addAll(headers);

  //   http.StreamedResponse response = await request.send();
  //   final jsondata = json.decode(await response.stream.bytesToString());

  //   if (response.statusCode == 200) {
  //     print(jsondata);

  //     SharedPreferences.getInstance().then((prefs) {

  //       //"days_number": 27,
  //       prefs.setString('user_token', jsondata['data']['token']);
  //       prefs.setInt('user_id', jsondata['data']['user_info']['id']);
  //       prefs.setString('user_name', jsondata['data']['user_info']['name']);
  //       prefs.setString('operation_date', jsondata['data']['user_info']['operation_date']);
  //       prefs.setString('user_height', jsondata['data']['user_info']['height']);
  //       prefs.setString('user_weight', jsondata['data']['user_info']['weight']);
  //       prefs.setString('user_image', jsondata['data']['user_info']['image_path']);
  //       prefs.setInt('days_number', jsondata['data']['user_info']['days_number']);
  //       print(prefs.getString('user_name'));

  //     });
  //     //return jsondata;
  //   }


  //   // else {
  //   //   print(response.reasonPhrase);
  //   //   print(response.statusCode);
  //   //  throw Exception('failed');
  //   //   return jsondata;
  //   // }
  //   return LoginModel.fromJson(jsondata);

  // }

  Future<dynamic>SendDeviceToken(int user_id,String devicetoken)async{

    var request = http.Request('POST', Uri.parse('https://drramyapp.be4maps.com/api/v1/auth/refreshDeviceToken'));

    request.body = json.encode({
      "user_id": user_id,
      "device_token": devicetoken,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    final jsondata = json.decode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      print(jsondata);
      SharedPreferences.getInstance().then((prefs) {
        prefs.setString('fcm_device_token', devicetoken);
      });
      //return jsondata;
    }
    else {
      print(response.reasonPhrase);
      print(response.statusCode);
     throw Exception('failed');

    }
    return jsondata;

  }
  Future<bool>deleteDeviceToken(int user_id)async{

    var request = http.Request('POST', Uri.parse('https://drramyapp.be4maps.com/api/v1/auth/removeDeviceToken'));

    request.body = json.encode({
      "user_id": user_id,
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    final jsondata = json.decode(await response.stream.bytesToString());
    if (response.statusCode == 200) {

      print(jsondata);
      return true;
    }
    else {
      return false;
      print(response.reasonPhrase);
      print(response.statusCode);
      throw Exception('failed');
    }

  }
  Future<Update> UpdateProfile (String phone
      //,String pass
      ,String name,String date,int height, int weight)async{

    var request = http.Request('POST', Uri.parse('${URL}/profile-update'));

    request.body = json.encode({
    "name" : name,
    "phone":phone,
    // "password": pass,
    //"confirmed_password": pass,
    "height": height,
    "weight": weight,
    "operation_date": date, "access_token" : "${await getToken()}"
    });
    request.headers.addAll(headers2);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      final jsondata = json.decode(await response.stream.bytesToString());



      return Update.fromJson(jsondata);
    }
    else {
      print(response.reasonPhrase);
      print(response.statusCode);
      throw Exception('failed');
    }
  }
  Future<dynamic> Logout()async{

    var request = http.Request('POST', Uri.parse('${URL}/logout'));

    request.headers.addAll(headers2);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      final jsondata = json.decode(await response.stream.bytesToString());
     // print(jsondata);
    }
    else {
      print(response.reasonPhrase);
      print(response.statusCode);
      throw Exception('failed');
    }
  }

  Future<UserData> GetProfile()async{

    var request = http.Request('GET', Uri.parse('${URL}/profile-info'));
    request.body = json.encode({
      "access_token" : "${await getToken()}"
      //"eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNDFiODNmNTg1Y2UyNzUwNDk5OTEwMDI5MWM3MzkzY2MyMjFmMTQxZTQ3OTViYzA5NTIxYmM4ZmY1YTM1MzUwNTc0MmFiNjVjMjkwMjE0OTQiLCJpYXQiOjE2NDE1NTYwNjYuMDYwNjczOTUyMTAyNjYxMTMyODEyNSwibmJmIjoxNjQxNTU2MDY2LjA2MDY3ODk1ODg5MjgyMjI2NTYyNSwiZXhwIjoxNjczMDkyMDY2LjA1NTI2NDk0OTc5ODU4Mzk4NDM3NSwic3ViIjoiOCIsInNjb3BlcyI6W119.JqHIJ9aI0XJUZIwxIZYQ2ckGof8gAzBBDHOG8w2wQN-9n91idB4PQPi-LCt2vCvAffqK__F4QAlBp0l6KfyswvImw0EQGf6SgGwTlvOt14035uFKfmPvfNspxu-Pg3dWGoNXrMszHVMFzbLXIeVvQZ26PSnN5_NgV_BwuD0CrGVSvjbQKD01kBDwTbbBNQNXhApKuPFOtvx_p10ANXbS2FM2BwZyM0ddsVEJPxWGOF_LxUPjnV6dKQZbVjrzq3-tPSTPiZd72PD9eTHV-7Y8HWboyy3hYquO0GH-ViIJpNVKqoJ19xp0Eh4ps0d9A9IqdOAdia8ou_-C51hVq9Jyg4FSSII8T1ABTRc75lbZ9hRI3jIV79CJkjHBpsbFMlpQQre3AxboYuuicmUMRRw8-6YQ7bu-U_3frKEntAIgYK-XpRoCndFc4ij0G8G8iy42jtcY9wEqvyjFg9KlMpppbDdD96ScVd_lkDDW2H5Dn2uQltLN0J9ep9YqOtTWNSxioGLN_pu4EZb8RJRmA0EaJOGsrf5FUua31bbVx87X2GC5Jybbb7TbAzpBxX_O2TCQ-hOpWX_o48Z22NEqDK5o4Y7kvKGVUxMyanoTwaf_VOGMHG-V6-ypFInaYiLBGxcPZBokYrO_AhAZbdOJBM6l0jex_I3HhT_ujeXVXWqdmr0"

    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final jsondata = json.decode(await response.stream.bytesToString());
      SharedPreferences.getInstance().then((prefs) {
        prefs.setInt('days_number', jsondata['data']['days_number']);
        print(prefs.getInt('days_number'));
      });
     //print(jsondata);
     return UserData.fromJson(jsondata);
    }
    else {
      print(response.reasonPhrase);
      print(response.statusCode);
      print('get profile failed');
      throw Exception('failed');
    }
  }


// Logout()
}