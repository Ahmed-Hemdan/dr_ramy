
import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';


class ButtonWidget2 extends StatelessWidget {
  var btnText ="";
  var onClick;
  var color;
  ButtonWidget2({required this.btnText, this.onClick, this.color=kbuttonColor2});
  @override
  Widget build(BuildContext context) {
    return
      InkWell(
      onTap: onClick,
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.only(
        topLeft:     Radius.circular(100),
            bottomLeft:     Radius.circular(100),
          ),
        ),
        alignment: Alignment.center,
        child: Center(
          child: Text(
            btnText,
            style: TextStyle(
                fontSize: getProportionateScreenWidth(15.0),
                color: Colors.white,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
