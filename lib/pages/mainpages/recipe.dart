import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class recipe extends StatefulWidget {
  const recipe({Key? key}) : super(key: key);

  @override
  State<recipe> createState() => _recipeState();
}

class _recipeState extends State<recipe> {
late String kitfo;
late String dorowot;
late String gomen;

bool isLoading=true;

final storage =FirebaseStorage.instance;
@override
void initState(){
  kitfo="";
  dorowot="";
  gomen="";

  getimgurl();
}

Future<void> getimgurl() async {
final refkitfo=storage.ref().child('kitfo.jpg');
final refdoro=storage.ref().child('2.dorowot.jpg');
final refgomen=storage.ref().child('3gomen.jpg');

final urlkitfo= await refkitfo.getDownloadURL();
final urldoro= await refdoro.getDownloadURL();
final urlgomen= await refgomen.getDownloadURL();

setState((){
kitfo=urlkitfo;
dorowot=urldoro;
gomen=urlgomen;

isLoading=false;
});

}


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
                      SizedBox(height: 15,),
//______________________________________________________________________________
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: isLoading
                            ? CircularProgressIndicator()
                            : Row(
                          children: [
//፟________________________________________one image from fire base Gomen___________________________
                            Card(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black, width: 0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [

                                    Image(
                                      image: NetworkImage(gomen,scale: 1.0),
                                      height: 125,
                                      width: 200,
                                      fit: BoxFit.cover,
                                    ),
                                       Align(
                                           alignment: Alignment.topLeft,
                                           child: Text(
                                            'Gomen(ጎመን)',
                                            style: TextStyle(
                                              fontSize: 19,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                         ),

                                    Row(
                                      children: [
                                        Text('1/2 cup', style: TextStyle(
                                          fontSize: 15,
                                        ),),
                                        SizedBox(width: 22),
                                        Text('216cal', style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                        IconButton(
                                          onPressed: () {
                                            // Handle button press
                                            print('Gomen selected');
                                          },
                                          icon: Icon(
                                            Icons.add_box_outlined,
                                            size: 20,
                                            color: Colors.blue,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),

                              ),
                            ),




//፟________________________________________one image from fire base Doro___________________________
                            Card(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black, width: 0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 10),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [

                                    Image(
                                      image: NetworkImage(dorowot,scale: 1.0),
                                      height: 125,
                                      width: 200,
                                      fit: BoxFit.cover,
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'DoroWot(ዶሮ ወጥ)',
                                        style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),

                                    Row(
                                      children: [
                                        Text('1 cup', style: TextStyle(
                                          fontSize: 15,
                                        ),),
                                        SizedBox(width: 22),
                                        Text('164cal', style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                        IconButton(
                                          onPressed: () {
                                            // Handle button press
                                            print('Doro selected');
                                          },
                                          icon: Icon(
                                            Icons.add_box_outlined,
                                            size: 20,
                                            color: Colors.blue,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),

                              ),
                            ),
//፟________________________________________one image from fire base kitfo___________________________
                            Card(
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.black, width: 0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  children: [

                                    Image(
                                      image: NetworkImage(kitfo,scale: 1.0),
                                      height: 135,
                                      width: 200,
                                      fit: BoxFit.cover,
                                    ),
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'Kitfo(ክትፎ)',
                                        style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),

                                    Row(
                                      children: [
                                        Text('1 cup', style: TextStyle(
                                          fontSize: 15,
                                        ),),
                                        SizedBox(width: 22),
                                        Text('127cal', style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),),
                                        IconButton(
                                          onPressed: () {
                                            // Handle button press
                                            print('Kitfo selected');
                                          },
                                          icon: Icon(
                                            Icons.add_box_outlined,
                                            size: 20,
                                            color: Colors.blue,
                                          ),
                                        )


                                      ],
                                    ),
                                  ],
                                ),

                              ),
                            ),

                          ],
                        ),
                      )
                    ],



                  ),
                ),


              ),
            ),



      );

  }
}





































//this code was a code for listing types of foods listview



