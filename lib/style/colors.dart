
import 'package:flutter/material.dart';

const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  stops: [0.2,0.5],
  colors: [
    Color(0xFF2EB1C6),
    Color(0xFF148BBD),
  ],
);
const kButtonGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  stops: [0.1 ,0.3,0.5],
  colors: [
    Color(0xFF0473B7),
    Color(0xFF148ABC),
    Color(0xFF23A3C3),
  ],
);

const kButtonGradientColor2 = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  stops: [0.1 ,0.3,0.5],
  colors: [
    kTextTitleColor,
    Color(0xFF148ABC),
    Color(0xFF23A3C3),
  ],
);

const offersgradient = LinearGradient(
  begin: Alignment.bottomCenter,
  end: Alignment.topCenter,
  //stops: [0.1 ,0.3,0.5],
  colors: [
    Color(0xFF000000),
    Color(0xFF1D3A46),
    Color.fromARGB(0, 0, 0, 0),
  ],
);

const kHeaderGradientColor = LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  stops: [0.1 ,0.3,0.6],
  colors: [
    Color(0xFF23A3C3),
    Color(0xFF148ABC),
    Color(0xFF0473B7),
  ],
);
const kPrimaryColor = Color(0xFF148BBD);
const kPrimaryLightColor = Color(0xFF34C5DC);
const kPrimaryLightColor2 = Color(0xFFC2DCE0);
const kTextTitleColor = Color(0xFF0082C6);
const kbuttonColor = Color(0xFF0979B8);
const kbuttonColor2 = Color(0xFFFFA600);
const kTextColor = Color(0xFF677478);
const kTextColor2 = Color(0xFF68B9DC);
const kbuttonColor3 = Color(0xFFDEB86B);
const titletextsize = 50.0;

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(100),
  borderSide: BorderSide(color:kTextTitleColor),
  gapPadding: 5,
);

class CommonStyle{
  static InputDecoration textFieldStyle({String labelTextStr="",String hintTextStr="", Widget? w}) {
    return InputDecoration(
     // fillColor: state?Colors.grey.withOpacity(0.2):Colors.transparent,
     // filled: true,
      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      labelText: labelTextStr,
      labelStyle: TextStyle(color: kTextColor.withOpacity(0.5)),
      hintText:hintTextStr,
      hintStyle: TextStyle(color: kTextColor.withOpacity(0.5)),
      suffixIcon: w,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      border: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
    );}
}