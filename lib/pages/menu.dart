


import 'package:flutter_app/models/foods.dart';

import 'package:flutter_app/pages/panier.dart';
import 'package:flutter_app/pages/HomePage.dart';
import 'package:flutter/material.dart';


import 'package:flutter_app/widgets/Drawer.dart';
import 'package:flutter_app/animation/ScaleRoute.dart';

import 'FoodDetailsPage.dart';
class Menu extends StatefulWidget {
  @override
  _Menu createState() => _Menu();
}

int _currentIndex = 1;
final tabs = [Home(), Menu(), ShopItems(),];


class _Menu extends State<Menu> {
  void _onItemTapped(int index) {
    var _currentIndex = index;
    setState(() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => tabs[_currentIndex]),
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: appdrawer(),
      backgroundColor: Color(0xFFfde7d0),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: (){
                    Navigator.push(context, ScaleRoute(page: Home(),
                    ));
                  },

                ),
                Container(
                    width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.menu),
                          color: Colors.white, onPressed: () {  },

                        ),

                      ],
                    ))
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Menu',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0)),
                SizedBox(width: 10.0),

              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: Container(
                        height: MediaQuery.of(context).size.height - 300.0,
                        child: ListView.builder(
                          itemCount: foods.length,
                            itemBuilder: (context,index){
                          return _buildFoodItem(foods[index].pLocation, foods[index].pName, foods[index].pPrice,foods[index].pCategory);
                        }

                        ))),

              ],
            ),
          )
        ],
      ),
        bottomNavigationBar: BottomNavigationBar(
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
            onTap: _onItemTapped)
    );
  }

  Widget _buildFoodItem(String imgPath, String foodName, double price,String category) {
    return Padding(
        padding: EdgeInsets.only(left: 10.0, right: 0.0, top: 10.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DetailsPage(heroTag: imgPath, foodName: foodName, foodPrice: price,category:category,)
              ));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                    child: Row(
                        children: [
                          Hero(
                              tag: imgPath,
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all( Radius.circular(100.0)),
                                      image: DecorationImage(
                                          image: AssetImage('assets/images/lyoom images/'+imgPath+".jpg"),
                                          fit: BoxFit.cover)),
                                  height: 100.0,
                                  width: 100.0)),

                          SizedBox(width: 10.0),
                          Wrap(
                            children:[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:[
                                  SizedBox(
                                    child: Text(
                                        foodName,
                                        style: TextStyle(
                                            fontFamily: 'Montserrat',
                                            fontSize: 13.50,
                                            fontWeight: FontWeight.bold
                                        )
                                    ),
                                  ),
                                  Text(
                                      '$price €',
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 11.0,
                                          color: Colors.grey
                                      )
                                  ),
                                  Text(
                                      category,
                                      style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 12.0,
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold
                                      )
                                  )
                                ]
                            )],
                          )
                        ]
                    )
                ),



              ],
            )
        ));
  }
}