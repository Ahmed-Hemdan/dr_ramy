import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';


class NoAccountText extends StatelessWidget {
  String text;
  var onClick;
  Color col;
  double size;
NoAccountText({required this.text,this.onClick, this.col=Colors.white,this.size=16});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onClick,
          child: Text(
            "$text",
            style: TextStyle(
              fontWeight: FontWeight.bold,
                fontSize: getProportionateScreenWidth(size),
                color: col==null?Colors.black:col),
          ),
        ),
      ],
    );
  }
}
