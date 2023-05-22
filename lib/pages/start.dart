
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nexfinal/pages/mainpages.dart';
import 'package:nexfinal/pages/mainpages/home.dart';


void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: startpage(),
  ));
}
class startpage extends StatefulWidget {
  const startpage({Key? key}) : super(key: key);

  @override
  State<startpage> createState() => _startpageState();
}

class _startpageState extends State<startpage> {
  // final AuthService _auth =AuthService();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
      body: Padding(
        padding:EdgeInsets.fromLTRB(100.0,100,100,0),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment(0, 0),
               child:Text('Well come to Nutrition Expert Application',

           style: TextStyle(
              fontSize: 35.0,
               fontWeight: FontWeight.bold,
               color: Colors.cyan,
        ),
        ),

            ),
SizedBox(height: 15),
             Text('NeX',
             style: TextStyle(
               fontSize: 90.0,
               fontWeight: FontWeight.bold,

               color: Colors.white,
             ),
             ),
            Padding(
              padding: const EdgeInsets.fromLTRB(50, 100, 50, 0),
              child: Transform.scale(
                scale: 4.5, // The scale factor to increase the image size. 1.0 is the default size.
                child: Image(
                  image: AssetImage('assets/recipe.jpg'), // Replace with your own image asset path
                ),
              ),
            ),
              SizedBox(height:150.0),
              Align(
                alignment: Alignment.bottomRight,

                child: Row(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: ()  {
                      Navigator.pushNamed(context, '/login_checker.dart');


                    },
                        child: Text('Login'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueGrey,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          minimumSize: Size(160, 50),
                        ),
                      ),



                   //  ElevatedButton(onPressed: (){
                   //    Navigator.pushNamed(context, '/info_n_s_age.dart');
                   //    print('Get start pressed');
                   //  },
                   //      child: Text('Get started'),
                   //    style: ElevatedButton.styleFrom(
                   //      backgroundColor: Colors.blueGrey,
                   //      elevation: 5,
                   //   shape: RoundedRectangleBorder(
                   //     borderRadius: BorderRadius.circular(30),
                   //   ),
                   //      minimumSize: Size(200, 50),
                   // ),
                   //  ),




                  ],
                ),
              ),

              ],
            ),

        ),
      ),
      ),

    );
  }
}
