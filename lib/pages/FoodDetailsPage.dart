import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/animation/ScaleRoute.dart';
import 'package:flutter_app/models/foodmodel.dart';


import 'package:flutter_app/pages/menu.dart';
import 'package:flutter_app/pages/panier.dart';
import 'package:flutter_app/provider/cartprovider.dart';


import 'package:flutter_app/widgets/Drawer.dart';
import 'package:flutter_app/models/foods.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';



class DetailsPage extends StatefulWidget {
  final heroTag;
  final foodName;
  final foodPrice;
  final category;
  var mezz = [
    'Choisir un sauce',
    'Choisir un sauce',
    'Choisir un sauce',
    'Choisir un sauce',
    'Choisir un sauce',
    'Choisir un sauce'
  ];
  var viandes = ['Choisir un viande'];
  var pain = ['Choisir un pain'];
  var keft = ['Choisir un viande'];

  DetailsPage({
    this.heroTag,
    this.foodName,
    this.foodPrice,
    this.category,
  });

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var selectedCard = 'WEIGHT';
  int _quantity = 1;
  bool pressAttention;

  @override
  Widget build(BuildContext context) {
    int index = foods.indexOf(getfood(widget.foodName));

    return Scaffold(
      endDrawer: appdrawer(),
      backgroundColor: Color(0xFFfde7d0),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                ScaleRoute(
                  page: Menu(),
                ));
          },
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Details',
            style: TextStyle(
                fontFamily: 'Montserrat', fontSize: 18.0, color: Colors.white)),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
            color: Colors.white,
          )
        ],
      ),
      body: SafeArea(
        child: ListView(children: [
          Container(
            height: MediaQuery.of(context).size.height - 82.0,
            width: MediaQuery.of(context).size.width,
            color: Colors.transparent,
            child: Stack(children: [
              // Container(
              //     height: MediaQuery.of(context).size.height - 82.0,
              //     width: MediaQuery.of(context).size.width,
              //     color: Colors.transparent),
              Positioned(
                  top: 70.0,
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(45.0),
                            topRight: Radius.circular(45.0),
                          ),
                          color: Colors.white),
                      height: MediaQuery.of(context).size.height - 100.0,
                      width: MediaQuery.of(context).size.width)),
              Positioned(
                  top: 30.0,
                  left: (MediaQuery.of(context).size.width / 2) - 100.0,
                  child: Hero(
                      tag: widget.heroTag,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100.0)),
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/images/lyoom images/' +
                                          widget.heroTag +
                                          ".jpg"),
                                  fit: BoxFit.cover)),
                          height: 200.0,
                          width: 200.0))),
              Positioned(
                  top: 240.0,
                  left: 25.0,
                  right: 25.0,
                  bottom: 1.0,
                  child: ListView(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.foodName,
                                  style: TextStyle(
//                            fontFamily: 'Montserrat',
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold)),
                              Icon(
                                FontAwesomeIcons.solidHeart,
                                color: Colors.red,
                                size: 30.0,
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text('\$ ${widget.foodPrice}',
                                  style: TextStyle(
//                                fontFamily: 'Montserrat',
                                      fontSize: 20.0,
                                      color: Colors.grey)),
                              Container(
                                  height: 25.0, color: Colors.grey, width: 1.0),
                              Container(
                                width: 125.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(17.0),
                                    color: Color(0xFF7A9BEE)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        height: 25.0,
                                        width: 25.0,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7.0),
                                            color: Color(0xFF7A9BEE)),
                                        child: Center(
                                          child: GestureDetector(
                                            onTap: (substrac),
                                            child: Icon(
                                              Icons.remove,
                                              color: Colors.white,
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(_quantity.toString(),
                                        style: TextStyle(
                                            color: Colors.white,
//                                      fontFamily: 'Montserrat',
                                            fontSize: 15.0)),
                                    InkWell(
                                      onTap: () {},
                                      child: Container(
                                        height: 25.0,
                                        width: 25.0,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(7.0),
                                            color: Colors.white),
                                        child: Center(
                                          child: GestureDetector(
                                            onTap: add,
                                            child: Icon(
                                              Icons.add,
                                              color: Color(0xFF7A9BEE),
                                              size: 20.0,
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Categorie:',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                foods[index].pCategory,
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.0),
                          Widget_Manager(widget.foodName, widget.mezz,
                              widget.viandes, widget.pain, widget.keft),
                          SizedBox(
                            height: 100.0,
                          ),
                        ],
                      ),
                    ],
                  )),
            ]),
          ),
        ]),
      ),
      bottomNavigationBar: Builder(
        builder: (context) => Container(
          color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0)),
              color: Color.fromRGBO(99, 159, 171, 1),
            ),
            height: 60.0,
            child: GestureDetector(
              onTap: () {
                CartItems _cartitem =
                    Provider.of<CartItems>(context, listen: false);
                print(widget.viandes[0]);
                print(widget.mezz[0]);
                print(widget.mezz[1]);
                print(widget.mezz[2]);
                print(widget.pain[0]);
                CartItem item = CartItem(
                  productName: widget.foodName,
                  productPrice: widget.foodPrice,
                  productImage: widget.heroTag,
                  productQuantity: _quantity,
                  mezze: widget.mezz,
                  viande: widget.viandes,
                  keft: widget.keft,
                  pain: widget.pain,
                );
                _cartitem.addProduct(item);
                Scaffold.of(context).showSnackBar(
                    SnackBar(content: Text("Produit ajouté au panier")));
              },
              child: Center(
                child: Text('+ Ajouter au Panier',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
//                                  fontFamily: 'Montserrat'
                    )),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(String cardTitle, String info, String unit) {
    return InkWell(
        onTap: () {
          selectCard(cardTitle);
        },
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color:
                  cardTitle == selectedCard ? Color(0xFF7A9BEE) : Colors.white,
              border: Border.all(
                  color: cardTitle == selectedCard
                      ? Colors.transparent
                      : Colors.grey.withOpacity(0.3),
                  style: BorderStyle.solid,
                  width: 0.75),
            ),
            height: 100.0,
            width: 100.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                    child: Text(cardTitle,
                        style: TextStyle(
//                          fontFamily: 'Montserrat',
                          fontSize: 12.0,
                          color: cardTitle == selectedCard
                              ? Colors.white
                              : Colors.grey.withOpacity(0.7),
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15.0, bottom: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(info,
                            style: TextStyle(
//                                fontFamily: 'Montserrat',
                                fontSize: 14.0,
                                color: cardTitle == selectedCard
                                    ? Colors.white
                                    : Colors.black,
                                fontWeight: FontWeight.bold)),
                        Text(unit,
                            style: TextStyle(
//                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              color: cardTitle == selectedCard
                                  ? Colors.white
                                  : Colors.black,
                            ))
                      ],
                    ),
                  )
                ])));
  }

  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }

  substrac() {
    if (_quantity > 1)
      setState(() {
        _quantity--;
      });
  }

  add() {
    setState(() {
      _quantity++;
    });
  }
}

