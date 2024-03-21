import 'package:dr_ramy/components/btn_widget.dart';
import 'package:dr_ramy/components/btn_widget2.dart';
import 'package:dr_ramy/components/drawer.dart';
import 'package:dr_ramy/components/title.dart';
import 'package:dr_ramy/models/contact.dart';
import 'package:dr_ramy/services/const.dart';
import 'package:dr_ramy/services/contact_about.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  Contact? contactdata;
  String? phone;
  Widget phonecall(String phone){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Container(
          width: SizeConfig.screenWidth-50,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(color: kbuttonColor),
            // color: color,
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
          ),

          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                _callNumber(phone);
                // FlutterPhoneDirectCaller.callNumber(contactdata!.data!.phone!);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(phone,style: TextStyle(fontWeight: FontWeight.bold),),
                  Icon(Icons.phone,color: kbuttonColor2,),
                  //SizedBox(width: 5,),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contactandabout().getcontact().then((value) {
      setState(() {
        contactdata=value;
        phone=value.data!.whatsapp;
      });
    });
  }
  _callNumber(String number){
    FlutterPhoneDirectCaller.callNumber(number);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: drawer(),
        ),

        appBar: AppBar(

          elevation: 0,
          backgroundColor: kTextTitleColor,
          title: Text(
            "تواصل معنا",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
            actions: [ Image.asset('assets/icon2.png',height: 50,width: 50,),]
        ),
        body: SafeArea(child: SingleChildScrollView(child:Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0),
          child: contactdata==null?Container():
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Titlewidget(title: 'البريد الإلكتروني'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: SizeConfig.screenWidth-50,
                    height: 40,
                    decoration: BoxDecoration(
                      border: Border.all(color: kbuttonColor),
                     // color: color,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(contactdata!.data!.email!,style: TextStyle(fontWeight: FontWeight.bold),)

                          ,Icon(Icons.email,color: kbuttonColor2,),
                         // SizedBox(width: 5,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
SizedBox(height: 15,),

              Titlewidget(title: 'السكرتارية للحجز والمتابعة'),
             phonecall('01020301010'),
             // phonecall(contactdata!.data!.phone!),
          SizedBox(height: 10,),
              phonecall('01000006723'),
          SizedBox(height: 10,),
              phonecall('01200038787'),
          SizedBox(height: 15,),
          Titlewidget(title: 'منسقة العمليات'),
          phonecall('01030020050'),
              SizedBox(height: 15,),
              Titlewidget(title: 'الدعم الطبي'),
              phonecall('01204444871'),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.all(16.0),
              //       child: Row(
              //         children: [
              //           Icon(Icons.calendar_today_outlined,color: kbuttonColor2,),
              //           SizedBox(width: 10,),
              //       Container(
              //         width: SizeConfig.screenWidth/3,
              //         height: 40,
              //         decoration: BoxDecoration(
              //            color: Colors.grey.withOpacity(0.2),
              //           borderRadius: BorderRadius.only(
              //             topRight:  Radius.circular(100),
              //             bottomRight:  Radius.circular(100),
              //
              //           ),
              //         ),
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.center,
              //           children: [
              //             Text('اليوم',style: TextStyle(fontWeight: FontWeight.bold),),
              //             Icon(Icons.arrow_downward_outlined,color: kbuttonColor2)
              //
              //           ],
              //         ) ,
              //       ),
              //           SizedBox(width:4 ,),
              //
              //           Container(
              //             width: SizeConfig.screenWidth/3,
              //             height: 40,
              //             decoration: BoxDecoration(
              //               //border: Border.all(color: ),
              //               color: Colors.grey.withOpacity(0.2),
              //               borderRadius: BorderRadius.only(
              //                 topLeft:  Radius.circular(100),
              //                 bottomLeft:  Radius.circular(100),
              //
              //               ),
              //             ),
              //
              //             child: Row(
              //               mainAxisAlignment: MainAxisAlignment.center,
              //               children: [
              //                 Text('الساعه',style: TextStyle(fontWeight: FontWeight.bold),),
              //                 Icon(Icons.arrow_downward_outlined,color: kbuttonColor2)
              //               ],
              //             ) ,
              //           ),
              //         //  Text(' 100022022 20+',style: TextStyle(fontWeight: FontWeight.bold),)
              //         ],
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [


                      Container(
                        width: SizeConfig.screenWidth,
                        height: 30,
                        decoration: BoxDecoration(
                          //border: Border.all(color: ),
                          color: kPrimaryLightColor2.withOpacity(0.8),

                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('الخريطة',style: TextStyle(fontWeight: FontWeight.bold,color: kTextTitleColor),),
                            //Icon(Icons.arrow_downward_outlined,color: kbuttonColor2)

                          ],
                        ) ,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      try{
                        lanchMaps(lat:contactdata!.data!.latitude,long: contactdata!.data!.longitude);

                      }catch(e){
                        print(e.toString());
                      }
                    },
                    child: Container(
                      height: 150,
                      width: SizeConfig.screenWidth,
                      decoration: BoxDecoration(border: Border.all(color: kPrimaryLightColor),
                          ),
                      child: Image.asset('assets/map.png',fit: BoxFit.fill,),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 8),
                child: Row(
                  children: [
                    Expanded(flex:1,
                      child:  Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          color: kbuttonColor2,
                          borderRadius: BorderRadius.only(
                            topRight:     Radius.circular(100),
                            bottomRight:     Radius.circular(100),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Center(
                          child: Icon(FontAwesomeIcons.whatsapp,color: Colors.white,),
                        ),
                      ),
                    ),

                    // ButtonWidget(btnText: 'hi',color: kbuttonColor2,)),


                    Expanded(flex:3,
                        child:ButtonWidget2(onClick: (){
                          lanchWhatsapp(number: contactdata!.data!.whatsapp!);
                        },
                          btnText: 'تواصل عبر الواتس',color: kbuttonColor,)),
                    SizedBox(width: 10,),
                    Expanded(flex:3,
                        child:ButtonWidget(
                          onClick: (){
                            lanchMessangerapp(url: contactdata!.data!.messanger);
                          },
                          btnText: 'تواصل عبر ماسينجر',color: kbuttonColor,)),
                    Expanded(flex:1,
                      child:  Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          color: kbuttonColor2,
                          borderRadius: BorderRadius.only(
                            topLeft:     Radius.circular(100),
                            bottomLeft:     Radius.circular(100),
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Center(
                          child: Icon(FontAwesomeIcons.facebookMessenger,color: Colors.white,),
                        ),
                      ),
                    ),

                    // ButtonWidget(btnText: 'hi',color: kbuttonColor2,)),




                  ],
                ),
              )

            ],
          ),
        ))));
  }
}
