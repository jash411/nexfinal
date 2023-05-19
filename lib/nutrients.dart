import 'package:flutter/material.dart';

import 'nutrientlist.dart';


class nutrients extends StatefulWidget {
  const nutrients({Key? key}) : super(key: key);

  @override
  State<nutrients> createState() => _nutrientsState();
}

class _nutrientsState extends State<nutrients>
    with SingleTickerProviderStateMixin {
   late TabController _tabController;

   @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.grey[900],
          appBar: AppBar(
            title: Text('Pick up'),
            backgroundColor: Colors.grey[900],
            centerTitle: true,
            actions: <Widget>[
              IconButton(onPressed: (){},
                  icon: Icon(Icons.notifications))
            ],

          ),

          body: ListView(
            padding: EdgeInsets.only(left:20),
          children: <Widget>[
            SizedBox(height:15),
            Text('Catagories', style: TextStyle(
              fontSize: 42,
              fontFamily: 'varela',
              fontWeight: FontWeight.bold,
            ),
            ),

            SizedBox(height: 15),

            TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: Color(0xFFC88D67),
              isScrollable: true,
              labelPadding: EdgeInsets.only(right:45),
              unselectedLabelColor: Colors.grey[300],
              tabs: [

                Tab(
                  child: Text('Omnivorous', style: TextStyle(fontSize: 21),),
                ),
                Tab(
                  child: Text('Vegetarian', style: TextStyle(fontSize: 21),),
                ),
                Tab(
                  child: Text('Vegan', style: TextStyle(fontSize: 21),),
                ),

              ],

            ),
            Container(
              height: MediaQuery.of(context).size.height-10,
              width: double.infinity,

              child: TabBarView(
              controller: _tabController,
                children: [
                  nutrientlist(),
                  nutrientlist(),
                  nutrientlist(),

                ],
              ),

            )

          ],


          ),
        )
    );
  }
}
