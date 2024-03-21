import 'package:dr_ramy/models/search.dart';
import 'dart:convert';
import 'auth.dart';
import 'const.dart';
import 'package:http/http.dart' as http;

class SearchApi{

  Future<Search> getSearchResult(String query)async{
    var request = http.Request('POST', Uri.parse('${URL}/search'));
    request.body = json.encode({
    "search_key" : "${query}",
      "access_token" : "${await Auth().getToken()}"
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final jsondata = json.decode(await response.stream.bytesToString());
      return Search.fromJson(jsondata);
    }
    else {
      print(response.reasonPhrase);
      print(response.statusCode);
      throw Exception('failed');
    }
  }
}