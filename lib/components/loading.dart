import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_placeholder_textlines/placeholder_lines.dart';


Widget buildCustomColorSizePlaceholder() {
  return Container(
    width: 500,
    height: 50,
    child: PlaceholderLines(
      count: 3,
      //  align: TextAlign.center,
      lineHeight: 8,
      animate: true,
      animationOverlayColor: Colors.white,
      color: kTextColor2,
    ),
  );
}

Widget buildArticleColorSizePlaceholder() {
  return Container(
    width: SizeConfig.screenWidth,

    child: PlaceholderLines(
      count: 20,
      //  align: TextAlign.center,
      lineHeight: 8,
      animate: true,
      animationOverlayColor: Colors.white,
      color: kTextColor2,
    ),
  );
}