import 'dart:async';
import 'dart:io';

import 'package:dr_ramy/models/profile_info.dart';
import 'package:dr_ramy/modules/all_articles/specific_article/specific_article_screen.dart';
import 'package:dr_ramy/modules/mainpage/mainscreen.dart';
import 'package:dr_ramy/provider/fcm_provider.dart';
import 'package:dr_ramy/services/auth.dart';
import 'package:dr_ramy/services/firebase_options.dart';
import 'package:dr_ramy/services/notification.dart';
import 'package:dr_ramy/style/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'modules/splash/splash.dart';

import 'package:firebase_core/firebase_core.dart';

final notifications = FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print('Handling a background message ${message.messageId}');
}

Map<String,VoidCallback>? mapy;

void main() async{


  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp();

  final _message = await FirebaseMessaging.instance.getInitialMessage();
  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  HttpOverrides.global = new MyHttpOverrides();
  runApp(
      EasyLocalization(
          path: 'lib/translation',
          supportedLocales: [
            Locale('ar'),
          ],
          fallbackLocale: Locale('ar'),
          child: MaterialApp(home: MyApp())

      )
  );
}
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var _token;
  UserData? userdata;

  List<String> messages=[];
  static FirebaseMessaging? _firebaseMessaging;
  static FirebaseMessaging get firebaseMessaging => _firebaseMessaging ?? FirebaseMessaging.instance;




  void handleMessage(RemoteMessage message) {
    print('article id'+message.data['blog_id']);
  // FCMProvider.onTapNotification(message.data['blog_id']);
   Navigator.push(context, MaterialPageRoute(builder: (c)=>SpecificArticle(article_id: int.parse(message.data['blog_id']),)));
  }
  firebaseHandle()async{

    Firebase.initializeApp().whenComplete(() {
      print("completed");

    });



    FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        print('message not null');
      }
    });

    /// need this for ios foregournd notification
    await firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    // FirebaseMessaging.onMessageOpenedApp.listen((event) {
    //   handleMessage(event);
    // });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async{

      RemoteNotification notification = message.notification!;
      FCMProvider.setblog(message.data['blog_id']);
      print('badge'+message.data['badge']);
      AndroidNotification? android = message.notification?.android;

      final InitializationSettings _initSettings = InitializationSettings(
          android: AndroidInitializationSettings("logoapp"),
          iOS: DarwinInitializationSettings()
      );



      if (notification != null && android != null && !kIsWeb) {
        print(notification.title.toString());
        print(notification.body.toString());


          Show_Notification().showNotification(notification.title.toString(), notification.body.toString(),message.data['notification_id'],message.data['blog_id']);

          notifications.initialize(_initSettings,onDidReceiveNotificationResponse: (response){
          FCMProvider.onTapNotification(response);

        });
      }
      else{
        print('else ----'+notification.body!);
      }
    });



    FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
    FirebaseMessaging.onBackgroundMessage(FCMProvider.backgroundHandler);
    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   print('A new onMessageOpenedApp event was published!');
    // });

    FirebaseMessaging.instance.onTokenRefresh.listen((newToken) {
      print('device token refreshed');
      setState(() {
        _token=newToken;
      });
      SharedPreferences.getInstance().then((pref) {
        pref.setString('fcm_device_token',_token);
        Auth().SendDeviceToken(pref.getInt('user_id')!,_token);
      });
    });
  }
  String? userToken;
  Future<bool> getpermission()async{
    NotificationSettings settings = await firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User granted permission: ${settings.authorizationStatus.name}');

    if(settings.authorizationStatus.name=="authorized"){
      return true;
    }
    else{
      return false;
    }
  }
  @override
  void initState() {
    userToken!=null?
    Auth().GetProfile().then((value) {
      setState(() {
        userdata=value;
      });
    }):null;
    SharedPreferences.getInstance().then((value) {
      setState(() {
        print('hi my user token' + value.getString('user_token').toString());
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FCMProvider.setContext(context);
    });

    SharedPreferences.getInstance().then((value) {
      setState(() {
        print('user token'+value.getString('user_token').toString());
        userToken=value.getString('user_token');
      });
    });
      getpermission().then((value) {
        if(value){
          firebaseHandle();
        }
      });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Ramy Helmy',
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: kPrimaryColor,
          primaryColorLight: kPrimaryLightColor,
        ),
        home: userdata==null && userToken == null ? SplashScreen() : MainBody(),
    );
  }
}
