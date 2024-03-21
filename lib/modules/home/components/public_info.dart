import 'package:dr_ramy/components/title.dart';

import 'package:dr_ramy/models/articles.dart';
import 'package:dr_ramy/modules/all_articles/all_articles_screen.dart';
import 'package:dr_ramy/modules/all_articles/specific_article/specific_article_screen.dart';

import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import 'package:shimmer/shimmer.dart';
class PublicInfo extends StatefulWidget {
  static Articles? public_info;
  const PublicInfo({Key? key}) : super(key: key);
  @override
  State<PublicInfo> createState() => _PublicInfoState();
}

class _PublicInfoState extends State<PublicInfo> {
  int? day;
  @override
  void initState() {
    // SharedPreferences.getInstance().then((prefs) {
    //   setState(() {
    //     day=prefs.getInt('days_number');
    //   });
    //   ArticlesApi().getCategory(12,day!).then((value){
    //     setState(() {
    //       PublicInfo.public_info=value;
    //     });
    //     // print("the message is --${diet!.message}");
    //   });
    //   PublicInfo.public_info==null?
    //   ArticlesApi().getCategorywithoutday(12).then((value2) {
    //     setState(() {
    //       PublicInfo.public_info=value2;
    //     });
    //   }):null;
    //
    // });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Titlewidget(title: 'معلومات عامة تهمك'),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child:
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (c) =>
                      AllArticles(all_articles:  PublicInfo.public_info)));
                },
                child: Text('Show More'),
              ),
            )
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:  PublicInfo.public_info==null?Shimmer.fromColors(
              baseColor: Colors.grey[400]!,
              highlightColor: Colors.grey[100]!,
              enabled: true,
              child:Container(
                height: 200,
                width: SizeConfig.screenWidth-50,
                color: Colors.grey.withOpacity(0.6),
              )):Row(
            children: [
              ...List.generate(
                PublicInfo.public_info!.data.length>10?10: PublicInfo.public_info!.data.length,
                //  snapshot.data.allProducts.length,
                    (index) {
                  // if (snapshot.data.allProducts[index].isOffer==1)
                  return InkWell(
                    onTap: (){
                      Navigator.push(
                          context, MaterialPageRoute(builder: (c) =>
                          SpecificArticle( article_id:  PublicInfo.public_info!.data[index].id,)));
                    },
                    child: Row(
                      children: [
                        title(title:  PublicInfo.public_info!.data[index].title,title2:  PublicInfo.public_info!.data[index].brief)
                        //
                        // SizedBox(
                        //   width: 10,
                        // )
                      ],
                    ),
                  );
                  return SizedBox.shrink(); // here by default width and height is 0
                },
              ),
              // SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );

  }
}
Widget title({required String title,required String title2 })
{

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 3,
      //shadowColor: kPrimaryColor,
      child: Container(
       height: 170,
        width: SizeConfig.screenWidth-100,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.2),
            //border: Border.all(color: kPrimaryLightColor),
            borderRadius: BorderRadius.all(Radius.circular(5.0))),
       // margin: EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(child: Text(title,style: TextStyle(fontWeight: FontWeight.w900),)),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(child: Text('${parse(title2).body!.text}',style: TextStyle(fontSize: 15),)),


                      ],
                    ),
                   ]),
            )
          ),
        ),
      ),
    ),
  );
  // return Padding(
  //   padding: const EdgeInsets.all(8.0),
  //   child: Column(
  //     children: [
  //       Row(
  //         children: [
  //           Expanded(child: Text(title,style: TextStyle(fontWeight: FontWeight.bold),)),
  //         ],
  //       ),
  //       Row(
  //         children: [
  //           Expanded(child: Text(title2)),
  //         ],
  //       ),
  //     ],
  //   ),
  // );
}

