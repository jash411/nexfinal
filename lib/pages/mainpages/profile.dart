import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nexfinal/pages/info_n_s_age.dart';
import 'package:nexfinal/pages/mainpages/setting.dart';


enum _Menuvalues{
  share,
  Exit,
}
class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}
final FirebaseFirestore _firestore = FirebaseFirestore.instance;
class _profileState extends State<profile> {


  @override
  Widget build(BuildContext context) {
    final user =FirebaseAuth.instance.currentUser!;
    final collectionReference = _firestore.collection('users');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.grey[900],
          appBar: AppBar(
            title: Text('MY Profile'),
            backgroundColor: Colors.grey[900],
            centerTitle: true,
            actions: <Widget>[
              IconButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>setting()
                )
                );

              },
                  icon: Icon(Icons.settings))
            ],

          ),
        body: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Column(
              children:<Widget> [

                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 30, right: 25),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.4),
                    borderRadius: BorderRadius.circular(20).copyWith(topLeft: Radius.circular(0)),
                  ),


                   child: Row(
                   children: [
                     SizedBox(width: 30),
                     CircleAvatar(
                      radius: 35,
                      backgroundColor: Colors.orangeAccent,
                      backgroundImage: AssetImage('assets/beyeaynet.jpg'),
              ),
                     SizedBox(width: 25),
                     Column(
                        children: [
                          Text('signed in as  ',style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                          ),
                          Text(user.email!, style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                          )),

                        ],
                      ),
                   ],
                 ),
               )

              ],
        ),

            SizedBox(height: 50),
              Row(
                children: [
                  SizedBox(width: 28),
                  SizedBox(height: 50),
                  Text('Details', style: TextStyle(
                  color: Colors.white,
                   fontSize: 20,
             ),
                    ),
                ],
              ),

            Container(
              padding: EdgeInsets.all(100).copyWith(top: 0,left: 10),
              margin: EdgeInsets.only(left: 30, right: 25),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.2),
                borderRadius: BorderRadius.circular(20).copyWith(topLeft: Radius.circular(0)),
              ),

              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Text('Name: ', style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      ),
                      Text(fullnameController.text,style: TextStyle(
                        color: Colors.white,
                        fontSize: 18),
                      )

                              ],
                  ),
                  Row(
                    children: [
                      Text('Age: ', style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      ),
                      Text(ageController.text,style: TextStyle(
                          color: Colors.white,
                          fontSize: 18),
                      )
                    ],
                  ),

                  Row(
                    children: [
                      Text('Height: ', style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      ),
                      Text(heightController.text,style: TextStyle(
                          color: Colors.white,
                          fontSize: 18),
                      )
                    ],
                  ),



                ],
              ),

            ),


              ],
            ),
        )
    );
  }
}



