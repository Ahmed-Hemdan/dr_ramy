import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_ramy/components/drawer.dart';
import 'package:dr_ramy/models/Slidermodel.dart';

import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
class SliderDetails extends StatefulWidget {
 final Data? data;

  SliderDetails({Key? key,required this.data}) : super(key: key);
  @override
  _SliderDetailsState createState() => _SliderDetailsState();
}

class _SliderDetailsState extends State<SliderDetails> {
  // ArticleDetails? details;
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   articles().getArticleDetails(widget.article_id).then((value) {
  //     setState(() {
  //       details=value;
  //     });
  //   });
  // }

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
              child: widget.data==null?Container():Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                //  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 180,
                        width: SizeConfig.screenWidth,
                        decoration: BoxDecoration(
                            borderRadius:BorderRadius.only(bottomRight: Radius.circular(15.0),bottomLeft: Radius.circular(15.0))),
                        // margin: EdgeInsets.all(5.0),
                        child: ClipRRect(
                            borderRadius: BorderRadius.only(bottomRight: Radius.circular(25.0),bottomLeft: Radius.circular(25.0)),
                            child:
                            CachedNetworkImage(
                              fit: BoxFit.fill,
                              fadeOutDuration: Duration(milliseconds: 500),
                              fadeInDuration:  Duration(milliseconds: 500),
                              imageUrl:widget.data!.imagePath,
                              placeholder: (context, url) => Image.asset('assets/icon.png',width: 1000,),
                              errorWidget: (context, url, error) => Image.asset('assets/icon.png',width: 1000,),
                            ),
                        ),
                            //Image.network(widget.data!.imagePath,fit: BoxFit.fill,width: 1000,)),
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
                        Expanded(child: Text(widget.data!.title, style: TextStyle(fontWeight:FontWeight.w800,color:kTextTitleColor ,fontSize: 19),)),
                      ],
                    ),
                  ),
                  // SizedBox(height: 10,),
                  //
                  // SizedBox(height: 10,),

                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      //
                      children: [
                        Expanded(child: Text('${parse(widget.data!.description).body!.text}')),
                      ],
                    ),
                  )
                ],
              ),
            )

        )));

  }
}
