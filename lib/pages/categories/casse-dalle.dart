import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/models/foods.dart';
import 'package:flutter_app/widgets/FoodItem.dart';
import 'package:flutter_app/widgets/global.dart';

class CasseDalle extends StatefulWidget {
  @override
  _CasseDalle createState() => _CasseDalle();
}

class _CasseDalle extends State<CasseDalle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xFF3a3737),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        brightness: Brightness.light,
        actions: <Widget>[],
      ),
      body: Container(
        color: Color(0xFFfde7d0),
        child: Stack(children: [
          Container(
            padding: EdgeInsets.only(left: 50, top: 30.0),
            height: 219,
            width: MediaQuery.of(context).size.width,
            child: Text("Casse-Dalle", style: pageTitleStyle),
          ),
          Container(
            margin: EdgeInsets.only(top: 90),

            decoration: BoxDecoration(
              color:Color(0xFFfde7d0),

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                ),
                boxShadow: [
                  new BoxShadow(
                    color: Colors.grey,
                    blurRadius: 20.0,
                  ),
                ]),

            child: ListView(
              children: [
                FoodTiles(
                  index: foods.indexOf(brochette),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
