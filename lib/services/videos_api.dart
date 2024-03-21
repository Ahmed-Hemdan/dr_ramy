import 'dart:convert';

import 'package:dr_ramy/models/videos.dart';
import 'package:dr_ramy/models/web.dart';
import 'package:http/http.dart' as http;

import 'const.dart';
class vidoesapi{
  Future<VideosModel> getvideos()async{

    var request = http.Request('GET', Uri.parse('${URL}/retrieve-videos'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final jsondata = json.decode(await response.stream.bytesToString());
      // print(jsondata);
      return VideosModel.fromJson(jsondata);
    }
    else {
      print(response.reasonPhrase);
      print(response.statusCode);
      throw Exception('failed');
    }
  }

  Future<Web> getweb()async{

    var request = http.Request('GET', Uri.parse('${URL}/retrieve-useful-links'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final jsondata = json.decode(await response.stream.bytesToString());
      // print(jsondata);
      return Web.fromJson(jsondata);
    }
    else {
      print(response.reasonPhrase);
      print(response.statusCode);
      throw Exception('failed');
    }
  }

}