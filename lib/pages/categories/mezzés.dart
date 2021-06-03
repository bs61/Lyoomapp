import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/models/foods.dart';
import 'package:flutter_app/widgets/FoodItem.dart';

import 'package:flutter_app/widgets/global.dart';

class Mezzes extends StatefulWidget {
  @override
  _Mezzes createState() => _Mezzes();
}

class _Mezzes extends State<Mezzes> {
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
            padding: EdgeInsets.only(left: 50, top: 20.0),
            height: 219,
            width: MediaQuery.of(context).size.width,
            child: Text("Brochettes & Mezzés", style: pageTitleStyle),
          ),
          Container(
            margin: EdgeInsets.only(top: 130),

            decoration: BoxDecoration(
                color: Color(0xFFfde7d0),

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
                  index: foods.indexOf(Brochette6mezze),
                ),
                FoodTiles(
                  index: foods.indexOf(Brochette4mezze),
                ),
                FoodTiles(
                  index: foods.indexOf(Brochette2mezze),
                ),
                FoodTiles(
                  index: foods.indexOf(mezzealacarte),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
