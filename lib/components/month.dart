import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_ramy/modules/all_articles/specific_article/specific_article_screen.dart';
import 'package:dr_ramy/modules/month_data/month_details.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
Widget month({required String text1,required String img, required BuildContext context,required int id}){
  return SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child: InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (c)=>SpecificArticle(article_id: id,)));
      },
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),

            child: Card(
              elevation: 10,
              child: Container(
                height:250,
                width:160,
                decoration: BoxDecoration(
                //  color: Colors.grey.withOpacity(0.2),
                   // border: Border.all(color: kbuttonColor2,width: 2),
                    borderRadius:BorderRadius.all(Radius.circular(15.0))),
                // color: Colors.transparent,
                  // image: DecorationImage(
                  //   image: AssetImage("assets/month.png"),
                  //   fit: BoxFit.fitWidth,

                 // ),
                child: Column(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: CachedNetworkImage(
                        fadeOutDuration: Duration(milliseconds: 500),
                        fadeInDuration:  Duration(milliseconds: 500),
                        //  height: 100,
                        // width: 200,
                        fit: BoxFit.contain,
                        imageUrl: img,
                        placeholder: (context, url) => Image.asset('assets/icon.png',width: 1000,),
                        errorWidget: (context, url, error) => Image.asset('assets/icon.png',width: 1000,),
                      ),
                    ),
                    // Image.network(imgurl!,fit: BoxFit.fill, height: 200,width: 200),
                    SizedBox(width: 3,),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('${parse(text1).body!.text}',style: TextStyle(fontWeight: FontWeight.w600)),
                      ),
                    ),


                  ],
                ),
                ),
              ),
          ),

        ],
      ),
    ),
  );
}