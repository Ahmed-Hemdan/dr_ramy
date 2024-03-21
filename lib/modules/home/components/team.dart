import 'package:dr_ramy/models/doctors.dart';
import 'package:dr_ramy/components/team_member.dart';
import 'package:dr_ramy/modules/all_team/doctor_details/doctor_details.dart';
import 'package:flutter/material.dart';
class Team extends StatefulWidget {
  static Doctors? homedoctors;
  const Team({Key? key}) : super(key: key);

  @override
  _TeamState createState() => _TeamState();
}

class _TeamState extends State<Team> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Team.homedoctors==null?SizedBox():SingleChildScrollView(
    scrollDirection: Axis.horizontal,
    child:
    Row(
       //   mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(
            10,
              (index) {
            return InkWell(
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                  team_member(Team.homedoctors!.data![index].name, Team.homedoctors!.data![index].jobTitle, Team.homedoctors!.data![index].image),
                ],),
              ),

              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (c)=>DoctorDetails(id:Team.homedoctors!.data![index].id)));

              },
            );
            return SizedBox
                .shrink(); // here by default width and height is 0
          },
        ),
        //SizedBox(width: 70),
      ],
    ),
    );
  }


}
