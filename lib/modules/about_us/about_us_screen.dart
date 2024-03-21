
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_ramy/components/btn_widget2.dart';
import 'package:dr_ramy/components/drawer.dart';
import 'package:dr_ramy/models/about.dart';
import 'package:dr_ramy/services/const.dart';
import 'package:dr_ramy/services/contact_about.dart';
import 'package:dr_ramy/style/colors.dart';

import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:html/parser.dart';
class Aboutus extends StatefulWidget {
  const Aboutus({Key? key}) : super(key: key);

  @override
  _AboutusState createState() => _AboutusState();
}

class _AboutusState extends State<Aboutus> {
  About? aboutdata;
  String? phone;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contactandabout().getcontact().then((value) {
      setState(() {
        phone=value.data!.whatsapp;
      });
    });
    contactandabout().getabout().then((value) {
      setState(() {
        aboutdata=value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        drawer: Drawer(
          child: drawer(),
        ),
        // backgroundColor: kTextTitleColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kTextTitleColor,
          title: Text(
            "من نحن",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [ Image.asset('assets/icon2.png',height: 50,width: 50,),]
        ),
        body: SafeArea(child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: SingleChildScrollView(child:
          aboutdata==null?SizedBox():Column(
            children: [
              SizedBox(height: 30,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(
                  height: 220,
                  width: 170,
                  decoration: BoxDecoration(
                      border: Border.all(color: kPrimaryLightColor),
                      borderRadius:BorderRadius.all(Radius.circular(5.0))),
                  margin: EdgeInsets.all(5.0),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child:
                      CachedNetworkImage(
                        fadeOutDuration: Duration(milliseconds: 500),
                        fadeInDuration:  Duration(milliseconds: 500),
                        height: 110,width: 150,
                        fit: BoxFit.fill,
                        imageUrl: aboutdata!.data!.bioImage!,
                        placeholder: (context, url) => Image.asset('assets/icon.png',width: 1000,),
                        errorWidget: (context, url, error) => Image.asset('assets/icon.png',width: 1000,),
                      ),
                     // Image.network(aboutdata!.data!.bioImage!,fit: BoxFit.fill, height: 110,width: 150)

                  ),
                ),
                SizedBox(width: 20,),
                Container(
                  width: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Expanded(child: Text('دكتور رامي حلمي',style: TextStyle(fontWeight: FontWeight.bold, color: kTextTitleColor),)),
                       ],
                     ),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Expanded(child: Text('استشاري جراحة السمنة و المناظير ')),
                       ],
                     ),
                   ],
                  ),
                )
              ],),
            SizedBox(height: 30,),
            Container(
              color:  Colors.grey.withOpacity(0.15),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      /// 2,
                      5,
                      //  snapshot.data.allProducts.length,
                          (index) {
                        return Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 18,horizontal: 5),
                              child: Container(

                                decoration: BoxDecoration(border: Border.all(color: kPrimaryLightColor),
                                    borderRadius:BorderRadius.all(Radius.circular(10.0))),
                              // margin: EdgeInsets.all(5.0),
                                child: ClipRRect(
                                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                    child:
                                    CachedNetworkImage(
                                      fadeOutDuration: Duration(milliseconds: 500),
                                      fadeInDuration:  Duration(milliseconds: 500),
                                      height: 150,width: 100,
                                      fit: BoxFit.fill,
                                      imageUrl: aboutdata!.data!.bioImage!,
                                      placeholder: (context, url) => Image.asset('assets/icon.png',width: 1000,),
                                      errorWidget: (context, url, error) => Image.asset('assets/icon.png',width: 1000,),
                                    ),
                                   // Image.network(aboutdata!.data!.aboutImage!,fit: BoxFit.fill, height: 150,width: 100)
                                ),
                              ),
                            ),
                            SizedBox(width: 5,)
                          ],
                        );
                      },
                    ),
                    SizedBox(width: 20),
                  ],
                ),
              ),
            ),

              Row(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width-20,
                    child: Row(
                      children: [
                        Expanded(child: Text(parse(aboutdata!.data!.bio!).body!.text,
                          style: TextStyle(wordSpacing: 0.1, fontWeight: FontWeight.w500),

                        ),
              )
                      ],
                    ),

                  ),
                )
              ],),
             // SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100.0,vertical: 8),
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
                        child:ButtonWidget2(
                          onClick: (){
                            lanchWhatsapp(number: phone!);
                          },
                          btnText: 'تواصل عبر الواتس',color: kbuttonColor,)),

                  ],
                ),
              )
            ],
          )),
        )));
  }
}