Widget Widget_Manager(String name, var mezz, var viande, var pain, var keft) {
  switch (name) {
    case 'Shan Tounsi':
      {
        return Column(
          children: [Description(getfood(name))],
        );
      }
    case 'Shan Kaftagi':
      {
        return Column(
          children: [

            choitkeft(viande: keft),
            Description(getfood(name)),
          ],
        );
      }
    case 'Mokli':
      {
        return Column(
          children: [Description(getfood(name))],
        );
      }
    case 'Kemia Tunisienne':
      {
        return Column(
          children: [Description(getfood(name))],
        );
      }
    case 'Brochettes &\n 6 Mezzés':
      {
        return Column(
          children: [

            choitviande(viande: viande),
            Row(children: [
              Expanded(child: choitmezze(imez: 1, mez: mezz)),
            ]),
            Row(children: [
              Expanded(child: choitmezze(imez: 2, mez: mezz)),
            ]),
            Row(children: [
              Expanded(child: choitmezze(imez: 3, mez: mezz)),
            ]),
            Row(children: [
              Expanded(child: choitmezze(imez: 4, mez: mezz)),
            ]),
            Row(children: [
              Expanded(child: choitmezze(imez: 5, mez: mezz)),
            ]),
            Row(children: [
              Expanded(child: choitmezze(imez: 6, mez: mezz)),
            ]),
            Descriptionmez(getfood(name)),
          ],
        );
      }
    case 'Brochettes &\n 4 Mezzés':
      {
        return Column(
          children: [

            choitviande(viande: viande),
            Row(children: [
              Expanded(child: choitmezze(imez: 1, mez: mezz)),
            ]),
            Row(children: [
              Expanded(child: choitmezze(imez: 2, mez: mezz)),
            ]),
            Row(children: [
              Expanded(child: choitmezze(imez: 3, mez: mezz)),
            ]),
            Row(children: [
              Expanded(child: choitmezze(imez: 4, mez: mezz)),
            ]),
            Descriptionmez(getfood(name)),
          ],
        );
      }
    case 'Brochettes &\n 2 Mezzés':
      {
        return Column(
          children: [
            choitviande(viande: viande),
            Row(children: [
              Expanded(child: choitmezze(imez: 1, mez: mezz)),
            ]),
            Row(children: [
              Expanded(child: choitmezze(imez: 2, mez: mezz)),
            ]),
            Descriptionmez(getfood(name)),
          ],
        );
      }
    case 'Mezzés à la carte':
      {
        return Column(
          children: [
            Row(children: [
              Expanded(child: choitmezze(imez: 1, mez: mezz)),
            ]),
            Descriptionmez(getfood(name)),
          ],
        );
      }
    case 'Brochette':
      {
        return Column(
          children: [

            choitviande(viande: viande),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'pain:',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
              Expanded(child: choitpain(pain: pain)),
            ]),
            Description(getfood(name)),
          ],
        );
      }
    default:
      return SizedBox(
        height: 10,
      );
  }
}

