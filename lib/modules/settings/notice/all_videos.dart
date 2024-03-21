import 'package:dr_ramy/components/drawer.dart';
import 'package:dr_ramy/models/videos.dart';
import 'package:dr_ramy/modules/home/components/videos.dart';
import 'package:dr_ramy/services/const.dart';
import 'package:dr_ramy/services/videos_api.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:flutter/material.dart';
class settingsvideo extends StatefulWidget {
  const settingsvideo({Key? key}) : super(key: key);

  @override
  _settingsvideoState createState() => _settingsvideoState();
}

class _settingsvideoState extends State<settingsvideo> {
  VideosModel? videos;
  @override
  void initState() {
    vidoesapi().getvideos().then((value) {
      setState(() {
        videos=value;
      });
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: drawer(),
      ),

      appBar: AppBar(

          elevation: 0,
          backgroundColor: kTextTitleColor,
          title: Text(
            "الفيديوهات",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [ Image.asset('assets/icon2.png',height: 50,width: 50,),]
      ),
      body:SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: videos == null
                ? SizedBox()
                : GridView.count(
                crossAxisCount: 1,
                // mainAxisSpacing: 9,
                crossAxisSpacing: 0.2,
                childAspectRatio: 2.5,
                children: List.generate(videos!.data.length, (index) {
                  //      widget.title=snapshot.data.allProducts[index].data.title;
                  return InkWell(
                      onTap: () {
                        lanchYoutube(url:videos!.data[index].url);
                        // Navigator.push(context, MaterialPageRoute(builder: (c)=>DoctorDetails(id: doctors!.data![index].id,)));
                      },
                      child: Center(
                        child: video(
                          context: context,
                          index:index, videos: videos!,
                        ),
                      )
                    // team_member('دكتورة هاجر','اخصائيه تغذيه')
                  );
                }).toList()),
          )));

  }
}
