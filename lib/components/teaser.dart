
import 'package:dr_ramy/components/no_account_text.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:flutter/material.dart';


class Teaser extends StatelessWidget {
  var btnText ="";
  IconData i;


  Teaser({required this.btnText,required this.i});
  @override
  Widget build(BuildContext context) {
    return
      Container(
        decoration: BoxDecoration(
          color: Colors.white,
         borderRadius: BorderRadius.all(Radius.circular(10))),
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
        child: Center(
          child: Container(
                      //color: kPrimaryLightColor,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                       // crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          NoAccountText(
                            text: '${btnText}',
                            col: Colors.black,

                            ),

                        ],
                      ),
                    ),
        ),
    );
  }
}
