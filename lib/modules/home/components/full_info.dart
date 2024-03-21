import 'dart:async';

import 'package:dr_ramy/models/articles.dart';
import 'package:dr_ramy/models/profile_info.dart';

import 'package:dr_ramy/style/colors.dart';
import 'package:flutter/material.dart';

import 'package:dr_ramy/components/loading.dart';

class FullInfo extends StatefulWidget {
 static UserData? info;
 static Articles? day_article;
  const FullInfo({Key? key}) : super(key: key);

  @override
  State<FullInfo> createState() => _FullInfoState();
}

class _FullInfoState extends State<FullInfo> {

  @override
  void initState() {
    Timer(Duration(milliseconds: 200), () {
     // FullInfo.info==null?Navigator.push(context, MaterialPageRoute(builder: (c)=>))
    });

    //TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FullInfo.info==null?Container():
    Container(
      child: Row(
        children: [
          Expanded(
            flex: 1,
              child: FullInfo.info!.data.imagePath==null?Container():imagedrawer(img: FullInfo.info!.data.imagePath,name:FullInfo.info!.data.name)),
          SizedBox(width: 10,),
          Expanded(
            flex: 3,
              child: Column(
                children: [
                  Center(child: FullInfo.info!.data.name==null?Container(): Info(height: FullInfo.info!.data.height,weight:FullInfo.info!.data.weight,day: FullInfo.info!.data.daysNumber.toString()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:20,top: 10),
                    child:
                    FullInfo.info!.data.daysNumber==null?
                    buildCustomColorSizePlaceholder():Row(
                      children: [
                        Expanded(child:
                        Text(
                            'اهلا بك, أنت الأن في اليوم ال ${FullInfo.info!.data.daysNumber} نتمنى لك رحلة سعيدة وعملية ناجحة'
                        )),
                      ],
                    )
                   // buildCustomColorSizePlaceholder():
                   //  Column(
                   //
                   //    children: [
                   //      Row(
                   //        children: [
                   //          Expanded(child:
                   //          Text(
                   //              '${parse(FullInfo.day_article!.data[0].brief).body!.text}'
                   //              // 'تعتبر عملية  الحل الأمثل لمن عانوا كثيراً من الفشل فى النزول فى الوزن بالدايت أو الرياضة .فهذه ليست النهاية لهم'
                   //          )),
                   //        ],
                   //      ),
                   //      InkWell(
                   //        onTap: (){
                   //          Navigator.push(context, MaterialPageRoute(builder: (c)=>SpecificArticle(article_id: FullInfo.day_article!.data[0].id,)));
                   //        },
                   //        child: Row(
                   //          children: [
                   //            Text(
                   //               'show your daily Article',style: TextStyle(
                   //              color: Colors.blue,
                   //                decoration: TextDecoration.underline
                   //            ),
                   //                 // 'تعتبر عملية  الحل الأمثل لمن عانوا كثيراً من الفشل فى النزول فى الوزن بالدايت أو الرياضة .فهذه ليست النهاية لهم'
                   //            ),
                   //          ],
                   //        ),
                   //      )
                   //    ],
                   //  ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
class imagedrawer extends StatelessWidget {
  String? name,img;
   imagedrawer({Key? key,required this.img,required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 120,
      decoration: BoxDecoration(
         // color:kTextColor2,
          border: Border.all(color: kbuttonColor),
          borderRadius: BorderRadius.all(Radius.circular(10))),

      child: Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(flex:2,child:
                //img==null?
                Image.asset('assets/user.png',fit: BoxFit.contain,height: 100,width: 100,)
                    //:Image.network(img!,fit: BoxFit.fill,)
        ),
           // SizedBox(height: 10,),
            //Image.network(img!,fit: BoxFit.fill,)

          Expanded(
            flex: 1,
            child: Container(
                //height: 45,
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(5.0),bottomLeft: Radius.circular(5.0)
                    ),
                    color: kbuttonColor),
                child:Center(child: Text(name!,style: TextStyle(color: Colors.white,fontWeight: FontWeight.w500)
                )
                ),
                //ImageSlider(),
              ),
          ),


          ],
        ),
      ),
    );
  }
}
class Info extends StatelessWidget {
  String? weight,height,day;
  Info({Key? key,required this.height,required this.weight,required this.day}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
                height: 30,
                // height: getProportionateScreenHeight(100.0),
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(10.0),bottomLeft: Radius.circular(10.0)
                    ),
                    color: kbuttonColor2),
                child:Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Center(child: Text('اليوم '+day!,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
                )

              //ImageSlider(),
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            flex: 1,
            child: Container(
                height: 30,
                // height: getProportionateScreenHeight(100.0),
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(10.0),bottomLeft: Radius.circular(10.0)
                    ),
                    color: kbuttonColor2),
                child:Center(child: Text(weight!,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)))

              //ImageSlider(),
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            flex: 1,
            child: Container(
                height: 30,
                // height: getProportionateScreenHeight(100.0),
                decoration: BoxDecoration(

                    borderRadius:
                    BorderRadius.only(bottomRight: Radius.circular(10.0),bottomLeft: Radius.circular(10.0)
                    ),
                    color: kbuttonColor2),
                child:Center(child: Text(height!,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)))

              //ImageSlider(),
            ),
          ),
        ],
      ),
    );
  }
}