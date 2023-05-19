

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}


class _loginState extends State<login> {

  // final AuthService _auth=AuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController TexteditingController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  //_________________________________________________________

  bool passwordVisible=false;
String errorTextvalue='Email required';



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body:SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(20.0, 150.0, 20.0,10),
            // child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                     Text('Well come to Login Page',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        // height: EdgeInsets.fromLTRB(5.0, 4.0, 5.0, 0),

                      ),
                      ),
                      // height: 110,

                 SizedBox(height: 15.0),

                  TextFormField(
                      controller: emailController,
                      style: TextStyle(fontSize: 16, color: Colors.white),
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        labelText: "Email",
                        labelStyle: TextStyle(fontSize: 14, color: Colors.white),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        // Additional email validation logic can be added here if needed
                        return null; // Return null if the validation succeeds
                      },

                  ),


                  SizedBox(height: 15.0),


                  TextField(
                    controller: passwordController,
                    style: TextStyle(fontSize: 16,color: Colors.white),
                    obscureText: passwordVisible,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(fontSize: 14,
                            color: Colors.white),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        filled: true,
                        suffixIcon: IconButton(
                          icon: Icon(
                            passwordVisible ? Icons.visibility : Icons.visibility_off,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            setState(() {
                              passwordVisible = !passwordVisible;
                            });
                          },
                        )),
                    cursorColor: Colors.black,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value?.isEmpty ?? true) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),


                  SizedBox(height: 30.0),
                  ElevatedButton(
                    onPressed: signIn,
                    child: Text('Get Started',
                    style: TextStyle(fontSize: 14,
                        color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                   padding: EdgeInsets.fromLTRB(20.0,15.0,20.0,15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),

                ],
              ),
            ),

            ),
          ),

      );

  }
  Future<void> signIn() async {
    showDialog(context: context,
        barrierDismissible: false,
        builder: (context)=>Center(child:CircularProgressIndicator()));

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString(),
      );
      // Sign-in successful, proceed with desired actions
    } catch (e) {
      // Handle sign-in errors
      print('Sign-in failed: $e');
    }


  navigatorkey.currentState!.popUntil((route)=>route.isFirst);
  }


}
