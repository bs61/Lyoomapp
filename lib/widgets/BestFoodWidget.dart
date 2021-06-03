import 'package:flutter/material.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class BestFoodWidget extends StatefulWidget {
  @override
  _BestFoodWidgetState createState() => _BestFoodWidgetState();
}

class _BestFoodWidgetState extends State<BestFoodWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: double.infinity,
      child: Column(
        children: <Widget>[
          BestFoodTitle(),
          Expanded(
            child: BestFoodList(),
          )
        ],
      ),
    );
  }
}

class BestFoodTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:80.0),
      child: Row(

          children: <Widget>[
            Icon(FontAwesomeIcons.instagram),
            GradientText(
              " Instagram",
              gradient: LinearGradient(
                  colors: [Color.fromRGBO(254,218,117,1), Color.fromRGBO(250,126,30,1),Color.fromRGBO(214,41,118,1),Color.fromRGBO(150,47,191,1),Color.fromRGBO(79,91,213,1),],
                begin: Alignment.topLeft,
                end: Alignment(0.8, 0.0),),
              style: TextStyle(
                  fontSize: 30,
                  color: Color(0xFF3a3a3b),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
    );

  }
}

class BestFoodTiles extends StatelessWidget {
  String name;
  String imageUrl;
  String rating;
  String numberOfRating;
  String price;
  String slug;

  BestFoodTiles(
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
    return InkWell(
      onTap: () {},
      child: Column(
        children: <Widget>[
          FlatButton(
            onPressed:_launchURL,
            child: Container(
              padding: EdgeInsets.only(left: 10, right: 5, top: 0, bottom: 0),
              decoration: BoxDecoration(boxShadow: [
                /* BoxShadow(
                  color: Color(0xFFfae3e2),
                  blurRadius: 15.0,
                  offset: Offset(0, 0.75),
                ),*/
              ]),
              child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Image.asset(
                  'assets/images/bestfood/' + imageUrl + ".jpg",
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 1,
                margin: EdgeInsets.all(5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BestFoodList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        BestFoodTiles(
            name: "Fried Egg",
            imageUrl: "best-food1",
            rating: '4.9',
            numberOfRating: '200',
            price: '15.06',
            slug: "fried_egg"),
        BestFoodTiles(
            name: "Mixed vegetable",
            imageUrl: "best-food2",
            rating: "4.9",
            numberOfRating: "100",
            price: "17.03",
            slug: ""),
        BestFoodTiles(
            name: "Salad with chicken meat",
            imageUrl: "best-food3",
            rating: "4.0",
            numberOfRating: "50",
            price: "11.00",
            slug: ""),
        BestFoodTiles(
            name: "New mixed salad",
            imageUrl: "best-food4",
            rating: "4.00",
            numberOfRating: "100",
            price: "11.10",
            slug: ""),
        BestFoodTiles(
            name: "Red meat with salad",
            imageUrl: "best-food5",
            rating: "4.6",
            numberOfRating: "150",
            price: "12.00",
            slug: ""),
        BestFoodTiles(
            name: "New mixed salad",
            imageUrl: "best-food6",
            rating: "4.00",
            numberOfRating: "100",
            price: "11.10",
            slug: ""),
        BestFoodTiles(
            name: "Potato with meat fry",
            imageUrl: "best-food7",
            rating: "4.2",
            numberOfRating: "70",
            price: "23.0",
            slug: ""),
       /* BestFoodTiles(
            name: "Fried Egg",
            imageUrl: "best-food8",
            rating: '4.9',
            numberOfRating: '200',
            price: '15.06',
            slug: "fried_egg"),*/

      ],
    );
  }
}
_launchURL() async {

  const url = 'https://www.instagram.com/lyoom.cantine.official/?hl=fr';
  if (await canLaunch(url)) {
    await launch(url);

  } else {
    throw 'Could not launch $url';
  }
}