// List<rlist>recipelists=[
//
//   const rlist(
//       Title: "Gomen",
//       subtitle: 'Energy=150kcal  fat=0  protein=25g',
//       // Image: Image,
//       Body: 'ጎመን በሃገራችን እጅግ ተወዳጅ ምግብ ነው'
//   ),
//
//   const rlist(
//       Title: "Karot",
//       subtitle: 'Energy=150kcal  fat=0  protein=25g',
//       // Image: Image,
//       Body: 'ጎመን በሃገራችን እጅግ ተወዳጅ ምግብ ነው'
//   ),
//   const rlist(
//       Title: "Gomen",
//       subtitle: 'Energy=150kcal  fat=0  protein=25g',
//       // Image: Image,
//       Body: 'ጎመን በሃገራችን እጅግ ተወዳጅ ምግብ ነው'
//   ),
//
//   const rlist(
//       Title: "Karot",
//       subtitle: 'Energy=150kcal  fat=0  protein=25g',
//       // Image: Image,
//       Body: 'ጎመን በሃገራችን እጅግ ተወዳጅ ምግብ ነው'
//   ),
//   const rlist(
//       Title: "Gomen",
//       subtitle: 'Energy=150kcal  fat=0  protein=25g',
//       // Image: Image,
//       Body: 'ጎመን በሃገራችን እጅግ ተወዳጅ ምግብ ነው'
//   ),
//
//   const rlist(
//       Title: "Karot",
//       subtitle: 'Energy=150kcal  fat=0  protein=25g',
//       // Image: Image,
//       Body: 'ጎመን በሃገራችን እጅግ ተወዳጅ ምግብ ነው'
//   ),
//   const rlist(
//       Title: "Gomen",
//       subtitle: 'Energy=150kcal  fat=0  protein=25g',
//       // Image: Image,
//       Body: 'ጎመን በሃገራችን እጅግ ተወዳጅ ምግብ ነው'
//   ),
//
//   const rlist(
//       Title: "Karot",
//       subtitle: 'Energy=150kcal  fat=0  protein=25g',
//       // Image: Image,
//       Body: 'ጎመን በሃገራችን እጅግ ተወዳጅ ምግብ ነው'
//   ),
//
//
//
// ];
//
// class rlist{
//   final String Title;
//   final String subtitle;
//   // final String Image;
//   final String Body;
//
//   const rlist
//       ({
//     required this.Title,
//     required this.subtitle,
//     // required this.Image,
//     required this.Body,
//
//   });
// }
//
//

// Column(
//                            children: [
//                              Container(
//                                // color: Colors.orange,
//                                height: 320,
//                                child: ListView.builder(
//                                  // padding: EdgeInsets.only(),
//                                  // scrollDirection: Axis.horizontal,
//                                       shrinkWrap: true,
//                                         // physics: NeverScrollableScrollPhysics(),
//                                         itemCount: recipelists.length,
//                                         itemBuilder: (context, index) {
//                                           final recipe = recipelists[index];
//                                           return Column(
//                                             children: [
//
//                                               Card(
//                                                 elevation: 4, // Controls the shadow depth
//                                                 shape: RoundedRectangleBorder(
//                                                   borderRadius: BorderRadius.circular(10), // Sets the border radius
//                                                   side: BorderSide(color: Colors.black, width: 1), // Adds a border
//                                                 ),
//                                                 color: Colors.orange[100],
// // color: Colors.white10,
//                                                 child: ListTile(
//                                                   // leading: CircleAvatar(radius: 25,
//                                                   //   backgroundImage: AssetImage(user.Image),
//                                                   // ),
//                                                   title: Text(recipe.Title),
//                                                   subtitle: Text(recipe.subtitle),
//                                                   trailing: const Icon(Icons.forward),
//                                                   onTap: () {
//                                                     Navigator.of(context).push(
//                                                         MaterialPageRoute(builder: (context) =>
//                                                             recipelist(recipe: recipe),
//                                                         ));
//                                                   },
//                                                 ),
//
//                                               ),
//                                             ],
//                                           );
//                                         }
//                                     ),
//                              ),
//                            ],
//                          ),
//






//this was manual code for horizonatal scrolling

