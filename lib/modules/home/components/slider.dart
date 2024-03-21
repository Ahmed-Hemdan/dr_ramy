import 'package:cached_network_image/cached_network_image.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:dr_ramy/models/Slidermodel.dart';

import 'package:dr_ramy/modules/home/components/slider_details.dart';

import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';



class ImageSlider extends StatefulWidget {
 static Sliders? sliders;
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<ImageSlider> {

  int _current = 0;
 // var bannerItems = [];

  void initState() {
    // TODO: implement initState
    super.initState();

  }
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    return  ImageSlider.sliders==null?
    Shimmer.fromColors(
        baseColor: Colors.grey[400]!,
        highlightColor: Colors.grey[100]!,
        enabled: true,
        child:Container(
            height: SizeConfig.screenHeight/3.5,
      color: Colors.grey.withOpacity(0.6),
    )):
    Column(
        children: [
      CarouselSlider(
      items:  ImageSlider.sliders!.data
        .map((item) =>
        InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (c)=>SliderDetails(data: item)));
            },

            child: Container(

    child: ClipRRect(
   // borderRadius: BorderRadius.all(Radius.circular(0)),
    child: Stack(
    children: <Widget>[
      CachedNetworkImage(
        //fadeOutDuration: Duration(milliseconds: 200),
        fadeOutDuration: Duration(milliseconds: 300),
        fadeInDuration:  Duration(milliseconds: 500),
        width: SizeConfig.screenWidth,
        fit: BoxFit.contain,
        imageUrl: item.imagePath,
        placeholder: (context, url) => Image.asset('assets/icon.png',width: 1000,),
        errorWidget: (context, url, error) => Image.asset('assets/icon.png',width: 1000,),
      ),
    //Image.network(item.imagePath, fit: BoxFit.cover, width: 1000.0),
      // Positioned(
      //
      //     child: Container(
      //   child: Text(bannerItems[imgList.indexOf(item)]),
      // ))
      Positioned(
        bottom: 0.0,
        left: 0.0,
        right: 0.0,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
            colors: [
              Color.fromARGB(200, 0, 0, 0),
              Color.fromARGB(0, 0, 0, 0)
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 8.0, horizontal: 20.0),
          child: Text(
            item.title,
            style: TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),

    ],
    )),
    ),
    ))
        .toList(),
        carouselController: _controller,
        options: CarouselOptions(
         viewportFraction: 2,
          autoPlayCurve:Curves.easeInOut ,
          autoPlayAnimationDuration: Duration(milliseconds: 400),
            autoPlay: true,
           // enlargeCenterPage: true,
           aspectRatio: 2,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  ImageSlider.sliders!.data.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 20.0,
                height: 10.0,
                margin: EdgeInsets.only(top: 12.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.light
                        ? Colors.grey
                        : kPrimaryColor)
                        .withOpacity(_current == entry.key ? 0.9 : 0.4)),
              ),
            );
          }).toList(),
        ),
      ]);
  }
}
