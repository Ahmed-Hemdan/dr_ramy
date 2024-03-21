import 'dart:convert';

import 'package:dr_ramy/models/user_weight.dart';
import 'package:dr_ramy/services/auth.dart';

import 'package:http/http.dart' as http;

import 'const.dart';
class Weight{
  Future<dynamic> SaveWeight(int weight,String date)async{

    var request = http.Request('POST', Uri.parse('${URL}/weight-save'));
    request.body = json.encode({
      "weight": weight,
      "weight_date": date,
      "access_token" : "${await Auth().getToken()}"
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final jsondata = json.decode(await response.stream.bytesToString());
      print(jsondata);
    }
    else {
      print(response.reasonPhrase);
      print(response.statusCode);
      throw Exception('failed');
    }
  }


  Future<UserWeight> GetWeights()async{

    var request = http.Request('GET', Uri.parse('${URL}/weight-all'));
    request.body = json.encode({
      "access_token" : "${await Auth().getToken()}"
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final jsondata = json.decode(await response.stream.bytesToString());
      print(jsondata);
      return UserWeight.fromJson(jsondata);
    }
    else {
      print(response.reasonPhrase);
      print(response.statusCode);
      throw Exception('failed');
    }
  }
}