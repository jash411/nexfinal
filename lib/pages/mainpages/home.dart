import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nexfinal/pages/start.dart';

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
  @override

  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Filter(),
                    ),
                    );
                      break;
                    case _Menuvalues.logout:
                      FirebaseAuth.instance.signOut();
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => info1()),
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
          Container(
            height: 170,
            width: 370,
            // padding: EdgeInsets.symmetric(vertical: 30,horizontal: 70),
            color: Colors.blueGrey,

            child:Align(
              alignment: Alignment(-.6, .7),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('Eaten'),
                  Text('Remaining'),
                  Text('Losed')
                ],
              ),
            ),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Filter()),
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


