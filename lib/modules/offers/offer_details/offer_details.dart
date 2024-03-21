import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:dr_ramy/components/btn_widget3.dart';
import 'package:dr_ramy/components/drawer.dart';
import 'package:dr_ramy/models/article_details.dart';
import 'package:dr_ramy/modules/mainpage/mainscreen.dart';
import 'package:dr_ramy/services/articles_api.dart';
import 'package:dr_ramy/services/const.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
class OfferDetails extends StatefulWidget {
 final int? id;
  const OfferDetails({Key? key, required this.id}) : super(key: key);

  @override
  State<OfferDetails> createState() => _OfferDetailsState();
}

class _OfferDetailsState extends State<OfferDetails> {
  ArticleDetails? offerdetails;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ArticlesApi().getArticleDetails(widget.id!).then((value) {
      setState(() {
        offerdetails=value;
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
            "العروض",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
            actions: [ Image.asset('assets/icon2.png',height: 50,width: 50,),]
        ),
        body: SafeArea(child: SingleChildScrollView(
          child: Column(
            children: [
              offerdetails==null?Center(child: CircularProgressIndicator()):Column(
              children: [
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: SizeConfig.screenWidth-30,
                   // height: 200,
                    decoration: BoxDecoration(border: Border.all(color: kPrimaryLightColor),
                        borderRadius:BorderRadius.all(Radius.circular(5.0))),
                    margin: EdgeInsets.all(5.0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        child: CachedNetworkImage(
                          fadeOutDuration: Duration(milliseconds: 500),
                          fadeInDuration:  Duration(milliseconds: 500),
                          //height: 190,
                          fit: BoxFit.fitWidth,
                          imageUrl: offerdetails!.data!.image!,
                          placeholder: (context, url) => Image.asset('assets/icon.png',width: 1000,),
                          errorWidget: (context, url, error) => Image.asset('assets/icon.png',width: 1000,),
                        ),
                        //Image.network(offerdetails!.data!.image!,fit: BoxFit.fill,)
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Container(
               // height: 250,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(child: Text('${parse(offerdetails!.data!.body!).body!.text}'
                        )),
                      ],
                    ),
                  ),
                ),
              ),


              SizedBox(height: 10,),

              ],
        ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonWidget3(
                        color: kbuttonColor2,
                        btnText: "طلب العرض",
                        onClick: () {

                            showDialog(context: context, builder: (context){
                              return
                                AlertDialog(

                                  title: Center(child: Row(
                                    children: [
                                      CircularProgressIndicator(),
                                      SizedBox(width: 10,),
                                      Text('جاري طلب العرض'),
                                    ],
                                  )),);
                            });
                            Timer(Duration(seconds: 3), () {
                              Navigator.of(context).pop();
                            });

                          ArticlesApi().RequestOffer(offerdetails!.data!.id!).then((value) {
                    //
// AlertDialog(title: Text('wait'),);
                            lanchWhatsapp(number: "01020301010");
                         //  showcooldialog(message: 'لقد حصلت على العرض بنجاح',context: context);

                           // Timer(Duration(minutes: 1), () {
                           //   Navigator.of(context).pop();
                           // });

                            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Row(
                            //   children: [
                            //     Icon(Icons.done_all,color: Colors.green,),
                            //     Text('congratulations you get the offer'),
                            //   ],
                            // )));
                          });
                       //  Navigator.push(context, MaterialPageRoute(builder: (c)=>MainBody()));
                        }
                    ),

                  ],
                ),
              )
            ],

          ),
        )));
  }
}
void showcooldialog({required String message,required BuildContext context}) {
  CoolAlert.show(
    showCancelBtn: false,
    context: context,
    type: CoolAlertType.success,
    text:message,
    confirmBtnText: 'الصفحة الرئيسية',
    confirmBtnColor: kbuttonColor2,
    onConfirmBtnTap: (){
      Navigator.pop(context);
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>MainBody()));
    },
    // cancelBtnText: 'Mobile Data',
    // onCancelBtnTap: (){
    //   // Navigator.pop(context);
    //   //  Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>CartScreen2()));
    //
    // },
    //confirmBtnColor: Colors.green,

  );
}