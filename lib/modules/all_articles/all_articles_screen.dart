import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_ramy/components/cachimg.dart';
import 'package:dr_ramy/components/drawer.dart';
import 'package:dr_ramy/components/title.dart';
import 'package:dr_ramy/models/articles.dart';
import 'package:dr_ramy/modules/all_articles/specific_article/specific_article_screen.dart';
import 'package:dr_ramy/services/articles_api.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter_placeholder_textlines/placeholder_lines.dart';
// final List<String> imgList = [
//   'تعتبر عملية  الحل الأمثل لمن عانوا كثيراً من الفشل فى النزول فى الوزن بالدايت أو الرياضة .فهذه ليست النهاية لهم. توجد حلول جديدة و متطورة و هى جراحات السمنة التى حققت حلم كان يراود الكثيرين  و هى جراحات السمنة التى حققت حلم كان يراود الكثيرين. ',
//   'تعتبر عملية  الحل الأمثل لمن عانوا كثيراً من الفشل فى النزول فى الوزن بالدايت أو الرياضة .فهذه ليست النهاية لهم. توجد حلول جديدة و متطورةو هى جراحات السمنة التى حققت حلم كان يراود الكثيرين و هى جراحات السمنة التى حققت حلم كان يراود الكثيرين ',
//   'تعتبر عملية  الحل الأمثل لمن عانوا كثيراً من الفشل فى النزول فى الوزن بالدايت أو الرياضة .فهذه ليست النهاية لهم. توجد حلول جديدة و متطورةو هى جراحات السمنة التى حققت حلم كان يراود الكثيرين و هى جراحات السمنة التى حققت حلم كان يراود الكثيرين.'
//   ,'تعتبر عملية  الحل الأمثل لمن عانوا كثيراً من الفشل فى النزول فى الوزن بالدايت أو الرياضة .فهذه ليست النهاية لهم. توجد حلول جديدة و متطورةو هى جراحات السمنة التى حققت حلم كان يراود الكثيرين و هى جراحات السمنة التى حققت حلم كان يراود الكثيرين .'
//   ,'تعتبر عملية  الحل الأمثل لمن عانوا كثيراً من الفشل فى النزول فى الوزن بالدايت أو الرياضة .فهذه ليست النهاية لهم. توجد حلول جديدة و متطورةو هى جراحات السمنة التى حققت حلم كان يراود الكثيرين و هى جراحات السمنة التى حققت حلم كان يراود الكثيرين '
//
// ];
class AllArticles extends StatefulWidget {
  final Articles? all_articles;
  const AllArticles({Key? key,required this.all_articles}) : super(key: key);

  @override
  _AllArticlesState createState() => _AllArticlesState();
}

class _AllArticlesState extends State<AllArticles> {

   bool _enabled = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(milliseconds: 7), () {
  //     ArticlesApi().getAllArticles().then((value) {
  //       setState(() {
  //         all_articles=value;
  //   });
  // });
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
            "المقالات",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
            actions: [ Image.asset('assets/icon2.png',height: 50,width: 50,),]
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: widget.all_articles==null?
                //_buildCustomColorSizePlaceholder()
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  enabled: true,
                  child:
    ListView.builder(
    itemCount: widget.all_articles!.data.length,
    physics: NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemBuilder: (c,index){

            return Padding(
                padding: const EdgeInsets.all(5.0),
                child:SingleChildScrollView(
                  physics: ScrollPhysics(),
                  child: Column(
                    children: [
                      Container(
                        height: SizeConfig.screenHeight/2,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                )
            );
    }))

                    :
                    ListView.builder(
                      itemCount: widget.all_articles!.data.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (c,index){

                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child:InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (c)=>SpecificArticle(article_id:widget.all_articles!.data[index].id)));
                            },
                            child: item(index))
                    );})

              ),
            ],
          ),
        )));
  }


  Widget item(int index) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(15)),),
      elevation: 15,
      child: Container(
        height: SizeConfig.screenHeight/1.5,
          decoration: BoxDecoration(border: Border.all(color: kPrimaryLightColor),
              borderRadius:BorderRadius.all(Radius.circular(15.0))),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: Container(
                  width: SizeConfig.screenWidth,
                  decoration: BoxDecoration(
                      borderRadius:BorderRadius.all(Radius.circular(5.0))),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      child:
                      //cacheimage(all_articles!.data[index].image)

                      widget.all_articles!.data[index].image==null?
                      Image.asset('assets/cache.webp'):
                      CachedNetworkImage(
                        fadeOutDuration: Duration(milliseconds: 500),
                        fadeInDuration:  Duration(milliseconds: 500),
                      // height: 370,
                        fit: BoxFit.fill,
                        imageUrl: widget.all_articles!.data[index].image,
                        placeholder: (context, url) => Image.asset('assets/icon.png',width: 1000,),
                        errorWidget: (context, url, error) => Image.asset('assets/icon.png',width: 1000,),
                      ),
                     // Image.network(widget.all_articles!.data[index].image,fit: BoxFit.fill,height: 190,)
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                   Expanded(child: Text('${widget.all_articles!.data[index].title}',maxLines:3,style: TextStyle( fontWeight: FontWeight.bold,color: kTextTitleColor,fontSize: 18,),))
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Row(
                    children:[

                      Expanded(child: Text( '${parse(widget.all_articles!.data[index].brief).body!.text}')),
                    ],
                  ),
                ),
              )

            ],
          ),
    ),
    );
  }
}
