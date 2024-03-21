import 'package:cached_network_image/cached_network_image.dart';
import 'package:dr_ramy/models/videos.dart';
import 'package:dr_ramy/services/const.dart';

import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AllVideos extends StatefulWidget {
  static VideosModel? videos;
  const AllVideos({Key? key}) : super(key: key);
  @override
  State<AllVideos> createState() => _AllVideosState();
}

class _AllVideosState extends State<AllVideos> {

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      AllVideos.videos==null?Shimmer.fromColors(
          baseColor: Colors.grey[400]!,
          highlightColor: Colors.grey[100]!,
          enabled: true,
          child:Container(

            width: SizeConfig.screenWidth-50,
            color: Colors.grey.withOpacity(0.6),
          )):SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
           // height: getProportionateScreenHeight(230),
            margin: EdgeInsets.symmetric(horizontal: 4),
            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (){
                      //lanchYoutube(url: videos!.data![index].url);
                      lanchYoutube(url:AllVideos.videos!.data[index].url);
                    },
                    child: AllVideos.videos==null?Container():video(
                    context: context,
                    index:index, videos: AllVideos.videos!,
                    ),
                  );
                }

                )),
      );
    //   Container
    //   ( height: 300,
    //   child: ListView.builder(
    // padding: EdgeInsets.only(bottom:40.0),
    // itemCount:3,
    // itemBuilder: (BuildContext context, int index) {
    // return video(
    // context: context,
    // index:index,
    // );
    //
    // },
    // ));

  }
}
Widget video({required int index, required BuildContext context, required VideosModel videos}){
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Card(
      elevation: 5,
      child: Container(
        height: 120,
        color: index.isEven?Colors.grey.withOpacity(0.2):Theme.of(context).scaffoldBackgroundColor,
            child:Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
              child: Column(
                children: [
                  Expanded(flex:1,child: Row(children: [
                    Expanded(child:
                    CachedNetworkImage(
                      fadeOutDuration: Duration(milliseconds: 500),
                      fadeInDuration:  Duration(milliseconds: 500),
                      imageUrl: videos.data[index].image,
                      placeholder: (context, url) => Image.asset('assets/icon.png',width: 1000,),
                      errorWidget: (context, url, error) => Image.asset('assets/icon.png',width: 1000,),
                    ),
                     // Image.network(videos.data[index].image)
                    // YoutubePlayer(
                    //   controller: YoutubePlayerController(
                    //
                    //       initialVideoId: YoutubePlayer.convertUrlToId(
                    //           videos.data![index].url!)!,
                    //       flags: YoutubePlayerFlags(
                    //         disableDragSeek: false,
                    //         loop: false,
                    //         isLive: false,
                    //         forceHD: false,
                    //         mute: false,
                    //         autoPlay: false,
                    //       )),
                    //   showVideoProgressIndicator: false,
                    //   progressIndicatorColor: Colors.blue,
                    //   progressColors: ProgressBarColors(
                    //       playedColor: Colors.blue,
                    //       handleColor: Colors.blueAccent),
                    // )
                      ),
                    SizedBox(width: 5,),
                    Expanded(flex:3,child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [

                            Expanded(child: Text(videos.data[index].title,style: TextStyle(color: kbuttonColor, fontSize: 15,fontWeight: FontWeight.bold,
                              overflow: TextOverflow.visible,),maxLines: 3,)),
                           // Expanded(child: Text('دكتور رامي حلمي لجراحة المناظير - Dr ramy helmy',style: TextStyle(color: kbuttonColor, fontSize: 15,fontWeight: FontWeight.bold),)),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     Text('video description',style: TextStyle(color: kbuttonColor),),
                        //   ],
                        // ),

                      ],
                    ))
                  ],
                  )),
                  // Expanded(flex:1,child: Row(
                  //  // mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Text('20 \n massiagin \n states', style: TextStyle(fontSize: 10),),
                  //     SizedBox(width: 30,),
                  //     Text('EGP 28-51 \n cost per messenging \n conststation stared',style: TextStyle(fontSize: 10),),
                  //     SizedBox(width: 30,),
                  //     Text('EGP 70-11 \n spont ',style: TextStyle(fontSize: 10),),
                  //   ],
                  //
                  // )),
                ],
              ),
            ),
      ),
    ),
  );
}