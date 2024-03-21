import 'package:dr_ramy/components/drawer.dart';

import 'package:dr_ramy/components/profileimg.dart';
import 'package:dr_ramy/models/article_details.dart';

import 'package:dr_ramy/services/articles_api.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';
class MonthDetails extends StatefulWidget {
  final String title;
  final int id;
  const MonthDetails({Key? key, required this.title,required this.id}) : super(key: key);

  @override
  State<MonthDetails> createState() => _MonthDetailsState();
}

class _MonthDetailsState extends State<MonthDetails> {
  ArticleDetails? monthdetails;
  @override
  void initState() {
    ArticlesApi().getArticleDetails(widget.id).then((value) {
      setState(() {
        monthdetails=value;
      });
    });
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
            widget.title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
            actions: [ Image.asset('assets/icon2.png',height: 50,width: 50,),]

        ),
        body: SafeArea(child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: SingleChildScrollView(child: monthdetails==null?Center(child: CircularProgressIndicator()):Column(
            children: [
              profile(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  child: SingleChildScrollView(
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(child: Text(
                            monthdetails!.data!.brief!
                        )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              //video(index: 2,context: context),
              SizedBox(height: 15,),
              Container(
                width: SizeConfig.screenWidth,
               decoration: BoxDecoration(border: Border.all(color: kPrimaryLightColor),
                   //borderRadius:BorderRadius.all(Radius.circular(5.0))
               ),
               // margin: EdgeInsets.all(5.0),
                child: Image.network(monthdetails!.data!.image!,fit: BoxFit.fill,height: 120,),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 80,
                  child: SingleChildScrollView(
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(child: Text(
                            monthdetails!.data!.body!                        )),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
            ],
          )),
        )));
  }
}
