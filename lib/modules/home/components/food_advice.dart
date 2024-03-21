import 'package:dr_ramy/components/title.dart';
import 'package:dr_ramy/models/articles.dart';
import 'package:dr_ramy/modules/all_articles/all_articles_screen.dart';
import 'package:dr_ramy/modules/all_articles/specific_article/specific_article_screen.dart';

import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import 'package:shimmer/shimmer.dart';

class FoodAdvice extends StatefulWidget {
  static  Articles? advices;
  const FoodAdvice({Key? key}) : super(key: key);

  @override
  State<FoodAdvice> createState() => _FoodAdviceState();
}

class _FoodAdviceState extends State<FoodAdvice> {

  int? day;
  void initState() {
    // SharedPreferences.getInstance().then((prefs) {
    //   setState(() {
    //     day=prefs.getInt('days_number');
    //   });
    //   ArticlesApi().getCategory(20,day!).then((value){
    //     setState(() {
    //       FoodAdvice.advices=value;
    //     });
    //     // print("the message is --${diet!.message}");
    //   });
    //   FoodAdvice.advices==null?
    //   ArticlesApi().getCategorywithoutday(20).then((value2) {
    //     setState(() {
    //       FoodAdvice.advices=value2;
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
            Titlewidget(title: 'نصائح غذائية'),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (c) =>
                      AllArticles(all_articles: FoodAdvice.advices,)));
                },
                child: Text('Show More'),
              ),
            )
          ],
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:FoodAdvice.advices==null?Shimmer.fromColors(
              baseColor: Colors.grey[400]!,
              highlightColor: Colors.grey[100]!,
              enabled: true,
              child:Container(
                height: 200,
                width: SizeConfig.screenWidth-50,
                color: Colors.grey.withOpacity(0.6),
              )): Row(
            children: [
              ...List.generate(
                //2,
                //10,

                FoodAdvice.advices!.data.length>10?10:FoodAdvice.advices!.data.length,
                //  snapshot.data.allProducts.length,
                (index) {
                  // if (snapshot.data.allProducts[index].isOffer==1)
                  return
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (c)=>SpecificArticle(article_id: FoodAdvice.advices!.data[index].id)));
                      },
                      child: Row(
                      children: [
                        advice(FoodAdvice.advices!.data[index].title, 'top review', FoodAdvice.advices!.data[index].brief, index),
                        // SizedBox(
                        //   width: 10,
                        // )
                      ],
                  ),
                    );
                  return SizedBox.shrink(); // here by default width and height is 0
                },
              ),
            //  SizedBox(width: 20),
            ],
          ),
        ),
      ],
    );
  }

  advice(String name, String title, String des, int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 3,
        shadowColor: kPrimaryColor,
        child: Container(
          height: 200,
          width: SizeConfig.screenWidth-90,
          decoration: BoxDecoration(
            color: index.isEven?kTextTitleColor.withOpacity(0.2):Colors.grey.withOpacity(0.2),
              //border: Border.all(color: kPrimaryLightColor),
              borderRadius: BorderRadius.all(Radius.circular(5.0))),
         // margin: EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    children: <Widget>[

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(name
                              ,style: TextStyle(color: kbuttonColor,fontWeight: FontWeight.bold,fontSize: 20),),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: Text('${parse(des).body!.text}',style: TextStyle(fontSize: 17),)),
                          ],
                        ),
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
