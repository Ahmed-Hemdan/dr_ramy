import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';

team_member(String? name, String? bio, String? imageurl)
{
  return Card(
    elevation: 8,
    child: Column(

      children: [
        Container(
          width: (SizeConfig.screenWidth/2)-30,
          //getProportionateScreenWidth(150),
          height: SizeConfig.screenWidth/2,
          decoration: BoxDecoration(
             // border: Border.all(color: kPrimaryLightColor),
              borderRadius:BorderRadius.all(Radius.circular(5.0))),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
              child:
              CachedNetworkImage(
                fadeOutDuration: Duration(milliseconds: 500),
                fadeInDuration:  Duration(milliseconds: 500),
                height: 200,
                width: 200,
                fit: BoxFit.contain,
                imageUrl: imageurl!,
                placeholder: (context, url) => Image.asset('assets/icon.png',width: 1000,),
                errorWidget: (context, url, error) => Image.asset('assets/icon.png',width: 1000,),
              ),
          ),
        ),
        Container(
          width: getProportionateScreenWidth(160),
          child: Column(
            children: [
              Text(name!,  style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                maxLines: 2,),
              Text(bio!,),
            ],
          ),
        ),

      ],
    ),
  );
}