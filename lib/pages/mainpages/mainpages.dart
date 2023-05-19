import 'package:flutter/material.dart';
import 'package:nexfinal/pages/mainpages/profile.dart';
import 'package:nexfinal/pages/mainpages/recipe.dart';

import 'feedback.dart';
import 'home.dart';


class mainpages extends StatefulWidget {
  const mainpages({Key? key}) : super(key: key);

  @override
  State<mainpages> createState() => _mainpagesState();
}

class _mainpagesState extends State<mainpages> {
List pages=[
  HomeScreen(),
  recipe(),
  profile(),
  feedback(),

];
int currentIndex=0;
void onTap(int index){
setState(() {
  currentIndex=index;
});
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
home: Scaffold(
  body: pages[currentIndex],
  bottomNavigationBar: BottomNavigationBar(
    onTap: onTap,
    currentIndex: currentIndex,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.white,
    unselectedItemColor: Colors.white70,
    // showSelectedLabels: false,
    showUnselectedLabels: false,
    elevation: 0,
    backgroundColor: Colors.grey[900],
    items: [
      BottomNavigationBarItem(label:('Home') ,icon: Icon(Icons.home)),
      BottomNavigationBarItem(label:('Recipes') ,icon: Icon(Icons.fastfood_rounded)),
      BottomNavigationBarItem(label:('profile') ,icon: Icon(Icons.person)),
      BottomNavigationBarItem(label:('Feedback') ,icon: Icon(Icons.feedback)),
    ],

  ),
),
    );
  }
}
