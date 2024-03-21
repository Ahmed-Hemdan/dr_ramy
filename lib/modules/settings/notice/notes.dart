import 'package:dr_ramy/components/drawer.dart';
import 'package:dr_ramy/components/profileimg.dart';
import 'package:dr_ramy/components/teaser2.dart';
import 'package:dr_ramy/models/articles.dart';
import 'package:dr_ramy/modules/all_articles/all_articles_screen.dart';
import 'package:dr_ramy/modules/settings/notice/gallery.dart';
import 'package:dr_ramy/services/articles_api.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:flutter/material.dart';

import '../../../style/size_config.dart';
import 'all_videos.dart';
class Notice extends StatefulWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  Articles? articles;
  @override
  void initState() {
        ArticlesApi().getAllArticles().then((value) {
          setState(() {
            articles=value;
      });
    });
    super.initState();
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
            "ملاحظات الادارة",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
            actions: [ Image.asset('assets/icon2.png',height: 50,width: 50,),]
        ),
        body: SafeArea(child: SingleChildScrollView(child: Detailsbody(a: articles,))));
  }
}

class Detailsbody extends StatelessWidget {
  final Articles? a;
  Detailsbody({this.a});
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          profile(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (c)=>settingsvideo()));

                },
                child: Container(
                    height: 100,
                    width:  SizeConfig.screenHeight<600?100:150,
                    //  color: Colors.transpaent,
                    child: Teaser2(
                      btnText: "فيديوهات",
                      i: Icons.video_collection,
                    )),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (c)=>AllArticles(all_articles: a,)));
                },
                child: Container(
                    height: 100,
                    width:  SizeConfig.screenHeight<600?100:150,
                    //  color: Colors.transparent,
                    child: Teaser2(
                      btnText: "مقالات",
                      i: Icons.calendar_today,
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
                  Navigator.push(context, MaterialPageRoute(builder: (c)=>Gallery()));
                },
                child: Container(
                    height: 100,
                    width:  SizeConfig.screenHeight<600?100:150,
                    //  color: Colors.transparent,
                    child: Teaser2(
                      btnText: "صور",
                      i: Icons.camera,
                    )),
              ),
              SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  //  Navigator.push(context, MaterialPageRoute(builder: (c)=>ReservedScreen()));
                },
                child: Container(
                    height: 100,
                    width:  SizeConfig.screenHeight<600?100:150,
                    //  color: Colors.transparent,
                    child: Teaser2(
                      btnText: "رسائل",
                      i: Icons.email,
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          // Padding(
          //   padding: const EdgeInsets.all(20.0),
          //   child: ButtonWidget3(
          //     btnText: "تواصل مع الادارة",
          //     onClick: () {
          //       //Navigator.push(context, MaterialPageRoute(builder: (c)=>LogInScreen()));
          //     },
          //   ),
          // ),

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

