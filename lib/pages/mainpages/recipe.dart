import 'package:flutter/material.dart';
import 'recipelist.dart';



class recipe extends StatefulWidget {
  const recipe({Key? key}) : super(key: key);

  @override
  State<recipe> createState() => _recipeState();
}
List<rlist>recipelists=[

  const rlist(
      Title: "Gomen",
      subtitle: 'Energy=150kcal  fat=0  protein=25g',
      // Image: Image,
      Body: 'ጎመን በሃገራችን እጅግ ተወዳጅ ምግብ ነው'
  ),

  const rlist(
      Title: "Karot",
      subtitle: 'Energy=150kcal  fat=0  protein=25g',
      // Image: Image,
      Body: 'ጎመን በሃገራችን እጅግ ተወዳጅ ምግብ ነው'
  ),
  const rlist(
      Title: "Gomen",
      subtitle: 'Energy=150kcal  fat=0  protein=25g',
      // Image: Image,
      Body: 'ጎመን በሃገራችን እጅግ ተወዳጅ ምግብ ነው'
  ),

  const rlist(
      Title: "Karot",
      subtitle: 'Energy=150kcal  fat=0  protein=25g',
      // Image: Image,
      Body: 'ጎመን በሃገራችን እጅግ ተወዳጅ ምግብ ነው'
  ),
  const rlist(
      Title: "Gomen",
      subtitle: 'Energy=150kcal  fat=0  protein=25g',
      // Image: Image,
      Body: 'ጎመን በሃገራችን እጅግ ተወዳጅ ምግብ ነው'
  ),

  const rlist(
      Title: "Karot",
      subtitle: 'Energy=150kcal  fat=0  protein=25g',
      // Image: Image,
      Body: 'ጎመን በሃገራችን እጅግ ተወዳጅ ምግብ ነው'
  ),
  const rlist(
      Title: "Gomen",
      subtitle: 'Energy=150kcal  fat=0  protein=25g',
      // Image: Image,
      Body: 'ጎመን በሃገራችን እጅግ ተወዳጅ ምግብ ነው'
  ),

  const rlist(
      Title: "Karot",
      subtitle: 'Energy=150kcal  fat=0  protein=25g',
      // Image: Image,
      Body: 'ጎመን በሃገራችን እጅግ ተወዳጅ ምግብ ነው'
  ),



];

class rlist{
  final String Title;
  final String subtitle;
  // final String Image;
  final String Body;

  const rlist
      ({
        required this.Title,
        required this.subtitle,
        // required this.Image,
        required this.Body,

      });
}


class _recipeState extends State<recipe> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            backgroundColor: Colors.grey[900],
            appBar: AppBar(
              title: Center(child: Text('Foods',
                style: TextStyle(
                  // fontSize: 10,
                ),
              )),
              backgroundColor: Colors.grey[900],
            ),
            body: Padding(
                padding: EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[

                      Row(
                        children: [
                          Align(
                            alignment: Alignment(-.9,0),
                            child: Text('Recomended',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 170),
                          ElevatedButton(onPressed: (){}, child: Text('More')),
                        ],
                      ),

                       Container(
                         // decoration: BoxDecoration(
                         //   color: Colors.white,
                         // ),

                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: <Widget>[
                                Column(
                                  children: <Widget>[

                                    GestureDetector(
                                    onTap:(){
                                      print('beyeaynet aded by image');
                                    },
                                      child: Image.asset('assets/beyeaynet.jpg',
                                      fit: BoxFit.fill,
                                        height: 200,
                                        width: 201,

                                      ),
                                    ),
                                    // CircleAvatar(
                                    //   backgroundImage: AssetImage('assets/beyeaynet.jpg'),
                                    // ),
                                    Container(
                                      height:50,
                                      width:200,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(10),
                                            bottomRight: Radius.circular(10),
                                          ),
                                          boxShadow:[
                                            BoxShadow(
                                              offset: Offset(0,10),
                                              blurRadius: 0,
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
                                          SizedBox(width: 40),
                                          IconButton(onPressed: (){
                                            print('Beyeaynet Aded');
                                          }, icon: Icon(Icons.add_box_outlined),)
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
  //------------------------------------------------------------------------
SizedBox(width: 10),
                                Column(
                                  children: <Widget>[
                                    Image.asset('assets/dinich.jpg',
                                      fit: BoxFit.fill,
                                      height: 200,
                                      width: 200,

                                    ),
                                    // CircleAvatar(
                                    //   backgroundImage: AssetImage('assets/beyeaynet.jpg'),
                                    // ),
                                    Container(
                                      height:50,
                                      width:200,
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
                                                TextSpan(text: 'Dinich Wot',
                                                    style:TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                    ) ),
                                              ]
                                          ),
                                          ),
                                          SizedBox(width: 40),
                                          IconButton(onPressed: (){
                                            print('Dinich Aded');
                                          }, icon: Icon(Icons.add_box_outlined),)
                                        ],
                                      ),
                                    ),

                                  ],
                                ),
//-------------------------------------------------------------------------------------------
                                SizedBox(width: 10),
                                Column(
                                  children: <Widget>[
                                    Image.asset('assets/kik.jpg',
                                      fit: BoxFit.fill,
                                      height: 200,
                                      width: 200,

                                    ),
                                    // CircleAvatar(
                                    //   backgroundImage: AssetImage('assets/beyeaynet.jpg'),
                                    // ),
                                    Container(
                                      height:50,
                                      width:200,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(color: Colors.white,
                                          // border: Border.all(color: Colors.red,width: 1),
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
                                                TextSpan(text: 'Kik Wot',
                                                    style:TextStyle(
                                                      fontSize: 20,
                                                      color: Colors.black,
                                                    ) ),
                                              ]
                                          ),
                                          ),
                                          SizedBox(width: 65),
                                          IconButton(onPressed: (){
                                            print('Kik Aded');
                                          }, icon: Icon(Icons.add_box_outlined),)
                                        ],
                                      ),
                                    ),

                                  ],
                                ),

//-------------------------------------------------------------------------------------------
                              ],
                            ),
                          ),
                        ),


                      SizedBox(height: 15,),
                      Row(
                        children: [
                          Align(
                            alignment: Alignment(-.9,0),
                            child: Text('List of Ethiopian Foods',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          )
                          ]
                      ),
                      SizedBox(height: 15,),

                      Column(
                           children: [
                             Container(
                               // color: Colors.orange,
                               height: 320,
                               child: ListView.builder(
                                 // padding: EdgeInsets.only(),
                                 // scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                        // physics: NeverScrollableScrollPhysics(),
                                        itemCount: recipelists.length,
                                        itemBuilder: (context, index) {
                                          final recipe = recipelists[index];
                                          return Column(
                                            children: [

                                              Card(
                                                elevation: 4, // Controls the shadow depth
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10), // Sets the border radius
                                                  side: BorderSide(color: Colors.black, width: 1), // Adds a border
                                                ),
                                                color: Colors.orange[100],
// color: Colors.white10,
                                                child: ListTile(
                                                  // leading: CircleAvatar(radius: 25,
                                                  //   backgroundImage: AssetImage(user.Image),
                                                  // ),
                                                  title: Text(recipe.Title),
                                                  subtitle: Text(recipe.subtitle),
                                                  trailing: const Icon(Icons.forward),
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(builder: (context) =>
                                                            recipelist(recipe: recipe),
                                                        ));
                                                  },
                                                ),

                                              ),
                                            ],
                                          );
                                        }
                                    ),
                             ),
                           ],
                         ),

                      



                    ],
                  ),
                ),


              ),
            ),



      );

  }
}





