import 'dart:convert';

import 'package:dr_ramy/models/doctor_details.dart';
import 'package:dr_ramy/models/doctor_image.dart';
import 'package:dr_ramy/models/doctors.dart';
import 'package:http/http.dart' as http;
import 'const.dart';

class doctors_api{
  Future<Doctors> getAllDoctors()async{

    var request = http.Request('GET', Uri.parse('${URL}/doctor-all'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final jsondata = json.decode(await response.stream.bytesToString());
      return Doctors.fromJson(jsondata);
    }
    else {
      print(response.reasonPhrase);
      print(response.statusCode);
      throw Exception('failed');
    }
  }

  Future<DoctorImage> getDoctorImage()async{

    var request = http.Request('GET', Uri.parse('${URL}/ceo-image'));

    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    try {
      final jsondata = json.decode(await response.stream.bytesToString());
      return DoctorImage.fromJson(jsondata);
    }
    catch(e) {
      print(e.toString());
      print(response.reasonPhrase);
      print(response.statusCode);
      throw Exception('failed');
    }
  }
  Future<DoctorDetailsModel> getDoctorDetails(int id)async{
    var request = http.Request('POST', Uri.parse('${URL}/doctor-show'));
    request.body = json.encode({
      "doctor_id": id
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final jsondata = json.decode(await response.stream.bytesToString());
     // print(jsondata);
      return DoctorDetailsModel.fromJson(jsondata);
    }
    else {
      print(response.reasonPhrase);
      print(response.statusCode);
      throw Exception('failed');
    }
  }
}