// Container(
// // decoration: BoxDecoration(
// //   color: Colors.white,
// // ),
//
// child: SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: Row(
// children: <Widget>[
// Column(
// children: <Widget>[
//
// GestureDetector(
// onTap:(){
// print('beyeaynet aded by image');
// },
// child: Image.asset('assets/beyeaynet.jpg',
// fit: BoxFit.fill,
// height: 200,
// width: 201,
//
// ),
// ),
// // CircleAvatar(
// //   backgroundImage: AssetImage('assets/beyeaynet.jpg'),
// // ),
// Container(
// height:50,
// width:200,
// padding: EdgeInsets.all(8),
// decoration: BoxDecoration(color: Colors.white,
// borderRadius: BorderRadius.only(
// bottomLeft: Radius.circular(10),
// bottomRight: Radius.circular(10),
// ),
// boxShadow:[
// BoxShadow(
// offset: Offset(0,10),
// blurRadius: 0,
// ),
// ]
// ),
// child: Row(
// children:<Widget> [
// RichText(text: TextSpan(
// children: [
// TextSpan(text: 'Beyeaynet',
// style:TextStyle(
// fontSize: 20,
// color: Colors.black,
// ) ),
// ]
// ),
// ),
// SizedBox(width: 40),
// IconButton(onPressed: (){
// print('Beyeaynet Aded');
// }, icon: Icon(Icons.add_box_outlined),)
// ],
// ),
// ),
//
// ],
// ),
// //------------------------------------------------------------------------
// SizedBox(width: 10),
// Column(
// children: <Widget>[
// Image.asset('assets/dinich.jpg',
// fit: BoxFit.fill,
// height: 200,
// width: 200,
//
// ),
// // CircleAvatar(
// //   backgroundImage: AssetImage('assets/beyeaynet.jpg'),
// // ),
// Container(
// height:50,
// width:200,
// padding: EdgeInsets.all(8),
// decoration: BoxDecoration(color: Colors.white,
// borderRadius: BorderRadius.only(
// bottomLeft: Radius.circular(10),
// bottomRight: Radius.circular(10),
// ),
// boxShadow:[
// BoxShadow(
// offset: Offset(0,10),
// blurRadius: 50,
// ),
// ]
// ),
// child: Row(
// children:<Widget> [
// RichText(text: TextSpan(
// children: [
// TextSpan(text: 'Dinich Wot',
// style:TextStyle(
// fontSize: 20,
// color: Colors.black,
// ) ),
// ]
// ),
// ),
// SizedBox(width: 40),
// IconButton(onPressed: (){
// print('Dinich Aded');
// }, icon: Icon(Icons.add_box_outlined),)
// ],
// ),
// ),
//
// ],
// ),
// //-------------------------------------------------------------------------------------------
// SizedBox(width: 10),
// Column(
// children: <Widget>[
// Image.asset('assets/kik.jpg',
// fit: BoxFit.fill,
// height: 200,
// width: 200,
//
// ),
// // CircleAvatar(
// //   backgroundImage: AssetImage('assets/beyeaynet.jpg'),
// // ),
// Container(
// height:50,
// width:200,
// padding: EdgeInsets.all(8),
// decoration: BoxDecoration(color: Colors.white,
// // border: Border.all(color: Colors.red,width: 1),
// borderRadius: BorderRadius.only(
// bottomLeft: Radius.circular(10),
// bottomRight: Radius.circular(10),
// ),
// boxShadow:[
// BoxShadow(
// offset: Offset(0,10),
// blurRadius: 50,
// ),
// ]
//
// ),
// child: Row(
// children:<Widget> [
// RichText(text: TextSpan(
// children: [
// TextSpan(text: 'Kik Wot',
// style:TextStyle(
// fontSize: 20,
// color: Colors.black,
// ) ),
// ]
// ),
// ),
// SizedBox(width: 65),
// IconButton(onPressed: (){
// print('Kik Aded');
// }, icon: Icon(Icons.add_box_outlined),)
// ],
// ),
// ),
//
// ],
// ),
//
// //-------------------------------------------------------------------------------------------
// ],
// ),
// ),
// ),