import 'package:flutter/material.dart';

class nutrientlist extends StatelessWidget {
  const nutrientlist({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: ListView(
        children:<Widget> [
          SizedBox(height: 15.0),
          Container(
            padding: EdgeInsets.only(left:15.0),
            width: MediaQuery.of(context).size.width -30.0,
            height: MediaQuery.of(context).size.width -50.0,
            child: GridView.count
              (
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 10.0,
              children: <Widget>[
                _buildCard('Gomen','vegetable','assets/kik.jpg',false,false, context),
                _buildCard('kik','vegetable','assets/kik.jpg',false,false, context),
                _buildCard('misr','vegetable','assets/kik.jpg',false,false, context),
                _buildCard('timatime','vegetable','assets/kik.jpg',false,false, context),

              ],
            ),


          )

        ],
      ),

    );
  }

  Widget _buildCard(String name, String type, String imgPath, bool added, bool isFavorite, context){
    return Padding(
      padding: EdgeInsets.only(top: 15.0, bottom: 5.0, right: 5.0, left: 5.0),
      child: InkWell(
        onTap: (){},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 5.0,
                blurRadius: 5.0,
              )
            ],
            color: Colors.white,
          ),

        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  isFavorite ? Icon(Icons.favorite, color: Colors.white):
                      Icon(Icons.add, color: Colors.white,)
                ],
              ),
            ),
            Text('jash')
          ],
        ),
        ),
      ),

    );
  }
}

