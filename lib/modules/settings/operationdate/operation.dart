import 'package:dr_ramy/components/drawer.dart';
import 'package:dr_ramy/components/loading.dart';
import 'package:dr_ramy/models/articles.dart';
import 'package:dr_ramy/models/profile_info.dart';

import 'package:dr_ramy/services/articles_api.dart';
import 'package:dr_ramy/services/auth.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:flutter/material.dart';


class Operation extends StatefulWidget {
  const Operation({Key? key}) : super(key: key);

  @override
  State<Operation> createState() => _OperationState();
}

class _OperationState extends State<Operation> {
  UserData? info;
  String? name,img,day,date;
  Articles? day_article;
  @override
  void initState() {

    Auth().GetProfile().then((value) {
      setState(() {
        info=value;
        name=value.data.name;
        date=value.data.operationDate;

        img=value.data.imagePath;
        day=value.data.daysNumber.toString();
        ArticlesApi().getCategory(12,value.data.daysNumber).then((value){
          setState(() {
            day_article=value;
          });
        });
      });
    });
    //TODO: implement initState
    super.initState();
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
            "تاريخ العملية",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [ Image.asset('assets/icon2.png',height: 50,width: 50,),]
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
        //  height: 200,
          child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    flex: 1,
                    child: img==null?Container():imagedrawer(img: img,name: name,)),
                SizedBox(width: 10,),
                Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(child: name==null?Container(): Info(date: date,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom:20,top: 10),
                          child:
                          //day_article==null?
                          day==null?
                          buildCustomColorSizePlaceholder():Row(
                            children: [
                              Expanded(child:
                              Text(
                                  'اهلا بك, أنت الأن في اليوم ال $day  من تاريخ العملية نتمنى لك رحلة سعيدة وعملية ناجحة'
                              )),
                            ],
                          )
                          //       :
                          // // buildCustomColorSizePlaceholder():
                          // Column(
                          //
                          //   children: [
                          //     Row(
                          //       children: [
                          //         Expanded(child:
                          //         Text(
                          //             '${parse(day_article!.data[0].brief).body!.text}'
                          //           // 'تعتبر عملية  الحل الأمثل لمن عانوا كثيراً من الفشل فى النزول فى الوزن بالدايت أو الرياضة .فهذه ليست النهاية لهم'
                          //         )),
                          //       ],
                          //     ),
                          //     InkWell(
                          //       onTap: (){
                          //         Navigator.push(context, MaterialPageRoute(builder: (c)=>SpecificArticle(article_id: day_article!.data[0].id,)));
                          //
                          //       },
                          //       child: Row(
                          //         children: [
                          //           Text(
                          //             'show your daily Article',style: TextStyle(
                          //               color: Colors.blue,
                          //               decoration: TextDecoration.underline
                          //           ),
                          //             // 'تعتبر عملية  الحل الأمثل لمن عانوا كثيراً من الفشل فى النزول فى الوزن بالدايت أو الرياضة .فهذه ليست النهاية لهم'
                          //           ),
                          //         ],
                          //       ),
                          //     )
                          //   ],
                          // ),
                        )
                      ],
                    )),
              ],
            ),
          ),
        ),
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
  String? date;
  Info({Key? key,required this.date}) : super(key: key);

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
                  child: Center(child: Text('تاريخ العملية '+date!,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
                )

              //ImageSlider(),
            ),
          ),
          // SizedBox(width: 20,),
          // Expanded(
          //   flex: 1,
          //   child: Container(
          //       height: 30,
          //       // height: getProportionateScreenHeight(100.0),
          //       decoration: BoxDecoration(
          //           borderRadius:
          //           BorderRadius.only(bottomRight: Radius.circular(10.0),bottomLeft: Radius.circular(10.0)
          //           ),
          //           color: kbuttonColor2),
          //       child:Center(child: Text(weight!,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)))
          //
          //     //ImageSlider(),
          //   ),
          // ),
          // SizedBox(width: 20,),
          // Expanded(
          //   flex: 1,
          //   child: Container(
          //       height: 30,
          //       // height: getProportionateScreenHeight(100.0),
          //       decoration: BoxDecoration(
          //
          //           borderRadius:
          //           BorderRadius.only(bottomRight: Radius.circular(10.0),bottomLeft: Radius.circular(10.0)
          //           ),
          //           color: kbuttonColor2),
          //       child:Center(child: Text(height!,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)))
          //
          //     //ImageSlider(),
          //   ),
          // ),
        ],
      ),
    );
  }
}