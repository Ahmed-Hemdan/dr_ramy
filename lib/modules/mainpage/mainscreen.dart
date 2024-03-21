import 'dart:io';

import 'package:dr_ramy/modules/follow/follow_up_screen.dart';
import 'package:dr_ramy/modules/home/home_screen.dart';
import 'package:dr_ramy/modules/offers/offers_screen.dart';
import 'package:dr_ramy/modules/settings/settings_screen.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:molten_navigationbar_flutter/molten_navigationbar_flutter.dart';

class MainBody extends StatefulWidget {
  const MainBody({Key? key}) : super(key: key);
  @override
  _MainBodyState createState() => _MainBodyState();
}
class _MainBodyState extends State<MainBody>with TickerProviderStateMixin {
  int selectedIndex = 0;
  bool selected=false;

  Widget _page = HomeScreen();

 GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  List<Widget> listWidgets = [HomeScreen(),FollowUpScreen(),OfferScreen(),SettingScreen()];

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return WillPopScope(
      onWillPop: ()async{
        if(selectedIndex == 0)
          showExitPopup(context);
        if(mounted){
          setState(() {
            selectedIndex = 0;
          });
        }
        return false;
      },

      child: Scaffold(
        body:listWidgets[selectedIndex],
        bottomNavigationBar:
        MoltenBottomNavigationBar(
      barHeight: 60,
          barColor:kbuttonColor,
    //  domeCircleColor:kbuttonColor2.withOpacity(0.2),

        //  domeCircleColor:kbuttonColor3,

       domeHeight: 0,
        //domeWidth: 180,
         //margin: EdgeInsets.only(bottom: 10),

        domeCircleSize: 55,
        borderRaduis: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
          //borderColor: selected?Colors.white:kbuttonColor,
          selectedIndex: selectedIndex,
          onTabChange: (clickedIndex) {
            switch(clickedIndex){
              case 3:
                setState(() {
                  selected=false;
                  //navigatorKey.currentState!.maybePop();
                  _page = listWidgets[clickedIndex];
                  selectedIndex = clickedIndex;
                });
                break;
              case 0:
              case 1:
              case 2:
                setState(() {
                  selected=true;
                  //navigatorKey.currentState!.maybePop();
                  _page = listWidgets[clickedIndex];
                  selectedIndex = clickedIndex;
                });
            }
          },
          tabs: [
            MoltenTab(
              unselectedColor: Colors.white,
              selectedColor: kbuttonColor2,
              icon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home,size: 25,),
                  Text('الرئيسية',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 13),)
                ],
              ),
            ),
            MoltenTab(
              unselectedColor: Colors.white,
              selectedColor: kbuttonColor2,
              icon:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.calendar_today_outlined,size: 25,),
                  Text('المتابعة',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            MoltenTab(
              unselectedColor: Colors.white,
              selectedColor: kbuttonColor2,
              icon:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.local_offer,size: 25,),
                  Text('العروض',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            MoltenTab(
              unselectedColor: Colors.white,
              selectedColor: kbuttonColor2,
              icon:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.settings,size: 25,),
                  Text('الإعدادات',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }

  // void onItemTapped(int index) {
  //   setState(() {
  //     navigatorKey.currentState!.maybePop();
  //     _page = listWidgets[index];
  //     selectedIndex = index;
  //   });
  //
  // }

}


Future<bool> showExitPopup(context) async{
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("هل تريد الخروج ؟"),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          exit(0);
                        },
                        child: Text("نعم", style: TextStyle(color: Colors.black)),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("لا", style: TextStyle(color: Colors.white)),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red.shade800,
                          ),
                        ))
                  ],
                )
              ],
            ),
          ),
        );
      });
}