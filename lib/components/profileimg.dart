import 'package:dr_ramy/style/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'no_account_text.dart';
class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  String? name;
  //String? img;
  @override
  void initState() {
    SharedPreferences.getInstance().then((prefs) {
      setState(() {
        name=prefs.getString('user_name');
        //img=prefs.getString('user_image');
      });
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return   Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  child: CircleAvatar(

                    backgroundColor: kPrimaryColor.withOpacity(0.3),
                    radius: 60.0,
                    child: ClipRRect(
                      child: Image.asset('assets/user.png',fit: BoxFit.contain,height: 100,width: 100,),
                      //Image.network(img!),
                      borderRadius: BorderRadius.circular(60.0),
                    ),
                    //  radius: 10.0,
                    // backgroundImage: AssetImage('assets/doc1.jpg'),
                  )),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              SizedBox(height: 15.0),
              NoAccountText(
                size: 20,
                text: name==null?" ":name!,
                col: kTextTitleColor,
              ),

              // Icon(Icons.add),
              // Container(
              //     child: CircleAvatar(child: Image.asset('assets/doc1.jpg'))),
            ],
          ),
        ),
        SizedBox(height: 30.0),
      ],
    );
  }
}

