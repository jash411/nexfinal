import 'package:flutter/material.dart';

class rrecomend extends StatelessWidget {
  const rrecomend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(

            child: Column(
              children: <Widget>[
                Image.asset('assets/beyeaynet.jpg',),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      boxShadow:[
                        BoxShadow(
                          offset: Offset(0,10),
                          blurRadius: 50,
                        ),
                      ]
                  ),
                  child: Row(
                    children:<Widget> [
                      RichText(text: TextSpan(
                          children: [
                            TextSpan(text: 'Beyeaynet',
                                style:TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ) ),
                          ]
                      ),
                      ),
                      SizedBox(width: 190),
                      IconButton(onPressed: (){
                        print('Beyeaynet Aded');
                      }, icon: Icon(Icons.add),)
                    ],
                  ),
                ),

              ],
            ),
          ),

        ],
      ),
    );
  }
}
