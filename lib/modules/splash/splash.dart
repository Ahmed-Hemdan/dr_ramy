
import 'dart:async';
import 'package:app_settings/app_settings.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:dr_ramy/modules/login/loginscreen.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:dr_ramy/style/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool _visible = true;
  String? token;
  ConnectivityResult? previous;
  final Connectivity _connectivity = Connectivity();
  StreamSubscription< ConnectivityResult >? _connectivitySubscription;
  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      setState(() {
        token = value.getString('user_token');
      });
    });
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_UpdateConnectionState);
    Timer(const Duration(milliseconds: 1000), () {
      if(mounted)
      setState(() {
        _visible=!_visible;
      });
    });

    super.initState();
    // articles().getAllArticles();
    // articles().getCategory(12);
    //Timer(const Duration(milliseconds: 4000), () {


   // });
  }

  @override
  void dispose() {
    _connectivitySubscription!.cancel();
    super.dispose();
  }
  Future< void > initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print("Error Occurred: ${e.toString()} ");
      return;
    }
    if (!mounted) {
      return Future.value(null);
    }
    return _UpdateConnectionState(result);
  }

  Future<void> _UpdateConnectionState(ConnectivityResult result) async {
    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      token==null?Navigator.push(context, MaterialPageRoute(builder: (c)=>LoginScreen())):Navigator.push(context, MaterialPageRoute(builder: (c)=>LoginScreen()));
     // showStatus(result, true);
    } else {
      _showdialog(result);
     // showStatus(result, false);
    }
  }
  void showStatus(ConnectivityResult result, bool status) {
    final snackBar = SnackBar(
        content:
        Text("${status ? 'ONLINE\n' : 'OFFLINE\n'}${result.toString()} "),
        backgroundColor: status ? Colors.green : Colors.red);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  void _showdialog(ConnectivityResult result){
    CoolAlert.show(
      showCancelBtn: true,
      context: context,
      type: CoolAlertType.warning,
      text: 'You Are Offline, please connect',
      confirmBtnText: 'WIFI',
      onConfirmBtnTap: (){
       // Navigator.pop(context);
        AppSettings.openWIFISettings();
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (c)=>MainPage()));
      },
      cancelBtnText: 'Mobile Data',
      onCancelBtnTap: (){
        AppSettings.openDataRoamingSettings();
      },
      //confirmBtnColor: Colors.green,

    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: kPrimaryGradientColor,
        ),
        child: Center(
          child:
          Column(
            children: [
              Expanded(
                flex: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedOpacity(
                      curve: Curves.easeInOut,
                      // If the widget is visible, animate to 0.0 (invisible).
                      // If the widget is hidden, animate to 1.0 (fully visible).
                      opacity: _visible ? 0.3 : 1.0,
                      duration: Duration(milliseconds: 3000),
                      // The green box must be a child of the AnimatedOpacity widget.
                      child: Image.asset('assets/icon2.png',height: 200,width: 200,),
                      // child: Container(
                      //   width: 200.0,
                      //   height: 200.0,
                      //   color: Colors.green,
                      // ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.,
                  children: [
                    Column(
                      children: [
                        Text('get started',style: TextStyle(color: Colors.white, fontSize: 10),),
                        SpinKitThreeBounce(
                          color: Colors.white,
                          size: 20.0,
                          //controller: AnimationController( duration: const Duration(milliseconds: 1200), vsync: ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
