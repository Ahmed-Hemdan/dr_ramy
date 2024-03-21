import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../main.dart';



class Show_Notification{
   Future<void> showNotification(String title,String body,String? notificationIndex,String? payload) async {
     AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails('your channel id', 'your channel name',
      channelDescription: 'your channel description',
     // groupKey: notificationIndex,
      channelShowBadge: true,
      importance: Importance.max,
      priority: Priority.high,
      playSound: true,
     // number: notificationsCount,
      ongoing: false,
      icon: 'logoapp',);
     NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);
    await notifications.show(
       // 0,
        int.parse(notificationIndex!),
        title, body, platformChannelSpecifics,
        payload: payload);
  }
}