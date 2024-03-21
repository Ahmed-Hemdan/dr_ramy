import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../modules/all_articles/specific_article/specific_article_screen.dart';

class FCMProvider with ChangeNotifier {
  static BuildContext? _context;
  static String? _blog_id;

  static void setContext(BuildContext context) =>
      FCMProvider._context = context;

  static void setblog(String blog) =>
      FCMProvider._blog_id = blog;

  /// when app is in the foreground
  static Future<void> onTapNotification(NotificationResponse? response) async {
    if (FCMProvider._context == null) return;
    print('payload'+response!.payload.toString());
    print('response id'+response.id.toString());
      await Navigator.of(FCMProvider._context!).push(MaterialPageRoute(builder: (c)=>SpecificArticle(article_id: int.parse(response.payload!),)));
  }
  /// when app is in the background
  static Future<void> backgroundHandler(RemoteMessage message) async {

    if (FCMProvider._context == null) return;
    await Navigator.of(FCMProvider._context!).push(MaterialPageRoute(builder: (c)=>SpecificArticle(article_id: message.data['blog_id'],)));

  }
}