class choitmezze extends StatefulWidget {
  int imez;
  var mez = [
    'Choisir une sauce',
    'Choisir une sauce',
    'Choisir une sauce',
    'Choisir une sauce',
    'Choisir une sauce',
    'Choisir une sauce'
  ];
  choitmezze({var this.mez, this.imez});

  @override
  _choitmezze createState() => _choitmezze();
}

class _choitmezze extends State<choitmezze> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Mezzé ${widget.imez} :',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        Builder(builder: (context) {
          return Flexible(
            flex: 1,
            child: RaisedButton(
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) => CupertinoActionSheet(
                            cancelButton: Builder(
                              builder: (context) => CupertinoActionSheetAction(
                                child: Text("cancel"),
                                onPressed: () {
                                  widget.mez[widget.imez - 1] =
                                      "choisir un sauce";
                                  setState(() {});
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            title: Text('Choisir un sauce'),
                            actions: [
                              CupertinoActionSheetAction(
                                child: Text("Omek houria"),
                                onPressed: () {
                                  widget.mez[widget.imez - 1] = "Omek houria";
                                  setState(() {});
                                  Navigator.pop(context);
                                },
                              ),
                              CupertinoActionSheetAction(
                                  child: Text("Caviar d'aubergine"),
                                  onPressed: () {
                                    widget.mez[widget.imez - 1] =
                                        "Caviar d'aubergine";
                                    setState(() {});
                                    Navigator.pop(context);
                                  }),
                              CupertinoActionSheetAction(
                                  child: Text('Taboulé'),
                                  onPressed: () {
                                    widget.mez[widget.imez - 1] = 'Taboulé';
                                    setState(() {});
                                    Navigator.pop(context);
                                  }),
                              CupertinoActionSheetAction(
                                  child: Text('Houmos'),
                                  onPressed: () {
                                    widget.mez[widget.imez - 1] = 'Houmos';
                                    setState(() {});
                                    Navigator.pop(context);
                                  }),
                              CupertinoActionSheetAction(
                                  child: Text('Féta'),
                                  onPressed: () {
                                    widget.mez[widget.imez - 1] = 'Féta';
                                    setState(() {});
                                    Navigator.pop(context);
                                  }),
                              CupertinoActionSheetAction(
                                  child: Text('Salade tunisienne'),
                                  onPressed: () {
                                    widget.mez[widget.imez - 1] =
                                        'Salade tunisienne';
                                    setState(() {});
                                    Navigator.pop(context);
                                  }),
                              CupertinoActionSheetAction(
                                  child: Text('Salade Mechouia'),
                                  onPressed: () {
                                    widget.mez[widget.imez - 1] =
                                        'Salade Mechouia';
                                    setState(() {});
                                    Navigator.pop(context);
                                  }),
                              CupertinoActionSheetAction(
                                  child: Text('crème de toum'),
                                  onPressed: () {
                                    widget.mez[widget.imez - 1] =
                                        'crème de toum';

                                    setState(() {});
                                    Navigator.pop(context);
                                  }),
                              CupertinoActionSheetAction(
                                  child: Text('Tzatziki'),
                                  onPressed: () {
                                    widget.mez[widget.imez - 1] = 'Tzatziki';
                                    setState(() {});
                                    Navigator.pop(context);
                                  }),
                              CupertinoActionSheetAction(
                                  child: Text('Moutabal'),
                                  onPressed: () {
                                    widget.mez[widget.imez - 1] = 'Moutabal';
                                    setState(() {});
                                    Navigator.pop(context);
                                  }),
                              CupertinoActionSheetAction(
                                  child: Text('Chakchouka'),
                                  onPressed: () {
                                    widget.mez[widget.imez - 1] = 'Chakchouka';
                                    setState(() {});
                                    Navigator.pop(context);
                                  }),
                              CupertinoActionSheetAction(
                                  child: Text('Riz pilaf'),
                                  onPressed: () {
                                    widget.mez[widget.imez - 1] = 'Riz pilaf';
                                    setState(() {});
                                    Navigator.pop(context);
                                  }),
                              CupertinoActionSheetAction(
                                  child: Text('Pomme de terre sauté'),
                                  onPressed: () {
                                    widget.mez[widget.imez - 1] =
                                        'Pomme de terre sauté';
                                    setState(() {});
                                    Navigator.pop(context);
                                  }),
                              CupertinoActionSheetAction(
                                  child: Text('Boulgour Pilavi'),
                                  onPressed: () {
                                    widget.mez[widget.imez - 1] =
                                        'Boulgour Pilavi';
                                    setState(() {});
                                    Navigator.pop(context);
                                  }),
                              CupertinoActionSheetAction(
                                  child: Text('Souaba3 Fatma'),
                                  onPressed: () {
                                    widget.mez[widget.imez - 1] =
                                        'Souaba3 Fatma';
                                    setState(() {});
                                    Navigator.pop(context);
                                  }),
                              CupertinoActionSheetAction(
                                  child: Text('Keftéji'),
                                  onPressed: () {
                                    widget.mez[widget.imez - 1] = 'Keftéji';
                                    setState(() {});
                                    Navigator.pop(context);
                                  }),
                              CupertinoActionSheetAction(
                                  child: Text('Mderbel'),
                                  onPressed: () {
                                    widget.mez[widget.imez - 1] = 'Mderbel';
                                    setState(() {});
                                    Navigator.pop(context);
                                  }),
                              CupertinoActionSheetAction(
                                  child: Text('Samousa'),
                                  onPressed: () {
                                    widget.mez[widget.imez - 1] = 'Samousa';
                                    setState(() {});
                                    Navigator.pop(context);
                                  }),
                            ],
                          ));
                },
                child: Text(
                  widget.mez[widget.imez - 1],
                )),
          );
        }),
      ],
    );
  }
}

