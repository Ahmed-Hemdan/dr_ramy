import 'package:dr_ramy/style/colors.dart';
import 'package:flutter/material.dart';

Widget Titlewidget({required String title})
{
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
        Icon(Icons.bookmark_outlined,size: 15,color: kbuttonColor2,),
        SizedBox(width: 3,),
        Text(title,
            maxLines:2,style: TextStyle( fontWeight: FontWeight.bold,color: kTextTitleColor,fontSize: 18,)),
      ],
    ),
  );

}