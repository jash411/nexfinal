import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nexfinal/pages/dietinginfo.dart';
import 'package:nexfinal/pages/info_activity.dart';
import 'package:nexfinal/pages/info_n_s_age.dart';
import 'package:nexfinal/pages/mainpages/profile.dart';

FirebaseFirestore firestore=FirebaseFirestore.instance;

class weightinfo extends StatefulWidget {
  const weightinfo({Key? key}) : super(key: key);

  @override
  State<weightinfo> createState() => _weightinfoState();
}
final _formKey2=GlobalKey<FormState>();

final currentweightController = TextEditingController();
final goalweightController = TextEditingController();

double cw = double.parse(currentweightController.text);
double height=double.parse(heightController.text);
int age=int.parse(ageController.text);
double bmrvalue=0;
double tefvalue=0;
// late double Fembmrvalue;

class _weightinfoState extends State<weightinfo> {
  var gender;



  @override
  Widget build(BuildContext context) {
    CollectionReference users=FirebaseFirestore.instance.collection("users");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SingleChildScrollView(
          child: Padding(
            padding:EdgeInsets.fromLTRB(20.0,200,20,0),
            child:Column(
              children: <Widget>[
                Text('What is your Plan \non your  Weight?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),),

                SizedBox(height: 9.0),
                const Text('Knowing your current and Goal weight helps us \n'
                    'to calculate your calorie needs and Creating plan\n '
                    'that will help you reach your Goal.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 40.0),

                Form(
                  key: _formKey2,
                  child: Column(
                    children: [
                      TextFormField(
                        style: const TextStyle(fontSize: 16,
                        color: Colors.white,
                        ),
                        controller: currentweightController,
                        decoration: const InputDecoration(

                            focusedBorder:UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                            ),
                            labelText: "Current Weight",
                            labelStyle: TextStyle(fontSize: 14,
                                color: Colors.white),

                        ),
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                      validator: (value){
                          if(value?.isEmpty??true){
                            return 'please Enter Current Weight';
                          }
                          int? vari=int.tryParse(value!);
                          if(vari!=null && vari<35)
                            {
                              return'only more than 35KG was allowed';
                            }
                          return null;
                      }

                      ),
                      SizedBox(height: 70.0),


                      Text('For Healthy BMI \n your Goal weight shoul be '
                          'at least 55 kg.',
                        style: TextStyle(
                          color: Colors.amberAccent,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),


                      TextFormField(
                        style: TextStyle(fontSize: 16,
                          color: Colors.white,
                        ),
                        controller: goalweightController,
                        decoration: InputDecoration(

                          focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                                ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                                ),
                          labelText: "Goal Weight",
                          labelStyle: TextStyle(fontSize: 14,
                              color: Colors.white),

                                ),
                        keyboardType: TextInputType.phone,
                        textInputAction: TextInputAction.done,
                          validator: (value){
                            if(value?.isEmpty??true){
                              return 'please Enter Goal Weight';
                            }
                            int? vari=int.tryParse(value!);
                            if(vari!=null && vari<55)
                            {
                              return'only more than 55KG was allowed';
                            }
                            return null;
                          }
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Gender',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.normal,
                    ),),
                ),


                SizedBox(height: 7.0),


                Row(
                  children: [
                    Theme(
                      data: Theme.of(context).copyWith(unselectedWidgetColor: Colors.white),
                      child: Radio(
                        value: 'Male',
                        groupValue: gender,
                        onChanged: (dynamic value) {
                          setState(() {

                             bmrvalue=(66.5 + (13.75 * cw) + (5.003 * height) - (6.75 * age)) as double;
                             tefvalue=bmrvalue*0.1;

                            print(bmrvalue);
                            gender = value;
                            print("$gender $bmrvalue Selected");




                          });
                        },
                      ),
                    ),
                    Text('Male', style: TextStyle(fontSize: 16, color: Colors.white)),

                    Theme(
                      data: Theme.of(context).copyWith(unselectedWidgetColor: Colors.white),
                      child: Radio(
                        value: 'Female',
                        groupValue: gender,
                        onChanged: (dynamic value) {
                          setState(() {

                            bmrvalue=(655.1 + (9.53 * cw) + (5.003 * height) - (4.676 * age)) as double;
                            tefvalue=bmrvalue*0.1;

                            print(bmrvalue);

                            gender = value;
                            print("$gender Selected");

                          });
                        },
                      ),
                    ),
                    Text('Female', style: TextStyle(fontSize: 16, color: Colors.white)),
                  ],
                ),
                Text(
                  gender == null ? 'Please select a gender' : '',
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(height: 10),

                ElevatedButton(onPressed: () async {
                  // if(_formKey.currentState!.validate()) {
                  //   Navigator.pushNamed(context, '/dietinginfo.dart');
                  // }

                  if (_formKey2.currentState!.validate()) {
                    if (gender == null) {
                      setState(() {
                        // Show error message if gender is not selected
                      });
                    } else {
                      print(bmrvalue);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => activityinfo()),
                      );

                      await users.add({

                        'currentweight':currentweightController.text,
                        'gender': gender, // Add gender to Firestore
                        'goalweight':goalweightController.text,
                        'bmr': bmrvalue,
                        'TEF': tefvalue,

                      }).then((value) => print('Basal metabolic rate added'));



                    }

                }
                },
                  child: Text('Next',
                    style: TextStyle(fontSize: 14,
                        color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueGrey,
                    elevation: 0,
                    padding: EdgeInsets.all(16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),

                ),


              ],
            ) ,
          ),
        ),
      ),
    );
  }
}
