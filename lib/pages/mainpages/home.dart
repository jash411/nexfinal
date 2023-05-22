import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nexfinal/nutrientlist.dart';
import 'package:nexfinal/pages/current_and_goalweight_info.dart';
import 'package:nexfinal/pages/info_activity.dart';
import 'package:nexfinal/pages/start.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../breakfast.dart';
import '../../nutrients.dart';
import '../info_n_s_age.dart';


enum _Menuvalues{
  share,
  logout,
}
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime? currentBackPressTime;

  Future<bool> _onBackPressed(BuildContext context) async {
    if (currentBackPressTime == null ||
        DateTime.now().difference(currentBackPressTime!) > Duration(seconds: 2)) {
      // Show a toast or snackbar indicating to press again to exit
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Press back again to exit')),
      );

      currentBackPressTime = DateTime.now();
      return false;
    }

    return true;
  }
  @override

  Widget build(BuildContext context) {

    return  MaterialApp(
      debugShowCheckedModeBanner: false,

      home: WillPopScope(
        onWillPop: () => _onBackPressed(context),
        child: Scaffold(
          backgroundColor: Colors.grey[900],
          appBar: AppBar(
            title: Text('Nutrition Expert'),
            backgroundColor: Colors.grey[900],
            centerTitle: true,
            actions: [
              PopupMenuButton<_Menuvalues>(itemBuilder: (BuildContext context)=>[
                PopupMenuItem(child:Row(
                  children: [
                    Icon(Icons.share,color: Colors.blue),
                    Text('share')
                  ],
                ),value:_Menuvalues.share),
                PopupMenuItem(child:Row(
                  children: [
                    Icon(Icons.logout,color: Colors.blue),
                    Text('  Log out')
                  ],
                ),value: _Menuvalues.logout),
              ],
                  onSelected: (value){
                    switch (value){
                      case _Menuvalues.share:
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>nutrientlist(),
                      ),
                      );
                        break;
                      case _Menuvalues.logout:
                        FirebaseAuth.instance.signOut();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => startpage()),
                        );
                        break;



                    }
                  }
              )
            ],
          ),


          body: SingleChildScrollView(
            child: Center(
              child: Column(
                children:<Widget> [
                  Buttons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(

      child:Column(

        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          SizedBox(height: 20),
          Align(
            alignment: Alignment(-.9,0),
            child: Text('Summary',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),

          SizedBox(height: 15),
          //summarty container will start from this

            Column(
              children: [
                CircularPercentIndicator(
                  animation: true,
                  animationDuration: 3000,
                  radius: 65,
                  lineWidth: 11,
                  percent: 0.5,
                  backgroundColor: Colors.deepPurpleAccent,
                  circularStrokeCap: CircularStrokeCap.round,
                  center: Column(
                    children: [
                      SizedBox(height: 40),
                      Text('${Energy.toStringAsFixed(0)} ',
                          style: const TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      Text('Calories', style:TextStyle(
                          fontSize: 17,
                        color: Colors.white
                      ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Text('Remaining', style:TextStyle(
                    fontSize: 17,
                    color: Colors.white
                ),)
              ],
            ),


//summary container will End in this


//Nutrinet part will start on this
          Align(
            alignment: Alignment(-.9,0),
            child: Text('Nutrients',textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                height: 5,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),


          //Activites of the ***first Row*** will start from this
          Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DemoMWTabBarScreen1()),
                  );
                },
                icon: Icon(Icons.add_box_outlined),
                label: Text('Break Fast '),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(10,100),

                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>
                  nutrients()
                  ),
                  );
                  print('lunch pressed');
                },
                icon:Icon(Icons.add_box_outlined),
                label: Text('Lunch      ', textAlign: TextAlign.center),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(10, 100),
                ),
              ),
            ],
          ),
          //Second Row or Activities
          Container(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon:Icon(Icons.add_box_outlined),
                label: Text(' Dinner      ',
                  textAlign: TextAlign.center,),

                style: ElevatedButton.styleFrom(
                  minimumSize: Size(10,100),
                ),
              ),


              ElevatedButton.icon(
                onPressed: () {
                  print('snack chossed');

                },
                icon: Icon(Icons.add_box_outlined),
                label:Text(' Snack     ', textAlign: TextAlign.center,),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(10,100),
                ),
              ),
            ],
          ),
//second Row will End in this
          Align(
            alignment: Alignment(-.9,0),
            child: Text('Activities',textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                height: 7,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: Icon(Icons.add_box_outlined),
                label: Text('Add'),
              ),
            ],
          ),
        ],
      ),
//----------------------------------------------------------------------------------------------------------------------------------------
    );
  }
}


