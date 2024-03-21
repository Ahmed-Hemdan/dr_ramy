import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_ramy/components/drawer.dart';
import 'package:dr_ramy/components/loading.dart';
import 'package:dr_ramy/models/article_details.dart';
import 'package:dr_ramy/services/articles_api.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:shimmer/shimmer.dart';
class SpecificArticle extends StatefulWidget {
  int article_id;
   SpecificArticle({Key? key,required this.article_id}) : super(key: key);
  @override
  _SpecificArticleState createState() => _SpecificArticleState();
}

class _SpecificArticleState extends State<SpecificArticle> {
  ArticleDetails? details;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ArticlesApi().getArticleDetails(widget.article_id).then((value) {
      if(mounted)
      setState(() {
        details=value;
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
          "المقالة",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
          actions: [ Image.asset('assets/icon2.png',height: 50,width: 50,),]
      ),
        body: SafeArea(child: Padding(
          padding: const EdgeInsets.all(0.0),
          child:  SingleChildScrollView(
            child: details==null?SingleChildScrollView(
              child: Column(
                children: [
                  Shimmer.fromColors(
                      baseColor: Colors.grey[400]!,
                      highlightColor: Colors.grey[100]!,
                      enabled: true,
                      child:Container(
                        height: 200,
                        width: SizeConfig.screenWidth,
                        color: Colors.grey.withOpacity(0.6),
                      )),
                  SizedBox(height: 20,),
                  buildArticleColorSizePlaceholder(),
                ],
              ),
            ):Column(
             // crossAxisAlignment: CrossAxisAlignment.center,
            //  mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      //height: SizeConfig.screenHeight/2-20,
                      width: SizeConfig.screenWidth,
                      decoration: BoxDecoration(
                        borderRadius:BorderRadius.only(bottomRight: Radius.circular(15.0),bottomLeft: Radius.circular(15.0))),
                      child: ClipRRect(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(15.0),bottomLeft: Radius.circular(15.0)),

                                child:
                                CachedNetworkImage(
                                  fadeOutDuration: Duration(milliseconds: 500),
                                  fadeInDuration:  Duration(milliseconds: 500),
                               // height: 400,
                                  fit: BoxFit.contain,
                                  imageUrl: details!.data!.image!,
                                  placeholder: (context, url) => Image.asset('assets/icon.png',width: 1000,),
                                  errorWidget: (context, url, error) => Image.asset('assets/icon.png',width: 1000,),
                                ),
                              // Image.network(details!.data!.image!,fit: BoxFit.fill,width: 1000,)
                            ),
                          ),
                        ],
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     Icon(Icons.star,color: kbuttonColor2,size: 15,),
                      //     Icon(Icons.star,color: kbuttonColor2,size: 15,),
                      //     Icon(Icons.star,color: kbuttonColor2,size: 15,),
                      //     Icon(Icons.star,color: kbuttonColor2,size: 15,),
                      //     Icon(Icons.star,color: kbuttonColor2,size: 15,),
                      //   ],
                      // ),
                     // SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(child: Text(details!.data!.title!, style: TextStyle(fontWeight:FontWeight.w800,color:kTextTitleColor ,fontSize: 19),)),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
                         // mainAxisAlignment: MainAxisAlignment.end,
                          //
                          children: [
                            Expanded(child: Text('${parse(details!.data!.body!).body!.text}')),
                          ],
                        ),
                      )
                    ],
                  ),
                )

  )));


  }
}
