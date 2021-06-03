import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/animation/ScaleRoute.dart';
import 'package:flutter_app/pages/panier.dart';



  Widget appbar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      /*title: Text(
       "bonjour  les lyoomistes ",
       style: TextStyle(
          color: Color(0xFF3a3737),
          fontSize: 16,
          fontWeight: FontWeight.w500),
        textAlign: TextAlign.center,
     ),
     brightness: Brightness.light,*/
        actions: <Widget>[
      // IconButton(
      //  icon: Icon(
      //  Icons.notifications_none,
      //  color: Colors.orangeAccent,
      //  ),
      //   onPressed: () {Navigator.push(context, ScaleRoute(page: SignInPage()));}),
       IconButton(
          icon: Icon(
         Icons.shopping_cart,
         color: Colors.orangeAccent,
        ),

          onPressed: () {Navigator.push(context, ScaleRoute(page: ShopItems()));})
        ],
        iconTheme: IconThemeData(color: Colors.orangeAccent),
     );}