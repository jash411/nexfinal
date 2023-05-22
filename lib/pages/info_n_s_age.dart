import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nexfinal/pages/current_and_goalweight_info.dart';
import 'package:nexfinal/pages/info_activity.dart';



FirebaseFirestore firestore=FirebaseFirestore.instance;
class info1 extends StatefulWidget {
  const info1({Key? key}) : super(key: key);

  @override
  State<info1> createState() => _info1State();
}
final _formKey1 = GlobalKey<FormState>();
final fullnameController = TextEditingController();
final ageController = TextEditingController();
final heightController = TextEditingController();
// final sexController = TextEditingController();
// final currentweightController = TextEditingController();
// final goalweightController = TextEditingController();
// final dietingController = TextEditingController();
var bmr;

class _info1State extends State<info1> {

  @override
  Widget build(BuildContext context) {
  CollectionReference users=FirebaseFirestore.instance.collection("users");

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body:SingleChildScrollView(
          child: Padding(
            padding:EdgeInsets.fromLTRB(20.0,150,20,0),
            child: Column(
            children:<Widget>[
              Text('Fill the Informations carefully',
              style: TextStyle(
                color: Colors.amber,
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
              ),),

              Form(
                key: _formKey1,
                child: Column(
                  children: [
                    TextFormField(style: TextStyle(fontSize: 16,
                          color: Colors.white),
                      controller: fullnameController,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: BorderSide(width: 1, color: Colors.white),
                          ),
                          labelText: "Full Name",
                          labelStyle: TextStyle(color: Colors.white),
                          alignLabelWithHint: false,
                          filled: true),
                      validator: (value) {
                        if(value!.isEmpty)
                        {
                          return 'Fullname required';
                        }},
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.done,
                    ),

                    SizedBox(height: 15,),
                    TextFormField(

                      style: TextStyle(fontSize: 16,
                          color: Colors.white),
                      controller: ageController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(color: Colors.white),
                        ),

                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(width: 1, color: Colors.white),
                        ),
                        hintText: "Age",
                        hintStyle: TextStyle(color: Colors.white),
                        labelStyle: TextStyle(color: Colors.white),
                        labelText: "Age",
                        alignLabelWithHint: false,
                        filled: true,
                      ),
                      cursorColor: Colors.yellow,
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,

                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Age required';
                        }
                        int? age = int.tryParse(value!);
                        if (age != null && age < 5) {
                          return 'Age must be greater than or equal to 5';
                        }
                        return null;
                      },

                    ),


                    SizedBox(height: 40.0),
                    Text('your height will help us to calculate your BMI.\n The standard was in(cm)',
                      style: TextStyle(
                        color: Colors.amberAccent,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15.0),

                    TextFormField(

                      style: TextStyle(fontSize: 16,
                        color: Colors.white,
                      ),
                      controller: heightController,
                      decoration: InputDecoration(

                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelText: "Height",
                        labelStyle: TextStyle(fontSize: 14,
                            color: Colors.white),

                      ),
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.done,

                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Height required';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 25),


                    SizedBox(height: 7.0),


                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey1.currentState!.validate()) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => weightinfo()),
                            );

                            await users.add({

                              'height': heightController.text,
                              'fullname': fullnameController.text,
                              'age': ageController.text,


                            }).then((value) => print('user name, age and height  added'));
                          }

                      },
                      child: Text('Submit'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        minimumSize: Size(160, 50),
                      ),
                    ),




                  ],
                ),
              ),


              SizedBox(height: 10.0),

        ],

            ),
          ),
        ),
      ),


    );
  }
}
