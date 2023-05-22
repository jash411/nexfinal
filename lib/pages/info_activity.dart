import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nexfinal/pages/current_and_goalweight_info.dart';

class activityinfo extends StatefulWidget {
  const activityinfo({Key? key}) : super(key: key);

  @override
  State<activityinfo> createState() => _activityinfoState();
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
double Activity=0;

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
          Activity= bmrvalue * 1.375 as double;
          final data = {'EEoA': Activity};
          await collectionReference.add(data);
          Navigator.pushNamed(context, '/dietinginfo.dart');
          print('Energy of Expenditure calculated by lightly active $Activity');
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



        ElevatedButton(onPressed: ()async {
          Activity= bmrvalue * 1.55 as double;
          final data = {'EEoA': Activity};
          await collectionReference.add(data);
          Navigator.pushNamed(context, '/dietinginfo.dart');
          print('Energy of Expenditure calculated by Moderately active $Activity');
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

        ElevatedButton(onPressed: ()async {
          Activity= bmrvalue * 1.725 as double;
          final data = {'EEoA': Activity};
          await collectionReference.add(data);
          Navigator.pushNamed(context, '/dietinginfo.dart');
          print('Energy of Expenditure calculated by Very active $Activity');
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

        ElevatedButton(onPressed: ()async {
          Activity= bmrvalue * 1.9 as double;
          final data = {'EEoA': Activity};
          await collectionReference.add(data);
          Navigator.pushNamed(context, '/dietinginfo.dart');
          print('Energy of Expenditure calculated by Extra active $Activity');
        },
          child: Text('Extra Active',
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
