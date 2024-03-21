

import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';
import 'info_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20),vertical: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Image.asset('assets/icon.png',height: 120,width: 150,),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                UpdateForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Container(


                ),
                //SizedBox(height: getProportionat


              ],
            ),
          ),
        ),
      ),
    );
  }
}
