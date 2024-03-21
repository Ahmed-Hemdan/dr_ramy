import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dr_ramy/components/title.dart';
import 'package:dr_ramy/models/articles.dart';
import 'package:dr_ramy/models/doctor_image.dart';
import 'package:dr_ramy/modules/all_articles/all_articles_screen.dart';
import 'package:dr_ramy/modules/all_articles/specific_article/specific_article_screen.dart';

import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:shimmer/shimmer.dart';

class DrRamyArticles extends StatefulWidget {
  static Articles? all_articles;
  final DoctorImage? doctorImage;
  DrRamyArticles({this.doctorImage});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<DrRamyArticles> {



  // List<Widget> imageSliders =

  int _current = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // ArticlesApi().getAllArticles().then((value) {
    //   if(mounted)
    //   setState(() {
    //     DrRamyArticles.all_articles=value;
    //   });
    // });
    //
    // doctors_api().getDoctorImage().then((value) {
    //   setState(() {
    //     widget.doctorImage=value;
    //   });
    // });
  }
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return DrRamyArticles.all_articles==null?Shimmer.fromColors(
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[100]!,
        enabled: true,
        child:Container(
          height: 200,
          width: SizeConfig.screenWidth-10,
          color: Colors.grey.withOpacity(0.6),
        )):
      Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Titlewidget(title: 'مقالات دكتور رامي'),
            Padding(
              padding: const EdgeInsets.only(left: 0.0),
              child: InkWell(child: Text('Show More'),
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (c) =>
                      AllArticles(all_articles: DrRamyArticles.all_articles,)));
                },),
            )
          ],
        ),
      Expanded(
        child: CarouselSlider(
          items: List.generate(
              DrRamyArticles.all_articles!.data.length>10?
              10:DrRamyArticles.all_articles!.data.length, (index) {
            return Card(
              child: Container(
                //width: SizeConfig.screenWidth-10,
               // height: 250,
                decoration: BoxDecoration(
                   color: Colors.grey.withOpacity(0.2),
                 // color: Colors.white,
                  borderRadius: BorderRadius.all(Radius
                      .circular(5.0)),),
                child:
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (c)=>SpecificArticle(article_id: DrRamyArticles.all_articles!.data[index].id,)));
                  },

                  child: Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child:
                        SingleChildScrollView(
                          child: Column(
                            children: <Widget>[
                              //Image.network(item, fit: BoxFit.cover, width: 1000.0),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                   Row(
                                      children: [
                                        widget.doctorImage==null?Icon(Icons.account_circle,size: 25,color: kbuttonColor2,):
                                        Container(
                                            child: CircleAvatar(
                                                backgroundColor: Colors.white,
                                                //backgroundImage:
                                                //Image.network(web.data[index].image,),
                                                radius: SizeConfig.screenHeight<600?20:25,
                                                child: ClipRRect(
                                                  child: Image.network(widget.doctorImage!.data.image,height: 50,width: 50,),
                                                  //   //Text('A', style: TextStyle(color: kbuttonColor2,fontWeight: FontWeight.bold),),
                                                  borderRadius: BorderRadius.circular(25.0),
                                                  // ),
                                                ))
                                        ),

                                        SizedBox(width: 5,),
                                        Text('مدونة صغيرة للدكتور رامي',  style: TextStyle( fontWeight: FontWeight.bold,color: kTextTitleColor,fontSize: 16)),
                                      ],
                                    ),

                                    Row(
                                      children: [
                                        Icon(Icons.star,color: kbuttonColor2,size: 15,),
                                        Icon(Icons.star,color: kbuttonColor2,size: 15,),
                                        Icon(Icons.star,color: kbuttonColor2,size: 15,),
                                        Icon(Icons.star,color: kbuttonColor2,size: 15,),
                                        Icon(Icons.star,color: kbuttonColor2,size: 15,),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                                child: Row(
                                  children: [

                                    Expanded(child: Text('${parse(DrRamyArticles.all_articles!.data[index].brief).body!.text}',maxLines: 20,)),
                                  ],
                                ),
                              )

                            ],
                          ),
                        )),
                  ),
                ),
              ),
            );
          }),
          carouselController: _controller,
          options: CarouselOptions(
              viewportFraction: 1,
              autoPlay: true,
              enlargeCenterPage: true,
              aspectRatio: 1.9,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate( DrRamyArticles.all_articles!.data.length>10?
        10:DrRamyArticles.all_articles!.data.length, (index){
          return GestureDetector(
            onTap: () {
           _controller.animateToPage(index);
            } ,
            child: Container(
              width: 21.0,
              height: 10.0,
              margin: EdgeInsets.only(top: 10.0),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (Theme.of(context).brightness == Brightness.light
                      ? kPrimaryColor
                      : kbuttonColor)
                      .withOpacity(_current == index? 1 : 0.4)),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}
