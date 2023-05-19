import 'package:flutter/material.dart';

class wellcomepage extends StatefulWidget {
  const wellcomepage({Key? key}) : super(key: key);

  @override
  State<wellcomepage> createState() => _wellcomepageState();
}

class _wellcomepageState extends State<wellcomepage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: SingleChildScrollView(
              child:Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 80, 50, 0),
                    child: Transform.scale(
                      scale: 1.5, // The scale factor to increase the image size. 1.0 is the default size.
                      child: Image(
                        image: AssetImage('assets/wellimage.jpg'), // Replace with your own image asset path
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30,100,0,0),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Well come to a Nutrition Expert \n healthier life!',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),

SizedBox(height: 40.0),
                  ElevatedButton(onPressed: (){
                    Navigator.pushNamed(context, '/mainpages.dart');
                    print('login pressed');
                  },
                    child: Text('GOT IT!',
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
