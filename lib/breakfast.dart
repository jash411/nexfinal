import 'package:flutter/material.dart';

class DemoMWTabBarScreen1 extends StatefulWidget {
  static String tag = "/DemoMWTabBarScreen1";

  @override
  foodlist createState() => foodlist();
}

class foodlist extends State<DemoMWTabBarScreen1> {
  TextStyle boldTextStyle = TextStyle(fontWeight: FontWeight.bold, fontSize: 24);

  @override
  void initState() {
    super.initState();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey,
            iconTheme: IconThemeData(color: Colors.white),
            title: Text(
              'Recipes',
              style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold),
            ),
            bottom: TabBar(
              onTap: (index) {
                print(index);
              },
              indicatorColor: Colors.blue,
              labelColor: Colors.white,
              labelStyle: boldTextStyle,

              tabs: [
                Tab(
                  text: "Meat",
                ),
                Tab(
                  text: "Fruits",
                ),
                Tab(
                  text: "Protein free",
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Home',
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    ),
                    SizedBox(height: 15,),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Articles',
                      style: TextStyle(color: Colors.red, fontSize: 24),
                    ),
                    SizedBox(height: 15,),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                width: width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'User',
                      style: TextStyle(color: Colors.green, fontSize: 24),
                    ),
                    SizedBox(height: 15,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



