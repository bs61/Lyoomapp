import 'package:flutter/material.dart';
import 'package:flutter_app/pages/categories/casse-dalle.dart';
import 'package:flutter_app/pages/categories/dessert.dart';
import 'package:flutter_app/pages/categories/formulemidi.dart';
import 'package:flutter_app/pages/categories/mezzés.dart';
import 'package:flutter_app/pages/categories/softs.dart';
import 'package:flutter_app/animation/ScaleRoute.dart';



class TopMenus extends StatefulWidget {
  @override
  _TopMenusState createState() => _TopMenusState();
}

class _TopMenusState extends State<TopMenus> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          TopMenuTiles(name: "Cool Tounsi", imageUrl: "kemiatunisienne", slug: "",route: FormuleMidi(),),
          TopMenuTiles(name: "Brochettes & mezzés", imageUrl: "brochette2mezze", slug: "",route: Mezzes(),),
          TopMenuTiles(name: "Casse-Dalle", imageUrl: "brochette", slug: "",route: CasseDalle(),),
          TopMenuTiles(name: "Dessert", imageUrl: "baklawa", slug: "",route: Dessert(),),
          TopMenuTiles(name: "Boissons", imageUrl: "boissonmaison", slug: "",route: Softs(),),

        ],
      ),
    );
  }
}

class TopMenuTiles extends StatelessWidget {
  String name;
  String imageUrl;
  String slug;
  Widget route;

  TopMenuTiles(
      {Key key,
      @required this.name,
      @required this.imageUrl,
      @required this.slug,
      @required this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only( top: 5, bottom: 5),
//            decoration: new BoxDecoration(boxShadow: [
//              new BoxShadow(
//                color: Color(0xFFfae3e2),
//                blurRadius: 25.0,
//                offset: Offset(0.0, 0.75),
//              ),
//            ]),

                child: FlatButton(
                  color: Colors.transparent,
                  onPressed: (){Navigator.push(context, ScaleRoute(page: route));},
                  child: Container(

                    width: 110,
                    height: 74,
                    child: ClipRRect(

                        child: Image.asset(
                      'assets/images/lyoom images/' + imageUrl + ".jpg",
                          fit: BoxFit.cover,
                    ),
                        borderRadius: BorderRadius.circular(10.0)),
                  ),
                )),

          Text(name,
              style: TextStyle(
                  color: Color(0xFF6e6e71),
                  fontSize: 14,
                  fontWeight: FontWeight.w400)),
        ],
      ),
    );
  }
}