class choitviande extends StatefulWidget {
  var viande = ['choisir un viande'];
  choitviande({
    var this.viande,
  });

  @override
  _choitviande createState() => _choitviande();
}

class _choitviande extends State<choitviande> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'viande:',
          style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        Builder(builder: (context) {
          return Flexible(
            child: RaisedButton(
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) => CupertinoActionSheet(
                            cancelButton: Builder(
                              builder: (context) => CupertinoActionSheetAction(
                                child: Text("cancel"),
                                onPressed: () {
                                  widget.viande[0] = "choisir un viande";
                                  setState(() {});
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            title: Text('Choisir un viande'),
                            actions: [
                              CupertinoActionSheetAction(
                                child: Text("Chawarma"),
                                onPressed: () {
                                  widget.viande[0] = 'Chawarma';
                                  setState(() {});
                                  Navigator.pop(context);
                                },
                              ),
                              CupertinoActionSheetAction(
                                  child: Text('Poulet méditerranée'),
                                  onPressed: () {
                                    widget.viande[0] = 'Poulet méditerranée';
                                    setState(() {});
                                    Navigator.pop(context);
                                  }),
                              CupertinoActionSheetAction(
                                  child: Text('Agneau Ras El Hanout'),
                                  onPressed: () {
                                    widget.viande[0] = 'Agneau Ras El Hanout';
                                    setState(() {});
                                    Navigator.pop(context);
                                  }),
                              CupertinoActionSheetAction(
                                  child: Text('Kefta cumin'),
                                  onPressed: () {
                                    widget.viande[0] = 'Kefta cumin';
                                    setState(() {});
                                    Navigator.pop(context);
                                  }),
                              CupertinoActionSheetAction(
                                  child: Text('Falafel'),
                                  onPressed: () {
                                    widget.viande[0] = 'Falafel';
                                    setState(() {});
                                    Navigator.pop(context);
                                  }),
                              CupertinoActionSheetAction(
                                  child: Text('Merguez du boucher'),
                                  onPressed: () {
                                    widget.viande[0] = 'Merguez du boucher';
                                    setState(() {});
                                    Navigator.pop(context);
                                  }),
                              CupertinoActionSheetAction(
                                  child: Text('Boulette à la Tunisienne'),
                                  onPressed: () {
                                    widget.viande[0] =
                                        'Boulette à la Tunisienne';
                                    setState(() {});
                                    Navigator.pop(context);
                                  }),
                            ],
                          ));
                },
                child: Text(
                  widget.viande[0],
                )),
          );
        }),
      ],
    );
  }
}

