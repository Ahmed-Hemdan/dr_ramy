
import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';


class ButtonWidget3 extends StatelessWidget {
  var btnText ="";
  var onClick;
  Color color;
  ButtonWidget3({required this.btnText, this.onClick,this.color=kbuttonColor2});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child:
      Container(
        width: SizeConfig.screenWidth-50,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
           Radius.circular(100),
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
