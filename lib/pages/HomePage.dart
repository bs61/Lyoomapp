import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_app/pages/menu.dart';
import 'package:flutter_app/pages/panier.dart';

import 'package:flutter_app/widgets/BestFoodWidget.dart';
import 'package:flutter_app/widgets/Drawer.dart';
import 'package:flutter_app/widgets/appbar.dart';
import 'package:flutter_app/widgets/PopularFoodsWidget.dart';

import 'package:flutter_app/widgets/TopMenus.dart';
class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}
int _currentIndex=0;
final tabs =[
  Home(),
  Menu(),
  ShopItems(),
];
Widget CallPage(int index){
  return tabs[_currentIndex];
}
class _Home extends State<Home> {
  @override
  Widget build(BuildContext context) {

    void _onItemTapped(int index) {
      var _currentIndex = index;
      setState(() {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => tabs[_currentIndex]));
      });
    }
    return Scaffold(
        drawer:appdrawer(),
        extendBodyBehindAppBar: true,
        appBar: appbar(context),
        body:  SingleChildScrollView(

          child: Column(
            children: <Widget>[
              Container(
                height: 250.0,
                child: Carousel(
                  images: [

                    Image.asset(
                      'assets/images/Lyoom-1.jpg',
//                height: double.infinity,
//                width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/Lyoom-5.jpg',
//                height: double.infinity,
//                width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/lyoom images/IMG-20200908-WA0000.jpg',
//                height: double.infinity,
//                width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/lyoom images/IMG-20200908-WA0001.jpg',
//                height: double.infinity,
//                width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/lyoom images/IMG-20200908-WA0003.jpg',
//                height: double.infinity,
//                width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/lyoom images/IMG-20200908-WA0005.jpg',
//                height: double.infinity,
//                width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/lyoom images/IMG-20200908-WA0002.jpg',
//                height: double.infinity,
//                width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/lyoom images/IMG-20200908-WA0014.jpg',
//                height: double.infinity,
//                width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/lyoom images/IMG-20200908-WA0010.jpg',
//                height: double.infinity,
//                width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/lyoom images/IMG-20200908-WA0020.jpg',
//                height: double.infinity,
//                width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/lyoom images/IMG-20200908-WA0030.jpg',
//                height: double.infinity,
//                width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/lyoom images/IMG-20200908-WA0063.jpg',
//                height: double.infinity,
//                width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/lyoom images/IMG-20200908-WA0028.jpg',
//                height: double.infinity,
//                width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/lyoom images/IMG-20200908-WA0018.jpg',
//                height: double.infinity,
//                width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/lyoom images/IMG-20200908-WA0007.jpg',
//                height: double.infinity,
//                width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ],
                  animationDuration: Duration(seconds: 3),
                  autoplayDuration: Duration(seconds: 30),
                  animationCurve: Curves.decelerate,

                  dotSize: 0.0,
                  dotSpacing: 15.0,
                  dotColor: Colors.purple,
                  indicatorBgPadding: 5.0,
                  dotBgColor: Colors.black54.withOpacity(0),
                  borderRadius: true,
                  radius: Radius.circular(20),
                  moveIndicatorFromBottom: 180.0,
                  noRadiusForIndicator: true,
                ),
              ),
              Divider(height: 12.0, thickness: 8.0,color: Colors.orangeAccent,),
              Row(children:[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Categories:",
                    style: TextStyle(
                      fontSize: 25.0,


                    ),
                  ),
                ),
              ]),
              TopMenus(),
              PopularFoodsWidget(),
              BestFoodWidget(),
            ],
          ),
        ),
        bottomNavigationBar:  BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(
                'Home',
                style: TextStyle(color: Color(0xFF2c2b2b)),
              ),

            ),
            BottomNavigationBarItem(
              icon: InkWell(child: Icon(Icons.restaurant_menu)),
              title: Text(
                'Menu',
                style: TextStyle(color: Color(0xFF2c2b2b)),
              ),
            ),
            BottomNavigationBarItem(

              icon: Icon(Icons.shopping_cart),
              title: Text(
                'Mon Panier',
                style: TextStyle(color: Color(0xFF2c2b2b)),
              ),

            ),

          ],

          selectedItemColor: Color(0xFFfd5352),
          onTap:_onItemTapped,
        ));
  }}