import 'package:dr_ramy/components/drawer.dart';

import 'package:dr_ramy/models/gallery.dart';
import 'package:dr_ramy/services/contact_about.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  GalleryModel? photos;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    contactandabout().getphotos().then((value) {
      setState(() {
        photos = value;
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
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            actions: [
              Image.asset(
                'assets/icon2.png',
                height: 50,
                width: 50,
              ),
            ]),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: photos == null
              ? SizedBox()
              : GridView.count(
                  crossAxisCount: 1,
                  // mainAxisSpacing: 9,
                  crossAxisSpacing: 0.2,
                  childAspectRatio: 2.5,
                  children: List.generate(photos!.data!.length, (index) {
                    //      widget.title=snapshot.data.allProducts[index].data.title;

                    return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: InkWell(
                            onTap: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (c)=>DoctorDetails(id: doctors!.data![index].id,)));
                            },
                            child: Center(
                              child: photo(photos!.data![index].imagePath!),
                            )
                            // team_member('دكتورة هاجر','اخصائيه تغذيه')
                            ));
                  }).toList()),
        )));
  }
}

photo(String img) {
  return Padding(
    padding: EdgeInsets.only(
        left: getProportionateScreenWidth(10),
        right: getProportionateScreenWidth(10)),
    child: SizedBox(
      // width: getProportionateScreenWidth(SizeConfig.screenWidth-20),
      // height: getProportionateScreenWidth(140),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  // height: 100,
                width: SizeConfig.screenWidth-50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        img,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF343434).withOpacity(0.4),
                    Color(0xFF343434).withOpacity(0.15),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),

    // Column(
    //   // crossAxisAlignment: CrossAxisAlignment.start,
    //   children: [
    //
    //     Container(
    //       decoration: BoxDecoration(border: Border.all(color: kPrimaryLightColor),
    //           borderRadius:BorderRadius.all(Radius.circular(5.0))),
    //       margin: EdgeInsets.all(5.0),
    //       child: ClipRRect(
    //           borderRadius: BorderRadius.all(Radius.circular(5.0)),
    //           child: Image.network(img,fit: BoxFit.cover,width: SizeConfig.screenWidth-20,)),
    //     ),
    //     // Image.asset('assets/1.jpg',height: 110,width: 150,fit: BoxFit.fill,),
    //   ],
    // ),
  );
}
