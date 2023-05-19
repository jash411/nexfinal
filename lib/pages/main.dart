import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'mainpages/login_checker.dart';
import 'mainpages/setting.dart';
import 'start.dart';
import 'info_n_s_age.dart';
import 'login.dart';
import 'info_activity.dart';
import 'current_and_goalweight_info.dart';
import 'dietinginfo.dart';
import 'wellcomepage.dart';
import 'mainpages/mainpages.dart';

final navigatorkey= GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(
      MaterialApp(
        navigatorKey: navigatorkey,
    debugShowCheckedModeBanner: false,
    // home: startpage(),
    routes: {
      '/':(context)=>startpage(),
      '/login_checker.dart':(context)=>login_checker(),
      '/login.dart':(context)=>login(),
      '/info_n_s_age.dart':(context)=>info1(),
      '/info_activity.dart':(context)=>activityinfo(),
      '/current_and_goalweight_info.dart':(context)=>weightinfo(),
      '/dietinginfo.dart':(context)=>dietinginfo(),
      '/wellcomepage.dart':(context)=>wellcomepage(),
      '/mainpages.dart':(context)=>mainpages(),
      '/setting.dart':(context)=>setting(),
    },
      )
  );
}


