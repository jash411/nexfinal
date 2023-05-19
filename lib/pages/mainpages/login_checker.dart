

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nexfinal/pages/info_n_s_age.dart';

import '../login.dart';

class login_checker extends StatelessWidget {
  const login_checker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return info1();
          }
          // else if(snapshot.connectionState==ConnectionState.waiting){
          //   return Center(child: CircularProgressIndicator(),);
          // }
          else if (snapshot.hasError){
            return Center(child:Text('error Occured'));
          }


          else {
            return login();
          }
        },
      ),
    );
  }
}
