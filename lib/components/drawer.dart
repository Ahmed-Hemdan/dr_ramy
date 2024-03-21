import 'package:dr_ramy/components/profileimg.dart';
import 'package:dr_ramy/components/profileimg2.dart';
import 'package:dr_ramy/models/articles.dart';
import 'package:dr_ramy/models/profile_info.dart';
import 'package:dr_ramy/modules/about_us/about_us_screen.dart';
import 'package:dr_ramy/modules/all_articles/all_articles_screen.dart';
import 'package:dr_ramy/modules/contact_us/contact_us.dart';
import 'package:dr_ramy/modules/follow/follow_up_screen.dart';
import 'package:dr_ramy/modules/home/components/public_info.dart';
import 'package:dr_ramy/modules/home/components/diet_articles.dart';
import 'package:dr_ramy/modules/home/components/dr_ramy_articles.dart';
import 'package:dr_ramy/modules/home/components/food_advice.dart';
import 'package:dr_ramy/modules/home/components/side_effects_articles.dart';
import 'package:dr_ramy/modules/login/loginscreen.dart';
import 'package:dr_ramy/modules/mainpage/mainscreen.dart';
import 'package:dr_ramy/modules/offers/offers_screen.dart';
import 'package:dr_ramy/modules/settings/settings_screen.dart';
import 'package:dr_ramy/services/articles_api.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/auth.dart';

class drawer extends StatefulWidget {
  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {
  // Articles? all_articles;
  UserData? userData;
  @override
  void initState() {
    Auth().GetProfile().then((value) {
      setState(() {
        userData=value;
      });
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kbuttonColor,
      child: ListView(
        children: [
          profile2(),
          ListTile(
              leading: Icon(Icons.home,color: kbuttonColor2,),
              title: Text('الرئيسية',style: TextStyle(color: Colors.white),),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>MainBody()));

                // Navigator.pushReplacementNamed(context, MainBody.routeName);
                // Navigator.of(context).pushNamedAndRemoveUntil(MainPage.routeName, (route) => false);
              }),
          ListTile(
              leading: Icon(Icons.person_search,color: kbuttonColor2,),
              title:Text('من نحن ',style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (c)=>Aboutus()));

                // Navigator.of(context).pushNamedAndRemoveUntil(CategoriesScreen.routeName, ModalRoute.withName(MainPage.routeName));
//Navigator.of(context).pushReplacementNamed(CategoriesScreen.routeName);
              }),
          ListTile(
              leading: Icon(Icons.call,color: kbuttonColor2,),
              title: Text('اتصل بنا ',style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (c)=>ContactUs()));

                // Navigator.of(context).pushNamedAndRemoveUntil(OfferScreen.routeName, ModalRoute.withName(MainPage.routeName));
                //Navigator.of(context).pushReplacementNamed(OfferScreen.routeName);
              }),

          ListTile(
              leading: Icon(Icons.calendar_today_outlined,color: kbuttonColor2,),

              title:Text('شهرك الحالي',style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (c)=>FollowUpScreen()));

                // Navigator.of(context).pushNamedAndRemoveUntil(CourseScreen.routeName, ModalRoute.withName(MainPage.routeName));

                // Navigator.of(context).pushReplacementNamed(CourseScreen.routeName);
              }),

          ListTile(
              leading: Icon(Icons.article,color: kbuttonColor2,),

              title:Text('مقالات د/رامي',style: TextStyle(color: Colors.white)),
              onTap: () {


                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (c)=>AllArticles(all_articles: DrRamyArticles.all_articles,)));
              }),

          ListTile(
              leading: Icon(Icons.article,color: kbuttonColor2,),

              title:Text('الأعراض الجانبية',style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (c)=>AllArticles(all_articles: SideEffectsArticles.side_articles,)));

                // Navigator.of(context).pushNamedAndRemoveUntil(CourseScreen.routeName, ModalRoute.withName(MainPage.routeName));

                // Navigator.of(context).pushReplacementNamed(CourseScreen.routeName);
              }),

          ListTile(
              leading: Icon(Icons.article,color: kbuttonColor2,),

              title:Text('نصائح غذائيه',style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (c)=>AllArticles(all_articles: FoodAdvice.advices,)));

                // Navigator.of(context).pushNamedAndRemoveUntil(CourseScreen.routeName, ModalRoute.withName(MainPage.routeName));

                // Navigator.of(context).pushReplacementNamed(CourseScreen.routeName);
              }),

          ListTile(
              leading: Icon(Icons.article,color: kbuttonColor2,),

              title:Text('أنظمة الدايت',style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (c)=>AllArticles(all_articles:DietAdvice.diet)));

                // Navigator.of(context).pushNamedAndRemoveUntil(CourseScreen.routeName, ModalRoute.withName(MainPage.routeName));

                // Navigator.of(context).pushReplacementNamed(CourseScreen.routeName);
              }),

          ListTile(
              leading: Icon(Icons.article,color: kbuttonColor2,),
              title:Text('معلومات عامة',style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (c)=>AllArticles(all_articles:  PublicInfo.public_info)));

                // Navigator.of(context).pushNamedAndRemoveUntil(CourseScreen.routeName, ModalRoute.withName(MainPage.routeName));

                // Navigator.of(context).pushReplacementNamed(CourseScreen.routeName);
              }),
          ListTile(
              leading: Icon(Icons.local_offer,color: kbuttonColor2,),
              title: Text('العروض',style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (c)=>OfferScreen()));

                //   Navigator.of(context).pushNamedAndRemoveUntil(MemberSerialScreen.routeName, ModalRoute.withName(MainPage.routeName));
              }),
          ListTile(
              leading: Icon(Icons.settings,color: kbuttonColor2,),
              title: Text('الاعدادات',style: TextStyle(color: Colors.white)),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (c)=>SettingScreen()));

              }),

          ListTile(
              leading: Icon(
                Icons.logout
                ,color: kbuttonColor2,
              ),
              title: Text('تسجيل الخروج',style: TextStyle(color: Colors.white)),
              onTap: () {
                userData==null?
                Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (c)=>LoginScreen()),(Route<dynamic> route) => false)
                :SharedPreferences.getInstance().then((pref) {
                  Auth().deleteDeviceToken(pref.getInt('user_id')!).then((value) {

                    if(value==true){
                      // Auth().Logout();
                      pref.clear();
                      print('logout device token'+pref.getString('fcm_device_token').toString());

                      Navigator.pop(context);
                      Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (c)=>LoginScreen()),(Route<dynamic> route) => false);
                    }
                    else{
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('some thing went wrong please try to logout again')));
                    }

                  });

                });

              }
          )



        ],
      ),
    );

  }
}