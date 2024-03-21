import 'package:dr_ramy/components/btn_widget3.dart';
import 'package:dr_ramy/components/drawer.dart';
import 'package:dr_ramy/models/doctor_details.dart';
import 'package:dr_ramy/services/const.dart';
import 'package:dr_ramy/services/doctors_api.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
class DoctorDetails extends StatefulWidget {
  final int? id;
  DoctorDetails({Key? key, required this.id}) : super(key: key);

  @override
  _DoctorDetailsState createState() => _DoctorDetailsState();
}

class _DoctorDetailsState extends State<DoctorDetails> {
  DoctorDetailsModel? doctor_details;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    doctors_api().getDoctorDetails(widget.id!).then((value) {
      setState(() {
        doctor_details=value;
      });
    });

  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        drawer: Drawer(
          child: drawer(),
        ),
        // backgroundColor: kTextTitleColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kTextTitleColor,
          title: Text(
            " تفاصيل الدكتور",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
            actions: [ Image.asset('assets/icon2.png',height: 50,width: 50,),]
        ),
        body: SafeArea(child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: SingleChildScrollView(child:
          doctor_details==null?Container():
          Column(
            children: [
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 220,
                      width: 170,
                      decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryLightColor),
                          borderRadius:BorderRadius.all(Radius.circular(5.0))),
                      margin: EdgeInsets.all(15.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          child: Image.network(doctor_details!.data.image,fit: BoxFit.contain, height: 110,width: 150)),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: 120,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child: Text(doctor_details!.data.name,style: TextStyle(fontWeight: FontWeight.bold, color: kTextTitleColor),)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(child: Text(doctor_details!.data.jobTitle)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],),
              SizedBox(height: 30,),

              Row(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width-20,
                    child: Row(
                      children: [
                        Expanded(child: Text('${parse(doctor_details!.data.bio).body!.text}',
                          //(doctor_details!.data!.bio!,
                          style: TextStyle(wordSpacing: 0.1, fontWeight: FontWeight.w500),

                        ),
                        )
                      ],
                    ),

                  ),
                )
              ],),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                 // color:  Colors.grey.withOpacity(0.15),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        ...List.generate(
                          doctor_details!.data.images.length,
                              (index) {
                            return Card(
                              elevation: 5,
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius:BorderRadius.all(Radius.circular(10.0))),
                                      // margin: EdgeInsets.all(5.0),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                          child: Image.network(doctor_details!.data.images[index],fit: BoxFit.contain, height: 150,width: 100)),
                                    ),
                                  ),
                                  SizedBox(width: 10,)
                                ],
                              ),
                            );
                            return SizedBox
                                .shrink(); // here by default width and height is 0
                          },
                        ),
                        SizedBox(width: 20),
                      ],
                    ),
                  ),
                ),
              ),

             SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonWidget3(
                      color: kbuttonColor2,
                      btnText: "تواصل عبر الواتس آب",
                      onClick: () {
                        lanchWhatsapp(number: doctor_details!.data.phone);
                      //  Navigator.push(context, MaterialPageRoute(builder: (c)=>MainBody()));
                      }
                  ),

                ],
              ),
              SizedBox(height: 20,),
            ],
          )),
        )));
  }
}
