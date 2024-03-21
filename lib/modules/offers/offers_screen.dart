import 'package:cached_network_image/cached_network_image.dart';

import 'package:dr_ramy/components/drawer.dart';

import 'package:dr_ramy/models/articles.dart';

import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';
import 'offer_details/offer_details.dart';

class OfferScreen extends StatefulWidget {
  static Articles? offers;
  const OfferScreen({Key? key}) : super(key: key);
  @override
  _OfferScreenState createState() => _OfferScreenState();
}
class _OfferScreenState extends State<OfferScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: drawer(),
        ),
        appBar: AppBar(
            elevation: 0,
            backgroundColor: kTextTitleColor,
            title: Text(
              "العروض",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            actions: [
              Image.asset(
                'assets/icon2.png',
                height: 50,
                width: 50,
              ),
            ]),
        body: SafeArea(
            child: SingleChildScrollView(
              physics: ScrollPhysics(),
              child: Column(
                children: [
                  Padding(
          padding: const EdgeInsets.all(8.0),
          child: OfferScreen.offers == null
                    ?
          Shimmer.fromColors(
                    baseColor: Colors.grey[300]!,
                    highlightColor: Colors.grey[100]!,
                    enabled: true,
                    child:
                    ListView.builder(
                        itemCount: OfferScreen.offers!.data.length,
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
                    itemCount: OfferScreen.offers!.data.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (c,index){

                      return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child:InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (c)=>OfferDetails(id:OfferScreen.offers!.data[index].id)));
                              },
                              child: offer(title: OfferScreen.offers!.data[index].title,imgurl:OfferScreen.offers!.data[index].image ,
                                  description:OfferScreen.offers!.data[index].body ,id:OfferScreen.offers!.data[index].id ,index:index ))
                      );})
        ),
                ],
              ),
            )));
  }

  Widget offer(
      {required String title,
      required String imgurl,
      required String description,
      required int id,
      required int index}) {
    return
      InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (c) => OfferDetails(
                    id:id
                    )));
      },
      child:
      Card(
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
                flex: 6,
                child: Container(
                  width: SizeConfig.screenWidth,
                  decoration: BoxDecoration(
                      borderRadius:BorderRadius.all(Radius.circular(5.0))),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    child:
                    //cacheimage(all_articles!.data[index].image)

                    imgurl==null?
                    Image.asset('assets/cache.webp'):
                    CachedNetworkImage(
                      fadeOutDuration: Duration(milliseconds: 500),
                      fadeInDuration:  Duration(milliseconds: 500),
                      // height: 370,
                      fit: BoxFit.fill,
                      imageUrl: imgurl,
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
                      Expanded(child: Text(title,maxLines:3,style: TextStyle( fontWeight: FontWeight.bold,color: kTextTitleColor,fontSize: 18,),))
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

                      Expanded(child: Text(description)),
                    ],
                  ),
                ),
              )

            ],
          ),
        ),
      )
    );
  }
}
