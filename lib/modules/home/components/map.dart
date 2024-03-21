import 'package:dr_ramy/components/btn_widget3.dart';
import 'package:dr_ramy/models/contact.dart';
import 'package:dr_ramy/modules/contact_us/contact_us.dart';
import 'package:dr_ramy/services/const.dart';
import 'package:dr_ramy/services/contact_about.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:flutter/material.dart';

class mapimage extends StatefulWidget {
  const mapimage({Key? key}) : super(key: key);

  @override
  _mapimageState createState() => _mapimageState();
}

class _mapimageState extends State<mapimage> {
  Contact? contactdata;
  double? long;
  double? lat;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contactandabout().getcontact().then((value) {
      setState(() {
        contactdata=value;
        long=value.data!.longitude;
        lat=value.data!.latitude;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
                lanchMaps(long:long,lat: lat);
            },
            child:
            Container(
              decoration: BoxDecoration(border: Border.all(
                  color: kPrimaryLightColor),
                  borderRadius: BorderRadius.all(Radius
                      .circular(5.0))),
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius
                      .circular(5.0)),
                  child: Image.asset('assets/map.png',
                    fit: BoxFit.fill,)),
            ),
          ),
        ),
        contactdata==null?Container():Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ButtonWidget3(
                btnText: "تواصل مع الادارة",
                onClick: () {
                  Navigator.push(context, MaterialPageRoute(builder: (c)=>ContactUs()));
                },
              ),
            ),
            // Text(
            //     'معلومات الاتصال',
            //     style: TextStyle(color: Colors.black54,
          //   //         fontWeight: FontWeight.bold)),
          // SizedBox(width: 10,),
          //   Text(
          //       contactdata!.data!.phone!,
          //       style: TextStyle(color: Colors.black54,
          //           fontWeight: FontWeight.bold)),

          ],)
      ],
    );
  }
}
