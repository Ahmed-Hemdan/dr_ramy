

import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';
import 'register_form.dart';

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
               // SizedBox(height: SizeConfig.screenHeight * 0.08),
               Image.asset('assets/icon.png',height: 120,width: 150,),
                SizedBox(height: SizeConfig.screenHeight * 0.02),
                RegisterForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Container(

                  // child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     SocalCard(
                  //       icon: "assets/icons/google-icon.svg",
                  //       press: () {},
                  //     ),
                  //     SocalCard(
                  //       icon: "assets/icons/facebook-2.svg",
                  //       press: () {},
                  //     ),
                  //     SocalCard(
                  //       icon: "assets/icons/twitter.svg",
                  //       press: () {},
                  //     ),
                  //   ],
                  // ),
                ),
                //SizedBox(height: getProportionateScreenHeight(20)),
                // NoAccountText(text: "تسجيل الدخول؟",onClick: (){
                //   Navigator.push(context, MaterialPageRoute(builder: (c)=>LogInScreen()));
                // }),



              ],
            ),
          ),
        ),
      ),
    );
  }
}
