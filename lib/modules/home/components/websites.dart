import 'package:dr_ramy/components/btn_widget3.dart';
import 'package:dr_ramy/models/web.dart';
import 'package:dr_ramy/services/const.dart';

import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
class Websites extends StatefulWidget {
  static Web? web;
  const Websites({Key? key}) : super(key: key);

  @override
  State<Websites> createState() => _WebsitesState();
}

class _WebsitesState extends State<Websites> {

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child:  Websites.web==null?Shimmer.fromColors(
          baseColor: Colors.grey[400]!,
          highlightColor: Colors.grey[100]!,
          enabled: true,
          child:Container(
            height: 200,
            width: SizeConfig.screenWidth-50,
            color: Colors.grey.withOpacity(0.6),
          )):Container(
         // height: 200,
          child:
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.only(bottom:40.0),
            itemCount:Websites.web!.data.length>10?10:Websites.web!.data.length,

            itemBuilder: (BuildContext context, int index) {
              return webitem(
                web: Websites.web!,
                context: context,
                index:index,
              );

            },
          )),
    );
  }
}
Widget webitem({required Web web,required int index, required BuildContext context}){
  return Card(
    elevation: 3,
    child: Container(
     // height: 120,
      color: index.isEven?Colors.grey.withOpacity(0.2):Theme.of(context).scaffoldBackgroundColor,
      child:Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(flex:1,child: Row(children: [
              Expanded(child:
        Container(
        child: CircleAvatar(
       backgroundColor: Colors.white,
          //backgroundImage:
          //Image.network(web.data[index].image,),
          radius: 30.0,
          child: ClipRRect(
            child: Image.network(web.data[index].image,height: 50,width: 50,),
          //   //Text('A', style: TextStyle(color: kbuttonColor2,fontWeight: FontWeight.bold),),
           borderRadius: BorderRadius.circular(30.0),
          // ),
        ))
        )
              ),
              SizedBox(width: 5,),
             // Expanded(flex:3,child: Text(' دكتور رامي حلمي لجراحة المناظير - Dr ramy helmy message replies ',style: TextStyle(color: kbuttonColor),))
            ],
            )),
            Expanded(flex:3,child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(web.data[index].title, style: TextStyle(color: kbuttonColor,fontWeight: FontWeight.bold),),
                  ],
                ),
              ],

            )),
            Expanded(flex:2,child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    child: ButtonWidget3(btnText: 'احصل عليه',onClick: (){
                      lanchYoutube(url:web.data[index].url);
                    },),
                height: 30,
                   width:90
                )

               // Text('20 \n massiagin \n states', style: TextStyle(fontSize: 10),),

              ],

            )),
          ],
        ),
      ),
    ),
  );
}