import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_ramy/components/title.dart';

import 'package:dr_ramy/models/articles.dart';
import 'package:dr_ramy/modules/all_articles/all_articles_screen.dart';
import 'package:dr_ramy/modules/all_articles/specific_article/specific_article_screen.dart';

import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

import 'package:shimmer/shimmer.dart';
class SideEffectsArticles extends StatefulWidget {
  static Articles? side_articles;
  const SideEffectsArticles({Key? key}) : super(key: key);

  @override
  _SideEffectsArticlesState createState() => _SideEffectsArticlesState();
}

class _SideEffectsArticlesState extends State<SideEffectsArticles> {

   //int? day;
   void initState() {
     super.initState();

     //  SharedPreferences.getInstance().then((prefs) {
    //    setState(() {
    //      day=prefs.getInt('days_number');
    //    });
    //    ArticlesApi().getCategory(19,day!).then((value){
    //      setState(() {
    //        SideEffectsArticles.side_articles=value;
    //      });
    //      // print("the message is --${diet!.message}");
    //    });
    //    SideEffectsArticles.side_articles==null?
    // ):null;
    //
    //  });

     // TODO: implement initState
   }
  @override
  Widget build(BuildContext context) {
     return Column(
       children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceBetween,
           children: [
             Titlewidget(title: 'مقالات عن الاعراض الجانبية'),
             Padding(
               padding: const EdgeInsets.only(left: 8.0),
               child:
               InkWell(
                 onTap: () {
                   Navigator.push(
                       context, MaterialPageRoute(builder: (c) =>
                       AllArticles(all_articles:SideEffectsArticles.side_articles )));
                 },
                 child: Text('Show More'),
               ),
             )
           ],
         ),
         SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:
          SideEffectsArticles.side_articles==null?Shimmer.fromColors(
              baseColor: Colors.grey[400]!,
              highlightColor: Colors.grey[100]!,
              enabled: true,
              child:Container(
                height: 200,
                width: SizeConfig.screenWidth-50,
                color: Colors.grey.withOpacity(0.6),
              )):
          Row(
            children: [
              ...List.generate(
                SideEffectsArticles.side_articles!.data.length>10?10:SideEffectsArticles.side_articles!.data.length,
                //  snapshot.data.allProducts.length,
                    (index) {
                  // if (snapshot.data.allProducts[index].isOffer==1)
                  return InkWell(
                      child: SideArticle(SideEffectsArticles.side_articles!.data[index].title,SideEffectsArticles.side_articles!.data[index].image)
                  ,
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => SpecificArticle(
                              article_id: SideEffectsArticles.side_articles!.data[index].id,
                            )));
                  },);
                  return SizedBox
                      .shrink(); // here by default width and height is 0
                },
              ),
              SizedBox(width: 20),
            ],
          )
    ),
       ],
     );
  }

  Widget SideArticle(String? desc,String? imgurl) {
return Padding(
  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
  child:
  Card(
    elevation: 5,
    child: Container(
      height: 250,
      width: 200,
      decoration: BoxDecoration(border: Border.all(color: kPrimaryLightColor),
          borderRadius:BorderRadius.all(Radius.circular(5.0))),
      child: Column(
        children: <Widget>[
          CachedNetworkImage(
            fadeOutDuration: Duration(milliseconds: 500),
            fadeInDuration:  Duration(milliseconds: 500),
           //  height: 200,
           // width: 200,
        fit: BoxFit.contain,
            imageUrl: imgurl!,
            placeholder: (context, url) => Image.asset('assets/icon.png',width: 1000,),
            errorWidget: (context, url, error) => Image.asset('assets/icon.png',width: 1000,),
          ),
         // Image.network(imgurl!,fit: BoxFit.fill, height: 200,width: 200),
          SizedBox(width: 3,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('${parse(desc).body!.text}',style: TextStyle(fontWeight: FontWeight.w600)),
              ],
            ),
          ),


        ],
      ),
    ),
  )
  // Container(
  //   height: 230,
  //   width: 200,
  //   decoration: BoxDecoration(
  //      // color:kTextTitleColor.withOpacity(0.2),
  //       //border: Border.all(color: kPrimaryLightColor),
  //   borderRadius:BorderRadius.all(Radius.circular(5.0))),
  //  // margin: EdgeInsets.all(5.0),
  //   child: Card(
  //
  //     elevation: 5,
  //       child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceAround,
  //     children: [
  //       Image.network(imgurl!,fit: BoxFit.fill, height: 110,width: 150),
  //
  //       Row(
  //         children: [
  //           Icon(Icons.star,color: kbuttonColor2,size: 15,),
  //           SizedBox(width: 3,),
  //           Expanded(child: Text(desc!)),
  //         ],
  //       )
  //
  //     ],
  //   )),
  // ),
);

  }
}
