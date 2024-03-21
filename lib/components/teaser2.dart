
import 'package:dr_ramy/style/colors.dart';
import 'package:flutter/material.dart';


import 'no_account_text.dart';
class Teaser2 extends StatelessWidget {
  var btnText ="";
  IconData i;


  Teaser2({required this.btnText,required this.i});
  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(border: Border.all(color: kPrimaryColor, width: 2),borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight:Radius.circular(10))),
        constraints: BoxConstraints.tight(
          Size(
            150,
            300,
          ),
        ),
        // padding: EdgeInsets.symmetric(
        //   horizontal: 5,
        //   vertical: 5,
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          Container(
              margin:EdgeInsets.only(top: 20)
              ,child: Icon(i,color: kbuttonColor2,size: 30,)),
      Container(
        decoration: BoxDecoration(
          gradient: kHeaderGradientColor,
        ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      NoAccountText(
                        text: '${btnText}',
                        col: Colors.white,

                        ),

                    ],
                  ),
                ),


          ],
        ),
    );
  }
}
