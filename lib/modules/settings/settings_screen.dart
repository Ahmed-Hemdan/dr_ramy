
import 'package:dr_ramy/components/btn_widget3.dart';
import 'package:dr_ramy/components/drawer.dart';

import 'package:dr_ramy/components/profileimg2.dart';
import 'package:dr_ramy/components/teaser.dart';
import 'package:dr_ramy/modules/contact_us/contact_us.dart';
import 'package:dr_ramy/modules/settings/operationdate/operation.dart';

import 'package:dr_ramy/modules/settings/public_info/public_info_screen.dart';
import 'package:dr_ramy/modules/settings/wieght/weight_screen.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';

import 'notice/notes.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: drawer(),
        ),
        backgroundColor: kTextTitleColor,
        appBar: AppBar(

          elevation: 0,
          backgroundColor: kTextTitleColor,
          title: Text(
            "الملف الشخصي",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
            actions: [ Image.asset('assets/icon2.png',height: 50,width: 50,),]
        ),
        body: SafeArea(child: SingleChildScrollView(child: Detailsbody())));
  }
}

class Detailsbody extends StatelessWidget {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          profile2(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (c)=>WeightScreen()));
                },
                child: Container(
                    height: 100,
                    width:  SizeConfig.screenHeight<600?100:150,

                    //  color: Colors.transpaent,
                    child: Teaser(
                      btnText: "وزنك اليوم",
                      i: Icons.person,
                    )),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (c)=>PublicinfoScreen()));
                } ,
                child: Container(
                    height: 100,
                    width:  SizeConfig.screenHeight<600?100:150,

                    //  color: Colors.transparent,
                    child: Teaser(
                      btnText: "بيانات عامة",
                      i: Icons.label,
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (c)=>Notice()));
                },
                child: Container(
                    height: 100,
                     width:  SizeConfig.screenHeight<600?100:150,
                    //  color: Colors.transparent,
                    child: Teaser(
                      btnText: "ملاحظات الادارة",
                      i: Icons.favorite,
                    )),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (c)=>Operation()));
                },
                child: Container(
                    height: 100,
                    width:  SizeConfig.screenHeight<600?100:150,

                    //  color: Colors.transparent,
                    child: Teaser(
                      btnText: "تاريخ العملية",
                      i: Icons.calendar_today,
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ButtonWidget3(
              btnText: "تواصل مع الإدارة",
              onClick: () {
                Navigator.push(context, MaterialPageRoute(builder: (c)=>ContactUs()));
              },
            ),
          ),

          // Container(
          //   height: 100,
          //   // width: 100,
          //   //  color: Colors.transparent,
          //   child: Teaser(btnText: "eo",i: Icons.location_on,)
          // ),
        ],
      ),
    );
  }
}
