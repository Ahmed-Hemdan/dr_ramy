
import 'package:dr_ramy/models/number.dart';
import 'package:dr_ramy/services/contact_about.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Nums extends StatefulWidget {
  const Nums({Key? key}) : super(key: key);

  @override
  State<Nums> createState() => _NumsState();
}

class _NumsState extends State<Nums> {
  Numbers? numbers;
  @override
  void initState() {
    contactandabout().getnumbers().then((value) {
      setState(() {
        numbers=value;
      });
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: ScrollPhysics(),
      child:
      numbers==null?Shimmer.fromColors(
          baseColor: Colors.grey[400]!,
          highlightColor: Colors.grey[100]!,
          enabled: true,
          child:Container(
            height: 200,
            width: SizeConfig.screenWidth-50,
            color: Colors.grey.withOpacity(0.6),
          )):Container(
            child: ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom:40.0),
        itemCount:numbers!.data.length>10?10:numbers!.data.length,
        itemBuilder: (BuildContext context, int index) {
            return Statictic(
              context: context,
              index:index,
              n: numbers!
            );

        },
      ),
          ),
    );
  }
}
Widget Statictic({required int index, required BuildContext context, required Numbers n}){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      elevation: 3,

      child: Container(
        decoration: BoxDecoration(color: index.isEven?Colors.grey.withOpacity(0.2):kTextTitleColor.withOpacity(0.2),

            borderRadius:BorderRadius.all(Radius.circular(5.0))),
        // height: 120,
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
          child: Row(
            children: [
              Expanded(flex:1,
                  child:
                  Icon(Icons.bookmark_outlined,size: 15,color: kbuttonColor2,)),
              Expanded(flex:2,child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text(n.data[index].title.toString(),style: TextStyle(fontWeight: FontWeight.bold)))
                    ],
                  ),
                  //  SizedBox(width: 30,),

                ],

              )),
              Expanded(flex:3,child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                   Text(n.data[index].value.toString(),style: TextStyle(fontWeight: FontWeight.bold))

                    // Text('20 \n massiagin \n states', style: TextStyle(fontSize: 10),),

                  ],

                ),
              )),
            ],
          ),
        ),
      ),
    ),
  );
}