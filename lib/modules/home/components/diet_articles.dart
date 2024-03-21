import 'package:dr_ramy/components/title.dart';
import 'package:dr_ramy/models/articles.dart';
import 'package:dr_ramy/modules/all_articles/all_articles_screen.dart';
import 'package:dr_ramy/modules/all_articles/specific_article/specific_article_screen.dart';

import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import 'package:shimmer/shimmer.dart';

class DietAdvice extends StatefulWidget {
  static Articles? diet;
  const DietAdvice({Key? key}) : super(key: key);

  @override
  State<DietAdvice> createState() => _DietAdviceState();
}

class _DietAdviceState extends State<DietAdvice> {

  int? daynumber;
  //List<Data>? advices;
  @override
  void initState() {
    // SharedPreferences.getInstance().then((prefs) {
    //   setState(() {
    //     daynumber=prefs.getInt('days_number');
    //   });
    //   ArticlesApi().getCategory(17,daynumber!).then((value){
    //       setState(() {
    //         DietAdvice.diet=value;
    //       });
    //       // print("the message is --${diet!.message}");
    //   });
    //   DietAdvice.diet==null?
    //   ArticlesApi().getCategorywithoutday(17).then((value2) {
    //     setState(() {
    //       DietAdvice.diet=value2;
    //     });
    //   }):null;
    //
    // });
    // setState(() {
    //  advices=DietAdvice.diet!.data.reversed.toList();
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
            Titlewidget(title: 'مقالات عن انظمة الدايت'),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child:
              InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (c) =>
                      AllArticles(all_articles: DietAdvice.diet)));
                },
                child: Text('Show More'),
              ),
            )
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DietAdvice.diet==null?Shimmer.fromColors(
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
                DietAdvice.diet!.data.length>10?10:DietAdvice.diet!.data.length,
                //  snapshot.data.allProducts.length,
                    (index) {
                  // if (snapshot.data.allProducts[index].isOffer==1)
                  return Row(
                    children: [
                      InkWell(child:advice( DietAdvice.diet!.data[index].title,
                          DietAdvice.diet!.data[index].brief
                          , index),onTap: (){

                        Navigator.push(context, MaterialPageRoute(builder: (c)=>SpecificArticle(article_id:DietAdvice.diet!.data[index].id)));

                      } ,),
                      //
                      // SizedBox(
                      //   width: 10,
                      // )
                    ],
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

  advice( String title, String des, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8),
      child: Card(
        elevation: 3,
        shadowColor: kPrimaryColor,
        child: Container(
          height: 180,
          width: SizeConfig.screenWidth-100,
          decoration: BoxDecoration(
              color: index.isOdd?kTextTitleColor.withOpacity(0.2):Colors.grey.withOpacity(0.2),
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
                      Text(title,style: TextStyle(fontWeight: FontWeight.w900),),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(child: Text('${parse(des).body!.text}',style: TextStyle(fontSize: 15),)),

                        ],
                      )
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
