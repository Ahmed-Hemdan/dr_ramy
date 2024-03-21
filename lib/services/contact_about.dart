import 'dart:convert';

import 'package:dr_ramy/models/about.dart';
import 'package:dr_ramy/models/address.dart';
import 'package:dr_ramy/models/contact.dart';
import 'package:dr_ramy/models/gallery.dart';
import 'package:dr_ramy/models/number.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'const.dart';
class contactandabout{
  Future<Contact> getcontact()async{

    var request = http.Request('GET', Uri.parse('${URL}/contact'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final jsondata = json.decode(await response.stream.bytesToString());

      SharedPreferences.getInstance().then((prefs) {
        prefs.setDouble('long', jsondata['data']['longitude']);
        prefs.setDouble('lat', jsondata['data']['latitude']);
      });
     // print(jsondata);
      return Contact.fromJson(jsondata);
    }
    else {
      print(response.reasonPhrase);
      print(response.statusCode);
      throw Exception('failed');
    }
  }
  Future<About> getabout()async{
    var request = http.Request('GET', Uri.parse('${URL}/about'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final jsondata = json.decode(await response.stream.bytesToString());
    //  print(jsondata);
      return About.fromJson(jsondata);
    }
    else {
      print(response.reasonPhrase);
      print(response.statusCode);
      throw Exception('failed');
    }
  }

  Future<Address> getaddress()async{

    var request = http.Request('GET', Uri.parse('${URL}/retrieve-address'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final jsondata = json.decode(await response.stream.bytesToString());

      return Address.fromJson(jsondata);
    }
    else {
      print(response.reasonPhrase);
      print(response.statusCode);
      throw Exception('failed');
    }
  }

  Future<Numbers> getnumbers()async{

    var request = http.Request('GET', Uri.parse('${URL}/retrieve-statistics'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final jsondata = json.decode(await response.stream.bytesToString());

      return Numbers.fromJson(jsondata);
    }
    else {
      print(response.reasonPhrase);
      print(response.statusCode);
      throw Exception('failed');
    }
  }


  Future<GalleryModel> getphotos()async{

    var request = http.Request('GET', Uri.parse('${URL}/retrieve-gallery'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final jsondata = json.decode(await response.stream.bytesToString());

      return GalleryModel.fromJson(jsondata);
    }
    else {
      print(response.reasonPhrase);
      print(response.statusCode);
      throw Exception('failed');
    }
  }
}