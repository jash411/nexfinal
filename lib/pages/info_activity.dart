import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class activityinfo extends StatefulWidget {
  const activityinfo({Key? key}) : super(key: key);

  @override
  State<activityinfo> createState() => _activityinfoState();
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

class _activityinfoState extends State<activityinfo> {
  @override
  Widget build(BuildContext context) {
    final collectionReference = _firestore.collection('users');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
body: SingleChildScrollView(
  child: Padding(
    padding:EdgeInsets.fromLTRB(20.0,200,20,0),
    child:Column(
      children: <Widget>[
        Text('How Active you are?',
          style: TextStyle(
            color: Colors.white,
            fontSize: 35.0,
            fontWeight: FontWeight.bold,
          ),),

        SizedBox(height: 9.0),
        Text('Knowing your daily Activity level helps us \n'
            'to calculate your calorie needs more accurately.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
          ),
        ),
 SizedBox(height: 40.0),



        ElevatedButton(onPressed: ()async {
          final data = {'activity': 'Lightly active'};
          await collectionReference.add(data);
          Navigator.pushNamed(context, '/current_and_goalweight_info.dart');
          print('login pressed');
        },
          child: Text('Lightly Active',
            style: TextStyle(fontSize: 14,
                color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 0,
            padding: EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),

        SizedBox(height: 30.0),


        ElevatedButton(onPressed: () async {
          final data = {'activity': 'Moderately active'};
        await collectionReference.add(data);
        Navigator.pushNamed(context, '/current_and_goalweight_info.dart');
        },
          child: Text('Moderately Active',
            style: TextStyle(fontSize: 14,
                color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 0,
            padding: EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),

        SizedBox(height: 30.0),

        ElevatedButton(onPressed: () async {
          final data = {'activity': 'active'};
          await collectionReference.add(data);
          Navigator.pushNamed(context, '/current_and_goalweight_info.dart');
        },
          child: Text(' Active',
            style: TextStyle(fontSize: 14,
                color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 0,
            padding: EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),

        SizedBox(height: 30.0),

        ElevatedButton(onPressed: () async {
          final data = {'activity': 'Very active'};
          await collectionReference.add(data);
          Navigator.pushNamed(context, '/current_and_goalweight_info.dart');
        },
          child: Text('Very Active',
            style: TextStyle(fontSize: 14,
                color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            elevation: 0,
            padding: EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),

        SizedBox(height: 30.0),





      ],


    ) ,
  ),
),
      ),
    );
  }
}