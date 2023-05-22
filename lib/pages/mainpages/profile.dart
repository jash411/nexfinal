import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nexfinal/pages/current_and_goalweight_info.dart';
import 'package:nexfinal/pages/info_activity.dart';
import 'package:nexfinal/pages/info_n_s_age.dart';
import 'package:nexfinal/pages/mainpages/setting.dart';
import 'package:percent_indicator/percent_indicator.dart';

class profile extends StatefulWidget {

  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
class _profileState extends State<profile> {

  // double bmrvalue=0;

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
                  margin: EdgeInsets.only(left: 20, right: 25),
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
                     SizedBox(width: 15),
                     Column(
                        children: [
                          Text('signed in as  ',style: TextStyle(
                            color: Colors.lightBlueAccent,
                            fontSize: 15,
                          ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(user.email!, style: TextStyle(
                                fontSize: 17,
                                color: Colors.white
                            )),
                          ),

                        ],
                      ),
                   ],
                 ),
               )

              ],
        ),
            Divider(
              height: 20,
              thickness: 5,
              color: Colors.yellow,
              indent: 20,
              endIndent: 20,
            ),

            // SizedBox(height: 50),
              Row(
                children: [
                  SizedBox(width: 28),
                  SizedBox(height: 50),
                  Text('Details', style: TextStyle(
                  color: Colors.lightBlueAccent,
                   fontSize: 20,
             ),
                    ),
                ],
              ),

            Container(
              padding: EdgeInsets.all(30).copyWith(top: 0,left: 10),
              margin: EdgeInsets.only(left: 30, right: 25),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.2),
                borderRadius: BorderRadius.circular(35).copyWith(topLeft: Radius.circular(0)),
              ),

              child: Column(
                children: <Widget>[
                  SizedBox(height: 15),
                  Row(
                    children: [
                      Text('Name: ', style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                      ),
                      Text(fullnameController.text,style: TextStyle(
                        color: Colors.white,
                        fontSize: 18),
                      )
                              ],
                  ),
                  SizedBox(height: 13),
                  Row(
                    children: [
                      Text('Age: ', style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                      ),
                      Text(ageController.text,style: TextStyle(
                          color: Colors.white,
                          fontSize: 18),
                      )
                    ],
                  ),
                  SizedBox(height: 13),
                  Row(
                    children: [
                      Text('Height: ', style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                      ),
                      Text(heightController.text,style: TextStyle(
                          color: Colors.white,
                          fontSize: 18),
                      ),
                      Text('cm', style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      ),
                    ],
                  ),
                  SizedBox(height: 13,),
                  Row(
                    children: [
                      Text('Goal weight: ', style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                      ),
                      Text(goalweightController.text,style: TextStyle(
                          color: Colors.white,
                          fontSize: 18),
                      ),
                      Text('Kg', style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      ),
                    ],
                  ),


                ],
              ),

            ),
            SizedBox(height: 15),
            Divider(
              height: 20,
              thickness: 5,
              color: Colors.blueGrey,
              indent: 20,
              endIndent: 20,
            ),

            Row(
              children: [
                SizedBox(width: 28),
                SizedBox(height: 50),
                Text('Calories', style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                ),
                ),
              ],
            ),
          Column(
                children: <Widget>[

                  Column(
                    children:<Widget> [
                      LinearPercentIndicator(
                        lineHeight: 30,
                        width: 350,
                        animation: true,
                        animationDuration: 2000,
                        progressColor: Colors.blueGrey,
                        backgroundColor: Colors.red[200],
                        percent: .5,
                        center: Text('${bmrvalue.toStringAsFixed(0)} cal', style: TextStyle(fontSize: 16, color: Colors.white)),
                      ),
                      Text('Basal metabolic rate', style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      ),
                    ],
                  ),


                  Column(
                    children:<Widget> [
                      LinearPercentIndicator(
                        lineHeight: 30,
                        animation: true,
                        animationDuration: 2000,
                        width: 350,
                        progressColor: Colors.deepPurpleAccent,
                        backgroundColor: Colors.red[200],
                        percent: .3,
                        center:    Text('${tefvalue.toStringAsFixed(0)} cal', style: TextStyle(fontSize: 16, color: Colors.white)),

                      ),
                      Text('Thermic Effect of food', style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      ),
                    ],
                  ),

                  Column(
                    children:<Widget> [
                      LinearPercentIndicator(
                        lineHeight: 30,
                        width: 350,
                        animation: true,
                        animationDuration: 2000,
                        progressColor: Colors.green,
                        backgroundColor: Colors.red[200],
                        percent: .8,
                        center:Text('${Activity.toStringAsFixed(0)} cal', style: TextStyle(fontSize: 16, color: Colors.white)),

                      ),
                      Text('Energy Expenditure of Activity', style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                      ),
                    ],
                  ),


                ],
              ),




              ],
            ),
        )
    );
  }
}



