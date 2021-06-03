
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/pages/Infos.dart';
import 'package:flutter_app/pages/SignInPage.dart';
import 'package:flutter_app/pages/menu.dart';
import 'package:flutter_app/pages/panier.dart';
import 'package:flutter_app/pages/HomePage.dart';

import 'package:flutter_app/animation/ScaleRoute.dart';

import 'package:flutter_app/services/auth.dart';

import 'global.dart';

class appdrawer extends StatefulWidget {
  @override
  _appdrawerState createState() => _appdrawerState();
}

class _appdrawerState extends State<appdrawer> {
  final _auth = Auth();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFfde7d0),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Container(
                // child: Image.asset(
                //   'assets/images/lyoom.png',
                //   fit: BoxFit.cover,
                // ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/lyoom.png'),
                  fit: BoxFit.cover,
                )),
                //
              ),

            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context, ScaleRoute(page: Home()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.home,
                  color: Colors.deepOrangeAccent,
                ),
                title: Text('Acceuil'),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context, ScaleRoute(page: Menu()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.restaurant_menu,
                  color: Colors.deepOrangeAccent,
                ),
                title: Text('Menu'),
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.push(context, ScaleRoute(page: ShopItems()));
              },
              child: ListTile(
                leading: Icon(
                  Icons.shopping_cart,
                  color: Colors.deepOrangeAccent,
                ),
                title: Text('Panier'),
              ),
            ),
            FlatButton(
              onPressed: () { Navigator.push(context, ScaleRoute(page: Infos()));},
              child: ListTile(
                leading: Icon(
                  Icons.info_outline,
                  color: Colors.deepOrangeAccent,
                ),
                title: Text('Savoir sur Nous'),
              ),
            ),
            SizedBox(
              height: 100.0,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: FlatButton(
                onPressed: () async {
                    await _auth.signOut();
                    Navigator.push(context, ScaleRoute(page: SignInPage()));
                    setState(() {});

                },
                child: ListTile(
                  leading: Icon(
                    Icons.power_settings_new,
                    color: Colors.deepOrangeAccent,
                  ),
                  title: Text('Se Deconnecter'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
