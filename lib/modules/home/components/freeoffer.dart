import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dr_ramy/components/btn_widget3.dart';

import 'package:dr_ramy/models/articles.dart';
import 'package:dr_ramy/modules/offers/offer_details/offer_details.dart';

import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class FreeOffer extends StatefulWidget {
  static Articles? oneoffer;
  const FreeOffer({Key? key}) : super(key: key);

  @override
  State<FreeOffer> createState() => _FreeOfferState();
}

class _FreeOfferState extends State<FreeOffer> {

  int _current = 1;
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return FreeOffer.oneoffer==null? Shimmer.fromColors(
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[100]!,
        enabled: true,
        child:Container(
         //height: 200,
          width: SizeConfig.screenWidth-50,
          color: Colors.grey.withOpacity(0.6),
        )):
    CarouselSlider(
    options:CarouselOptions(
      initialPage: _current,
     height: 350,
      disableCenter: true,
       reverse: false,
       enableInfiniteScroll: false,
       viewportFraction: 0.9,
        autoPlay: false,
        enlargeCenterPage: true,
        aspectRatio:1,
        onPageChanged: (index, reason) {
          setState(() {
            _current = index;
          });
        }),
        items: List.generate(5, (index) {
         return Stack(
            children: [
              Container(
             //height: 380,
                decoration: BoxDecoration(border: Border.all(color: kPrimaryLightColor),
                    borderRadius:BorderRadius.all(Radius.circular(5.0))),
               // margin: EdgeInsets.all(5.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    child:
                    InkWell(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (c) => OfferDetails(
                                    id:FreeOffer.oneoffer!.data[index].id
                                )));
                      },
                      child: CachedNetworkImage(
                        fadeOutDuration: Duration(milliseconds: 500),
                        fadeInDuration:  Duration(milliseconds: 500),
                        fit:BoxFit.contain ,
                        imageUrl: FreeOffer.oneoffer!.data[index].image,
                        placeholder: (context, url) => Image.asset('assets/icon.png',width: 1000,),
                        errorWidget: (context, url, error) => Image.asset('assets/icon.png',width: 1000,),
                      ),
                    ),
                   // Image.network(oneoffer!.data[index].image,fit: BoxFit.fill,)
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,

                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 0),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: offersgradient
                    ),

                    child:
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 10),
            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.bookmark_outlined,size: 15,color: kbuttonColor2,),
                            SizedBox(width: 3,),
                            Expanded(child: Text(FreeOffer.oneoffer!.data[index].title,  maxLines:2,style: TextStyle( fontWeight: FontWeight.bold,color: Colors.white,fontSize: 15,))),
                            // Icon(Icons.bookmark_outlined,size: 15,color: kbuttonColor2,),
                            // SizedBox(width: 5,),
                           // Expanded(child: Text(oneoffer!.data[index].title,style:TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 20))),

                            SizedBox(width: 20,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Container(
                                  child: ButtonWidget3(btnText: 'احصل عليه',onClick: (){
                                    // ArticlesApi().RequestOffer(oneoffer!.data[index].id).then((value) {
                                    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('congratulations you get the offer')));
                                    //
                                    // });
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (c) => OfferDetails(
                                                id:FreeOffer.oneoffer!.data[index].id
                                            )));
                                  },),
                                  height: 30,
                                  width:80
                              ),
                            )
                          ],
                        ),
          ),
                    // Text(
                    //   item.title,
                    //   style: TextStyle(
                    //     color: Colors.white,
                    //     fontSize: 20.0,
                    //     fontWeight: FontWeight.bold,
                    //   ),
                    // ),
                  ),
                ),
              ),
              // Positioned(
              //   right: 0,
              //   left: 0,
              //   bottom: 20,
              //
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
              //     child: Container(
              //       height: 70,
              //       decoration: BoxDecoration(color: kPrimaryLightColor2.withOpacity(0.8),
              //           borderRadius:BorderRadius.all(Radius.circular(5.0))),
              //       margin: EdgeInsets.all(5.0),
              //       child: ClipRRect(
              //           borderRadius: BorderRadius.all(Radius.circular(5.0)),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.center,
              //             children: [
              //               Icon(Icons.bookmark_outlined,size: 15,color: kbuttonColor2,),
              //               SizedBox(width: 5,),
              //
              //               Expanded(child: Text(oneoffer!.data[index].title,style:TextStyle(color: Colors.black54,fontWeight: FontWeight.bold,fontSize: 20))),
              //
              //               SizedBox(width: 20,),
              //               Container(
              //                   child: ButtonWidget3(btnText: 'GET',onClick: (){
              //                     ArticlesApi().RequestOffer(oneoffer!.data[index].id).then((value) {
              //                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('congratulations you get the offer')));
              //
              //                     });
              //                   },),
              //                   height: 30,
              //                   width:70
              //               )
              //             ],
              //           )),
              //     ),
              //   ), )
            ],
          );
        })

    );
  }
}
