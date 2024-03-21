import 'package:dr_ramy/components/month.dart';
import 'package:dr_ramy/models/articles.dart';
import 'package:dr_ramy/modules/follow/follow_up_screen.dart';

import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';
class HomeMonth extends StatefulWidget {
  static Articles? months;
  const HomeMonth({Key? key}) : super(key: key);

  @override
  State<HomeMonth> createState() => _HomeMonthState();
}

class _HomeMonthState extends State<HomeMonth> {

 // int? day;
  void initState() {
    // SharedPreferences.getInstance().then((prefs) {
    //   setState(() {
    //     day=prefs.getInt('days_number');
    //   });
    //   ArticlesApi().getCategory(18,day!).then((value){
    //     setState(() {
    //       months=value;
    //     });
    //     // print("the message is --${diet!.message}");
    //   });
    //   months==null?
    // :null;
    //
    // });

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
     // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        HomeMonth.months==null?
        Shimmer.fromColors(
            baseColor: Colors.grey[400]!,
            highlightColor: Colors.grey[100]!,
            enabled: true,
            child:Container(
              height: 200,
              width: SizeConfig.screenWidth-50,
              color: Colors.grey.withOpacity(0.6),
            )): SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ...List.generate(
                 // 3,
                  HomeMonth.months!.data.length>10?10: HomeMonth.months!.data.length,
                  //  snapshot.data.allProducts.length,
                      (index) {
                    // if (snapshot.data.allProducts[index].isOffer==1)
                    return
                      month(text1:HomeMonth.months!.data[index].title,img:HomeMonth.months!.data[index].image,context:context,id:HomeMonth.months!.data[index].id);
                    return SizedBox.shrink(); // here by default width and height is 0
                  },
                ),
                InkWell(
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (c)=>FollowUpScreen()));
                    } ,
                    child: Icon(Icons.arrow_forward_ios, size: 40,color: kTextTitleColor,))
                ,SizedBox(width: 20),
              ],
            ),
          ),
        ),

    //       Row(
    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //         children: [
    //           month(text1:'شهر',text2: 'العمليه',context:context),
    //           month(text1:'شهر',text2: 'اول',context:context),
    //           month(text1:'شهر',text2: 'ثاني',context:context),
    //           month(text1:'شهر',text2: 'ثالث',context:context),
    //
    //
    // ],
    //
    //
    // ),
      ],
    );
  }
}
