import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nexfinal/pages/info_n_s_age.dart';



import '../login.dart';

// class login_checker extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       // debugShowCheckedModeBanner: false,
//       title: 'My App',
//       home: StreamBuilder<User?>(
//         stream: FirebaseAuth.instance.authStateChanges(),
//         builder: (BuildContext context, AsyncSnapshot<User?> snapshot) {
//           if (snapshot.connectionState == ConnectionState.active) {
//             if (snapshot.hasData && snapshot.data != null) {
//               return info1();
//             } else {
//               return login();
//             }
//           } else {
//             return Scaffold(
//               body: Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
// }



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
          else {
            return login();
          }
        },
      ),
    );
  }
}
