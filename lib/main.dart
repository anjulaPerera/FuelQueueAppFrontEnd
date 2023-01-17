// import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
// import 'package:fuel/login/SignIn.dart';
// import 'package:fuel/navbar/nav_bar.dart';
// import 'package:fuel/owner_features/owner_dashboard.dart';
// import 'package:fuel/owner_features/owner_fuel_status.dart';
// import 'package:fuel/owner_features/owner_queue_status.dart';
// import 'package:fuel/owner_features/update_details.dart';
// import 'package:fuel/signin/signup_owner.dart';
// import 'package:fuel/signin/singup_user.dart';
import 'package:fuel/startup/join_us.dart';
// import 'package:fuel/startup/neaarest_station.dart';
// import 'package:fuel/startup/shed_count.dart';
// import 'package:fuel/startup/who_are_you.dart';
// import 'package:fuel/user_features/user_dashboard.dart';
// import 'user_features/user_fuel_status.dart';

void main() {
  runApp(
      // DevicePreview(
      //   builder: (context) => MyApp(), // Wrap your app
      // ),
      MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  get color => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: DevicePreview.locale(context),
      // builder: DevicePreview.appBuilder,
      home: JoinUs(),
    );
  }
}
