import 'package:demo/demo2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Demo1 extends StatefulWidget {
  @override
  _Demo1State createState() => _Demo1State();
}

class _Demo1State extends State<Demo1> {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSetttings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOs);

    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return Demo2();
    }));
  }

  showNotification() async {
    var android = AndroidNotificationDetails('id', 'channel ', 'description',
        priority: Priority.High, importance: Importance.Max);
    var iOS = IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
        0, 'Flutter devs', 'Flutter Local Notification Demo', platform,
        payload: 'Welcome to the Local Notification demo');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: InkWell(
        onTap: () {
          showNotification();
        },
        child: Text("First Page",
            style: TextStyle(
              color: Colors.red,
              fontSize: 40,
            )),
      ),
    ));
  }
}
