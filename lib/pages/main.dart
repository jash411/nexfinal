import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'mainpages/login_checker.dart';
import 'mainpages/setting.dart';
import 'start.dart';
import 'info_n_s_age.dart';
import 'login.dart';
import 'info_activity.dart';
import 'current_and_goalweight_info.dart';
import 'dietinginfo.dart';
import 'wellcomepage.dart';
import 'mainpages.dart';

final navigatorkey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorkey,
      debugShowCheckedModeBanner: false,
      initialRoute: isLoggedIn ? '/mainpages.dart' : '/',

      routes: {
        '/': (context) => startpage(),
        '/login_checker.dart': (context) => login_checker(),
        '/login.dart': (context) => login(),
        '/info_n_s_age.dart': (context) => info1(),
        '/info_activity.dart': (context) => activityinfo(),
        '/current_and_goalweight_info.dart': (context) => weightinfo(),
        '/dietinginfo.dart': (context) => dietinginfo(),
        '/wellcomepage.dart': (context) => wellcomepage(),
        '/mainpages.dart': (context) => mainpages(),
        '/setting.dart': (context) => setting(),
      },
    );
  }

}
Future<bool> isLoggedIn() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getBool('isLoggedIn') ?? false;
}

