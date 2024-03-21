
import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'login_form.dart';
class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  void initState() {

    SharedPreferences.getInstance().then((value) {
      print('login device token'+value.getString('fcm_device_token').toString());
      value.getString('fcm_device_token');
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20),vertical: getProportionateScreenWidth(10)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                //SizedBox(height: SizeConfig.screenHeight * 0.05),
                  Image.asset('assets/icon.png',height: 150,width: 150,),
                 // SizedBox(height: SizeConfig.screenHeight * 0.02),
                  Text(
                    "مرحبا",
                    style: TextStyle(color: kTextTitleColor,fontSize: getProportionateScreenWidth(titletextsize)),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: SizeConfig.screenHeight * 0.03),
                  LoginForm(),
                 // SizedBox(height: SizeConfig.screenHeight * 0.04),

                  //SizedBox(height: getProportionateScreenHeight(20)),
                  // NoAccountText(text:"SKIP",onClick:(){
                  //  // Navigator.push(context, MaterialPageRoute(builder: (c)=>RegisterScreen()));
                  //
                  // }),
                  // SizedBox(height: SizeConfig.screenHeight * 0.03),
                  //       Center(child:  Text(
                  //         "الدخول باستخدام",
                  //         style: TextStyle(color:kTextColor),
                  //       ),
                  // ),
                        // Container(
                        //
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children: [
                        //       IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.facebook,color: Colors.blue,)),
                        //       IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.instagram)),
                        //       IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.google,color: Colors.red,)),
                        //
                        //     ],
                        //   ),
                        // ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
