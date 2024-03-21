import 'package:dr_ramy/components/drawer.dart';
import 'package:dr_ramy/models/doctors.dart';
import 'package:dr_ramy/components/team_member.dart';
import 'package:dr_ramy/services/doctors_api.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import 'doctor_details/doctor_details.dart';
class AllTeam extends StatefulWidget {
  const AllTeam({Key? key}) : super(key: key);

  @override
  _AllTeamState createState() => _AllTeamState();
}

class _AllTeamState extends State<AllTeam> {

  Doctors? doctors;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    doctors_api().getAllDoctors().then((value) {
      setState(() {
       doctors=value;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: drawer(),
        ),
        // backgroundColor: kTextTitleColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kTextTitleColor,
          title: Text(
            "فريق العمل",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
            actions: [ Image.asset('assets/icon2.png',height: 50,width: 50,),]
        ),
        body: SafeArea(child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: doctors==null?Shimmer.fromColors(
              baseColor: Colors.grey[400]!,
              highlightColor: Colors.grey[100]!,
              enabled: true,
              child:Container(
                height: 200,
                width: SizeConfig.screenWidth-50,
                color: Colors.grey.withOpacity(0.6),
              )):
          GridView.count(
              crossAxisCount: 2,
             // mainAxisSpacing: 2,
             // crossAxisSpacing: 2,
              childAspectRatio:1/1.5,
              children: List.generate(doctors!.data!.length, (index) {
                //      widget.title=snapshot.data.allProducts[index].data.title;

                return Padding(
                    padding: const EdgeInsets.all(5.0),

                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (c)=>DoctorDetails(id: doctors!.data![index].id,)));
                            },
                            child: team_member(doctors!.data![index].name, doctors!.data![index].jobTitle, doctors!.data![index].image)
                           // team_member('دكتورة هاجر','اخصائيه تغذيه')
                        ),
                      ],
                    )

                );
              }).toList()),
        )));
  }
}
//
// team_member(String s, String t ,String img) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 10),
//     child:   Column(
//       // crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//
//         Expanded(
//           flex: 3,
//           child: Container(
//             decoration: BoxDecoration(border: Border.all(color: kPrimaryLightColor),
//                 borderRadius:BorderRadius.all(Radius.circular(5.0))),
//             margin: EdgeInsets.all(5.0),
//             child: ClipRRect(
//                 borderRadius: BorderRadius.all(Radius.circular(5.0)),
//                 child: Image.asset(img,fit: BoxFit.cover, height: 150,width: 120)),
//           ),
//         ),
//         // Image.asset('assets/1.jpg',height: 110,width: 150,fit: BoxFit.fill,),
//
//
//         Expanded(
//           flex: 1,
//           child: Wrap(
//               direction: Axis.horizontal,
//               spacing: -5, // to apply margin in the main axis of the wrap
//               // runSpacing: 2, // to apply margin in the cross axis of the wrap
//               children: <Widget>[
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(s),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(t),
//                   ],
//                 )
//               ]
//           ),
//         )
//
//
//
//       ],
//     ),
//   );
// }
