import 'package:flutter/material.dart';

class dietinginfo extends StatefulWidget {
  const dietinginfo({Key? key}) : super(key: key);

  @override
  State<dietinginfo> createState() => _dietinginfoState();
}

class _dietinginfoState extends State<dietinginfo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SingleChildScrollView(
          child: Padding(
            padding:EdgeInsets.fromLTRB(20.0,200,20,0),
            child:Column(
              children: <Widget>[
                Text('What type of Dieting \nwill you follow?',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),),

                SizedBox(height: 9.0),
                Text('we will adapt our recomendations based on \nyour preferences.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40.0),
                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, '/wellcomepage.dart');
                  print('login pressed');
                },
                  child: Text('Classic(no dietry preferences)',
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
                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, '/wellcomepage.dart');
                  print('login pressed');
                },
                  child: Text('Vegetarian(i dont eat meat)',
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
                ElevatedButton(onPressed: (){
                  Navigator.pushNamed(context, '/wellcomepage.dart');
                  print('login pressed');
                },
                  child: Text("vegan(i donn't eat any animal product)",
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
