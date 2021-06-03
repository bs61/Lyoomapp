import 'package:flutter/material.dart';

import 'package:flutter_app/animation/ScaleRoute.dart';

import 'package:flutter_app/pages/FoodDetailsPage.dart';
import 'package:flutter_app/pages/menu.dart';

class PopularFoodsWidget extends StatefulWidget {
  @override
  _PopularFoodsWidgetState createState() => _PopularFoodsWidgetState();
}

class _PopularFoodsWidgetState extends State<PopularFoodsWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 265,
        width: double.infinity,
        child: Column(
          children: <Widget>[
            PopularFoodTitle(),
            Expanded(
              child: PopularFoodItems(),
            )
          ],
        ),
      ),
    );
  }
}

class PopularFoodTiles extends StatelessWidget {
  String name;
  String imageUrl;
  String rating;
  String numberOfRating;
  double price;
  String slug;

  PopularFoodTiles(
      {Key key,
      @required this.name,
      @required this.imageUrl,
      @required this.rating,
      @required this.numberOfRating,
      @required this.price,
      @required this.slug})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Hero(
          tag: imageUrl,
          child: Material(
            child: InkWell(
              onTap: () {
                Navigator.push(context, ScaleRoute(page:  DetailsPage(heroTag: imageUrl, foodName: name, foodPrice: price,)));

              },
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 0, top: 5, bottom: 0),
                    decoration: BoxDecoration(boxShadow: [
                      /* BoxShadow(
                        color: Color(0xFFfae3e2),
                        blurRadius: 15.0,
                        offset: Offset(0, 0.75),
                      ),*/
                    ]),
                    child: Card(
                        color: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                        child: Container(
                          width: 150,
                          height: 202,
                          child: Column(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      alignment: Alignment.topRight,
                                      width: double.infinity,
                                      padding: EdgeInsets.only(right: 5, top: 5),

                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child:Card(
                                      semanticContainer: true,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                      ),
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      child: ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10.0),
                                        ),
                                        child: Image.asset(
                                          'assets/images/lyoom images/' +
                                              imageUrl +
                                              ".jpg",
                                          width: 150,
                                          height: 140,
                                          fit: BoxFit.cover,
                                        ),
                                      ),

                                      elevation: 1,
                                      margin: EdgeInsets.all(1),
                                    ),
//                            Center(
//                                child: Image.asset(
//                              'assets/images/popular_foods/' +
//                                  imageUrl +
//                                  ".jpg",
//                              width: 130,
//                              height: 130,
//                            )),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    padding: EdgeInsets.only(left: 5, top: 5),
                                    child: Text(name,
                                        style: TextStyle(
                                            color: Color(0xFF6e6e71),
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                  Container(
                                    alignment: Alignment.topRight,
                                    padding: EdgeInsets.only(right: 5),
                                    child: Container(
                                      height: 20,
                                      width: 28,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white70,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0xFFfae3e2),
                                              blurRadius: 25.0,
                                              offset: Offset(0.0, 0.75),
                                            ),
                                          ]),
                                      child: Icon(
                                        Icons.near_me,
                                        color: Color(0xFFfb3132),
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        alignment: Alignment.topLeft,
                                        padding: EdgeInsets.only(left: 5, top: 5),
                                        child: Text(rating,
                                            style: TextStyle(
                                                color: Color(0xFF6e6e71),
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400)),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(top: 3, left: 5),
                                        child: Row(
                                          children: <Widget>[
                                            Icon(
                                              Icons.star,
                                              size: 10,
                                              color: Color(0xFFfb3132),
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 10,
                                              color: Color(0xFFfb3132),
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 10,
                                              color: Color(0xFFfb3132),
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 10,
                                              color: Color(0xFFfb3132),
                                            ),
                                            Icon(
                                              Icons.star,
                                              size: 10,
                                              color: Color(0xFF9b9b9c),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.topLeft,
                                        padding: EdgeInsets.only(left: 5, top: 5),
                                        child: Text("($numberOfRating)",
                                            style: TextStyle(
                                                color: Color(0xFF6e6e71),
                                                fontSize: 10,
                                                fontWeight: FontWeight.w400)),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.bottomLeft,
                                    padding: EdgeInsets.only(left: 5, top: 5, right: 5),
                                    child: Text( price.toString()+'€',
                                        style: TextStyle(
                                            color: Color(0xFF6e6e71),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600)),
                                  )
                                ],
                              )
                            ],
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
//        Container(
////          height: 10,
////          width: 10,
//          decoration: BoxDecoration(
//              shape: BoxShape.circle,
//              color: Colors.white70,
//              boxShadow: [
//                BoxShadow(
//                  color: Color(0xFFfae3e2),
//                  blurRadius: 100.0,
//                  offset: Offset(0.0, 0.0),
//                ),
//              ]),
//          child: Padding(
//            padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,200.0),
//            child: IconButton(
//              onPressed: (){},
//              icon: Icon(
//                Icons.favorite,
//                color: Color(0xFFfb3132),
//                size: 30,
//              ),
//            ),
//          ),
//        ),
      ],
    );
  }
}

class PopularFoodTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Nos Meilleurs repas",
            style: TextStyle(
                fontSize: 20,
                color: Color(0xFF3a3a3b),
                fontWeight: FontWeight.w300),
          ),
          GestureDetector(
            onTap: (){Navigator.push(context, ScaleRoute(page: Menu()));},

            child: Container(
              height:14.0 ,
              width:60.0,

                child: Text(
                  "Voir Tout",
                  style: TextStyle(
                      fontSize: 14, color: Colors.blue, fontWeight: FontWeight.w100),
                ),
              ),
          ),

        ],
      ),
    );
  }
}

class PopularFoodItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        PopularFoodTiles(
            name: 'Brochettes &\n 6 Mezzés',
            imageUrl: "brochette6mezze",
            rating: '4.9',
            numberOfRating: '200',
            price: 20.00,
            slug: "Mezzés"),
        PopularFoodTiles(
            name: "Keskrout Kefteji",
            imageUrl: "kaskroutekaftagi",
            rating: "4.9",
            numberOfRating: "100",
            price: 13.50,
            slug: ""),
        PopularFoodTiles(
            name: "Brick",
            imageUrl: "brick",
            rating: "4.0",
            numberOfRating: "50",
            price: 5.50,
            slug: ""),
        PopularFoodTiles(
            name: "Brochette",
            imageUrl: "brochette",
            rating: "4.00",
            numberOfRating: "100",
            price: 9.00,
            slug: ""),
        PopularFoodTiles(
            name: "Boisson Maison",
            imageUrl: "boissonmaison",
            rating: "4.6",
            numberOfRating: "150",
            price: 3.50,
            slug: ""),


      ],
    );
  }
}
