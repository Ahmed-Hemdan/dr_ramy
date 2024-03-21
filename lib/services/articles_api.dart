import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dr_ramy/models/Slidermodel.dart';
import 'package:dr_ramy/models/article_details.dart';
import 'package:dr_ramy/models/articles.dart';
import 'auth.dart';
import 'const.dart';


class ArticlesApi{
  Future<Articles> getAllArticles()async{
    var request = http.Request('POST', Uri.parse('${URL}/blogs-all'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
   try {
      final jsondata = json.decode(await response.stream.bytesToString());
      print(jsondata);
      return Articles.fromJson(jsondata);
    }
   catch(e) {
      print(response.reasonPhrase);
      print(response.statusCode);
      throw Exception('failed');
    }
  }

  Future<Articles> getCategorywithoutday (int id)async{
    var request = http.Request('POST', Uri.parse('${URL}/category-blogs'));
    request.body = json.encode({
      "category_id": id,
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
   try {
      final jsondata = json.decode(await response.stream.bytesToString());
      return Articles.fromJson(jsondata);
    }
    catch(e) {
      print(response.reasonPhrase);
      print(response.statusCode);
      throw Exception(e);
    }
  }
  Future<Articles> getCategory (int id,int day)async{
    var request = http.Request('POST', Uri.parse('${URL}/category-blogs'));
    request.body = json.encode({
      "category_id": id,
      "show_on": day
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    try {
      final jsondata = json.decode(await response.stream.bytesToString());
      print(jsondata);
      return Articles.fromJson(jsondata);
    }
    catch(e) {
      print(response.reasonPhrase);
      print(response.statusCode);
      throw Exception(e);
    }
  }
  Future<ArticleDetails> getArticleDetails (int id)async{
    var request = http.Request('POST', Uri.parse('${URL}/blog-details'));
    request.body = json.encode({
      "blog_id": id
    });

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final jsondata = json.decode(await response.stream.bytesToString());
     // print(jsondata);
      return ArticleDetails.fromJson(jsondata);
    }
    else {
      print(response.reasonPhrase);
      print(response.statusCode);
      throw Exception('failed');
    }
  }

  ///offers

  Future<Articles> getAllOffers()async{
    var request = http.Request('GET', Uri.parse('${URL}/retrieve-offers'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final jsondata = json.decode(await response.stream.bytesToString());
      return Articles.fromJson(jsondata);
    }
    else {
      print(response.reasonPhrase);
      print(response.statusCode);
      throw Exception('failed');
    }
  }

  Future<dynamic> RequestOffer(int offerid)async{
    var request = http.Request('POST', Uri.parse('${URL}/offer-request'));
    request.body = json.encode({
      "offer_id": offerid,
      "access_token" : "${await Auth().getToken()}"
    });
    request.headers.addAll(headers2);
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

  Future<Articles> getUserOffers()async{
    var request = http.Request('GET', Uri.parse('${URL}/offers-all'));
    request.body = json.encode({
      "access_token" : "${await Auth().getToken()}"
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final jsondata = json.decode(await response.stream.bytesToString());
      return Articles.fromJson(jsondata);
    }
    else {
      print(response.reasonPhrase);
      print(response.statusCode);
      throw Exception('failed');
    }
  }
  Future<Sliders> getAllSliders()async{
    var request = http.Request('GET', Uri.parse('${URL}/retrieve-sliders'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    try {
      final jsondata = json.decode(await response.stream.bytesToString());
      //  print(jsondata);
      return Sliders.fromJson(jsondata);
    }
    catch(e) {
      print(response.reasonPhrase);
      print(response.statusCode);
      throw Exception('failed');
    }
  }
}