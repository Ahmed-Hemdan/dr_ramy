
import 'package:dr_ramy/components/drawer.dart';
import 'package:dr_ramy/components/searchresult.dart';
import 'package:dr_ramy/components/title.dart';
import 'package:dr_ramy/models/doctor_image.dart';
import 'package:dr_ramy/modules/all_team/all_team_screen.dart';
import 'package:dr_ramy/modules/all_team/doctor_details/doctor_details.dart';

import 'package:dr_ramy/modules/home/components/full_info.dart';
import 'package:dr_ramy/modules/offers/offers_screen.dart';
import 'package:dr_ramy/modules/settings/notice/all_videos.dart';
import 'package:dr_ramy/services/articles_api.dart';
import 'package:dr_ramy/services/auth.dart';
import 'package:dr_ramy/services/doctors_api.dart';
import 'package:dr_ramy/services/videos_api.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';

import 'components/diet_articles.dart';
import 'components/dr_ramy_articles.dart';
import 'components/food_advice.dart';
import 'components/freeoffer.dart';
import 'components/map.dart';
import 'components/nums.dart';
import 'components/side_effects_articles.dart';
import 'components/homemonth.dart';
import 'components/slider.dart';
import 'components/team.dart';
import 'components/public_info.dart';
import 'components/videos.dart';
import 'components/websites.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DoctorImage? doctorImage;
  int? day;

  getAllHomeData(){


    setState(() {
      FoodAdvice.advices=null;
      PublicInfo.public_info=null;
      DrRamyArticles.all_articles=null;
      DietAdvice.diet=null;
      doctorImage=null;
      FreeOffer.oneoffer=null;
      FullInfo.day_article=null;
      FullInfo.info=null;
      HomeMonth.months=null;
      SideEffectsArticles.side_articles=null;
      ImageSlider.sliders=null;
      Team.homedoctors=null;
      AllVideos.videos=null;
      Websites.web=null;
      OfferScreen.offers=null;
    });


    ///offers


    ArticlesApi().getAllOffers().then((value) {
      setState(() {
        OfferScreen.offers = value;
      });
    });

    ///مقالات الاعراض الجانبية


    ArticlesApi().getCategorywithoutday(19).then((value2) {
      setState(() {
        SideEffectsArticles.side_articles = value2;
      });
    });

    ///banner

    ArticlesApi().getAllSliders().then((value) {
      setState(() {
        ImageSlider.sliders=value;
      });
    });

    ///full info

    Auth().GetProfile().then((value) {
      setState(() {
        FullInfo.info=value;
        day=value.data.daysNumber;


        ///المقالة اليوميه

        ArticlesApi().getCategory(12,value.data.daysNumber).then((value2) {
          if(mounted)
          setState(() {
            FullInfo.day_article=value2;
          });
        });

        // ///تعليمات التغذيه
        //
        // ArticlesApi().getCategory(18,value.data.daysNumber).then((value2) {
        //   setState(() {
        //     FullInfo.day_article=value2;
        //   });
        // });

        /// مقالات عن انظمة الدايت
        ArticlesApi().getCategory(17,day!).then((value) {
          if(mounted)
      setState(() {
        DietAdvice.diet=value;
      });
    });

        ///معلومات عامة تهمك
        ArticlesApi().getCategory(12,day!).then((value) {
          if(mounted)
          setState(() {
            PublicInfo.public_info=value;
          });
        });

        ///نصائح غائية

        ArticlesApi().getCategory(20,day!).then((value) {
          if(mounted){
            setState(() {
              FoodAdvice.advices=value;
            });
          }

        });

        ///  مقالات دكتور رامي حلمي

        ArticlesApi().getCategory(10, day!).then((value) {
          if(mounted)
            setState(() {
              DrRamyArticles.all_articles=value;
            });
        });

      });
    });

    ///فريق دكتور رامي
    doctors_api().getAllDoctors().then((value) {
      if(mounted){
        setState(() {
          Team.homedoctors=value;
        });
      }
    });

    ///انظمة التغذية

    ArticlesApi().getCategorywithoutday(18).then((value2) {
      if(mounted)
      setState(() {
        HomeMonth.months=value2;
      });
    });



    doctors_api().getDoctorImage().then((value) {
      if(mounted)
      setState(() {
        doctorImage=value;
      });
    });

    ///العروض
    ArticlesApi().getAllOffers().then((value) {
      if(mounted){
        setState(() {
          FreeOffer.oneoffer=value;
        });
      }

    });

    ///الفيديوهات
    vidoesapi().getvideos().then((value) {
      if(mounted)
      setState(() {
        AllVideos.videos=value;
      });
    });

    ///مواقع عامة تهمك
    vidoesapi().getweb().then((value) {
      if(mounted)
      setState(() {
        Websites.web=value;
      });
    });
  }

  @override
  void initState() {
    getAllHomeData();
   // Auth().GetProfile();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
        drawer: Drawer(
          child: drawer(),
        ),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kTextTitleColor,
          title: Container(
            height: 30,
            decoration: BoxDecoration(
                borderRadius:
                BorderRadius.all(Radius.circular(50.0)),
                color: Colors.white),
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child:
              InkWell(
                onTap: (){
                  showSearch(context: context, delegate: SearchResult());
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.grey,
                      size: 14,
                    ),
                    // SizedBox(width: 10,),
                    // Text(
                    //   'بحث', style: TextStyle(color: Colors.grey, fontSize: 14),),
                  ],
                ),
              ),
            ),),
          centerTitle: true,
          actions: [ InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (c)=>DoctorDetails(id:12)));
            },
              child: Image.asset('assets/icon2.png', height: 50, width: 50,)),
            // IconButton(
            //     onPressed: () {},
            //     icon: Icon(
            //       Icons.search,
            //       color: Colors.white,
            //     ))
          ],
        ),
        body: SafeArea(
            child: RefreshIndicator(
              onRefresh: ()async{
                getAllHomeData();
              }
              ,
              child: SingleChildScrollView(
                  child: Column(
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: Container(
                            child: ImageSlider(),
                           // height: SizeConfig.screenHeight/2.9,
                            // decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.only(
                            //         bottomRight: Radius.circular(25.0),
                            //         bottomLeft: Radius.circular(25.0)),
                            //
                            // ),

                          ),
                        ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color:Colors.white,
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FullInfo(),
                          ),
                          elevation: 13,),
                        ),
                        Column(
                          children: [
                            Titlewidget(title: 'انظمة التغذية'),
                            Container(
                              // height: getProportionateScreenHeight(178.0),
                              decoration: BoxDecoration(
                                // borderRadius: BorderRadius.only(bottomRight: Radius.circular(50.0) ),
                                //  color: kTextTitleColor.withOpacity(0.2)
                              ),
                              child: HomeMonth(),
                            ),
                          ],
                        ),
                        SideEffectsArticles(),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, bottom: 30, left:8, right: 8),
                            child: Column(
                              children: [


                               // SizedBox(height: 10,),
                                Container(
                                  height: 250,
                                    child: DrRamyArticles(doctorImage: doctorImage,)),
                              ],
                            ),),
                          // height: 250,

                        ),

                        FoodAdvice(),
                        DietAdvice(),
                        PublicInfo(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Titlewidget(title: 'فريق دكتور رامي'),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: InkWell(child: Text('Show More'),
                                onTap: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (c) =>
                                      AllTeam()));
                                },),
                            )
                          ],
                        ),
                        Team(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Titlewidget(title: 'فيديوهات'),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: InkWell(child: Text('Show More'),
                                onTap: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (c) =>
                                      settingsvideo()));
                                },),
                            )
                          ],
                        ),
                       AllVideos(),
                        Titlewidget(title: 'مواقع تهمك'),
                        Websites(),


                        Titlewidget(title: 'موقعنا ووسائل الاتصال'),

                        mapimage(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Titlewidget(title: 'أحدث العروض'),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: InkWell(child: Text('Show More'),
                                onTap: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(builder: (c) =>
                                      OfferScreen()));
                                },),
                            ),

                          ],
                        ),

                        FreeOffer(),
                        SizedBox(height: 10,),

                        Titlewidget(title: 'ارقام و احصائيات تهمك'),
                        Nums(),
                      ])),
            )));
  }
}

