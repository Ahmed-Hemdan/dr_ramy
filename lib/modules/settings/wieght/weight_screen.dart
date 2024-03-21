import 'package:dr_ramy/components/drawer.dart';
import 'package:dr_ramy/components/no_account_text.dart';
import 'package:dr_ramy/components/profileimg.dart';
import 'package:dr_ramy/models/user_weight.dart';
import 'package:dr_ramy/services/weight.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({Key? key}) : super(key: key);

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {

  String? w;
  UserWeight? userWeight;
  String? formattedDate;

  @override
  void initState() {
    Weight().GetWeights().then((value) {
      setState(() {
        userWeight=value;
      });
    });
    // TODO: implement initState
    super.initState();
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    setState(() {
      formattedDate=formatter.format(now);
    });

    print(formattedDate);
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
            'وزنك اليوم',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
            actions: [ Image.asset('assets/icon2.png',height: 50,width: 50,),]
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
          children: [
            profile(),
            SizedBox(height: 30.0),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: kButtonGradientColor2,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'وزنك اليوم',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),

                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: kPrimaryColor),
                        // color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          bottomLeft: Radius.circular(100),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              w=value;
                            });
                          },
                          decoration: InputDecoration.collapsed(hintText: "إدخل وزنك اليوم بالكيلو جرام"),),
                      ),
                    ),
                  ),
                  //  Text(' 100022022 20+',style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  gradient: kButtonGradientColor2,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: InkWell(
                  onTap: (){
                    Weight().SaveWeight(int.parse(w!),formattedDate!);
                    Weight().GetWeights().then((value) {
                      setState(() {
                        userWeight=value;
                      });
                    });
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'اضافة الوزن',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color(0xFF00B2C4),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(100),
                          bottomRight: Radius.circular(100),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'التاريخ',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),

                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        //  border: Border.all(color:kPrimaryColor ),
                        color: Color(0xFF00B2C4),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(100),
                          bottomLeft: Radius.circular(100),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            ' الوزن',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                  //  Text(' 100022022 20+',style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            userWeight==null?Center(child: Text('أضف وزنك اليوم'),):ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: userWeight!.data!.length,
                //userWeight!.data!.length,
                itemBuilder: (context, index)
                {
                return person_wieght(userWeight!.data![index].weightDate!, userWeight!.data![index].weight!);
              }),
          ],
        ))));
  }
}

Widget person_wieght(String date, String w) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            height: 30,
            decoration: BoxDecoration(
              color: kPrimaryLightColor2.withOpacity(0.8),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(100),
                bottomRight: Radius.circular(100),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(date
           , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
          ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 4,
        ),

        Expanded(
          flex: 1,
          child: Container(
            height: 30,
            decoration: BoxDecoration(
//  border: Border.all(color:kPrimaryColor ),
              color: kPrimaryLightColor2.withOpacity(0.8),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
                bottomLeft: Radius.circular(100),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(w,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),
                ),
              ],
            ),
          ),
        ),
//  Text(' 100022022 20+',style: TextStyle(fontWeight: FontWeight.bold),)
      ],
    ),
  );
}
