import 'package:dr_ramy/components/btn_widget3.dart';
import 'package:dr_ramy/components/drawer.dart';
import 'package:dr_ramy/components/month.dart';

import 'package:dr_ramy/components/profileimg.dart';
import 'package:dr_ramy/models/articles.dart';
import 'package:dr_ramy/modules/contact_us/contact_us.dart';
import 'package:dr_ramy/services/articles_api.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';
class FollowUpScreen extends StatefulWidget {

  const FollowUpScreen({Key? key}) : super(key: key);

  @override
  _FollowUpScreenState createState() => _FollowUpScreenState();
}

class _FollowUpScreenState extends State<FollowUpScreen> {
  Articles? allmonths;
  //int? day;
  void initState() {
    // SharedPreferences.getInstance().then((prefs) {
    //   setState(() {
    //     day=prefs.getInt('days_number');
    //   });
      ArticlesApi().getCategorywithoutday(18).then((value) {
        if(mounted)
        setState(() {
          allmonths=value;
        });
      });

  //  });

    // TODO: implement initState
    super.initState();
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
          "تعليمات التغذية",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
          actions: [ Image.asset('assets/icon2.png',height: 50,width: 50,),]

      ),
        body: SafeArea(child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                profile(),
                allmonths==null?
                GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    childAspectRatio:0.65,
                    //mainAxisSpacing: 20,
                    // crossAxisSpacing: 20,
                    children:
                    List.generate(4, (index) {
                      //      widget.title=snapshot.data.allProducts[index].data.title;
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Shimmer.fromColors(
                            baseColor: Colors.grey[400]!,
                            highlightColor: Colors.grey[100]!,
                            enabled: true,
                            child:Container(
                              height: 200,
                              width: SizeConfig.screenWidth,
                              color: Colors.grey.withOpacity(0.6),
                            )),
                      );
                    }).toList())
                    :
               // SizedBox(height: 30.0),
                GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                   childAspectRatio:0.65,
                    //mainAxisSpacing: 20,
                   // crossAxisSpacing: 20,
                    children:
                    List.generate(allmonths!.data.length, (index) {
                      //      widget.title=snapshot.data.allProducts[index].data.title;
                      return Padding(
                          padding: const EdgeInsets.all(0.0),
                                  child:

                             Center(child: month(text1: allmonths!.data[index].title,img: allmonths!.data[index].image,context:context, id:  allmonths!.data[index].id))
                              );
                    }).toList()),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ButtonWidget3(
                    btnText: "تواصل مع الادارة",
                    onClick: () {
                      Navigator.push(context, MaterialPageRoute(builder: (c)=>ContactUs()));
                    },
                  ),
                ),

              ],
            ),
          ),
        )));
      //Center(child: month(text1: 'الشهر',text2: 'الاول'),),

  }

}