class choitkeft extends StatefulWidget {
  var viande = ['choisir un viande'];
  choitkeft({
    var this.viande,
  });

  @override
  _choitkeft createState() => _choitkeft();
}

class _choitkeft extends State<choitkeft> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Builder(builder: (context) {
          return Flexible(
            child: RaisedButton(
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) => CupertinoActionSheet(
                            cancelButton: Builder(
                              builder: (context) => CupertinoActionSheetAction(
                                child: Text("cancel"),
                                onPressed: () {
                                  widget.viande[0] = "choisir un viande";
                                  setState(() {});
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            title: Text('Choisir un viande'),
                            actions: [
                              CupertinoActionSheetAction(
                                  child: Text("Poulet mariné"),
                                  onPressed: () {
                                    widget.viande[0] = "Poulet mariné";
                                    setState(() {});
                                    Navigator.pop(context);
                                  }),
                              CupertinoActionSheetAction(
                                  child: Text('Falafel'),
                                  onPressed: () {
                                    widget.viande[0] = 'Falafel';
                                    setState(() {});
                                    Navigator.pop(context);
                                  }),
                              CupertinoActionSheetAction(
                                  child: Text('Merguez '),
                                  onPressed: () {
                                    widget.viande[0] = 'Merguez ';
                                    setState(() {});
                                    Navigator.pop(context);
                                  }),
                            ],
                          ));
                },
                child: Text(
                  widget.viande[0],
                )),
          );
        }),
      ],
    );
  }
}

class choitpain extends StatefulWidget {
  var pain = ['choisir un pain'];
  choitpain({
    var this.pain,
  });

  @override
  _choitpain createState() => _choitpain();
}

class _choitpain extends State<choitpain> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Builder(builder: (context) {
          return Flexible(
            child: RaisedButton(
                onPressed: () {
                  showCupertinoModalPopup(
                      context: context,
                      builder: (context) => CupertinoActionSheet(
                            cancelButton: Builder(
                              builder: (context) => CupertinoActionSheetAction(
                                child: Text("cancel"),
                                onPressed: () {
                                  widget.pain[0] = "choisir le pain";
                                  setState(() {});
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            title: Text('Choisir le pain'),
                            actions: [
                              CupertinoActionSheetAction(
                                child: Text("Batboute"),
                                onPressed: () {
                                  widget.pain[0] = "Batboute";
                                  setState(() {});
                                  Navigator.pop(context);
                                },
                              ),
                              CupertinoActionSheetAction(
                                  child: Text("Melaoui"),
                                  onPressed: () {
                                    widget.pain[0] = "Melaoui";
                                    setState(() {});
                                    Navigator.pop(context);
                                  }),
                            ],
                          ));
                },
                child: Text(
                  widget.pain[0],
                )),
          );
        }),
      ],
    );
  }
}


Description(Food food) {
  return Row(
    children: [
      Text(
        'Description:',
        style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
      Expanded(
        child: Text(
          food.pDescription,
          style: TextStyle(fontSize: 13.5, fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}

Descriptionmez(Food food) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(
          bottom: 100.0,
        ),
        child: Column(
          children: [
            Text(
              'Description:',
              style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'Choisir un mezzzé\n à partir de sauces\n suivants:',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      Expanded(
        child: Text(
          food.pDescription,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      )
    ],
  );
}
