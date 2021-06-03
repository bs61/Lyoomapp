import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app/pages/menu.dart';
import 'package:flutter_app/provider/cartprovider.dart';
import 'package:flutter_app/services/pay.dart';
import 'package:flutter_app/services/store.dart';
import 'package:flutter_app/widgets/global.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';
import 'package:mailer/smtp_server/gmail.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';





import 'package:flutter_app/widgets/Drawer.dart';
import 'package:flutter_app/widgets/appbar.dart';


import 'package:provider/provider.dart';

import 'package:flutter_app/pages/HomePage.dart';

import 'admin/paiment.dart';

class ShopItems extends StatefulWidget {
  @override
  ShopItemsWidget createState() => ShopItemsWidget();
}

int _currentIndex = 2;
final tabs = [Home(), Menu(), ShopItems(),];

class ShopItemsWidget extends State<ShopItems> {
  var eat;
  var payment;
  var validation="vide";
  var mess;

  @override
  void initState() {
    super.initState();
    StripeService.init();
  }

  @override
  Widget build(BuildContext context) {
    List<CartItem> _items = Provider.of<CartItems>(context).products;
    List<String> details1=Provider.of<CartItems>(context, listen: false).mail();
    String details=details1.join();
    void _onItemTapped(int index) {
      var _currentIndex = index;
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => tabs[_currentIndex]),
        );
      });
    }

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: appbar(context),
        drawer: appdrawer(),
        backgroundColor: Color(0xFFfde7d0),
        body: ListView(children: [
          Container(
            padding: EdgeInsets.only(left: 35.0),
            child: Text(
              'votre panier',
              style: TextStyle(fontSize: 50.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            padding: EdgeInsets.only(top: 30.0),
            child: SizedBox(
              height: 850.0,
              child: LayoutBuilder(builder: (context, constraints) {
                if (_items.isNotEmpty) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          child: ListView.builder(
                              itemCount: _items.length,
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    CartItem(
                                        productName: _items[index].productName,
                                        productPrice:
                                            _items[index].productPrice,
                                        productQuantity:
                                            _items[index].productQuantity,
                                        viande: _items[index].viande,
                                        mezze: _items[index].mezze,
                                        pain: _items[index].pain,
                                        keft: _items[index].keft,
                                        productImage:
                                            _items[index].productImage),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 310.0),
                                      child: IconButton(
                                        icon: Icon(Icons.delete),
                                        onPressed: () {
                                          Provider.of<CartItems>(context,
                                                  listen: false)
                                              .deleteProduct(_items[index]);
                                        },
                                        iconSize: 30.0,
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.only(top: 65.0, left: 300),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(100.0)),
                                          color: Color(0xFFF9DC5C),
                                        ),
                                        height: 30,
                                        width: 30,
                                        child: Center(
                                            child: Text(
                                                'x\ ${_items[index].productQuantity}')),
                                      ),
                                    )
                                  ],
                                );
                              })),
                      TotalCalculationWidget(),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: 60,
                          decoration: BoxDecoration(boxShadow: [
                            BoxShadow(
                              color: Color(0xFFfae3e2).withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 1,
                              offset: Offset(0, 1),
                            ),
                          ]),
                          child: Card(
                            color: Colors.white,
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                            child: Container(
                              padding: EdgeInsets.only(
                                left: 10,
                                right: 30,
                              ),
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Text("à emporter"),
                                    leading: Radio(
                                      groupValue: eat,
                                      value: "à emporter",
                                      onChanged: (value) {
                                        setState(() {
                                          eat = value;
                                        });
                                      },
                                    ),
                                  ),
                                  ListTile(
                                    title: Text("sur place"),
                                    leading: Radio(
                                      groupValue: eat,
                                      value: "sur place",
                                      onChanged: (value) {
                                        setState(() {
                                          eat = value;
                                        });
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5),
                        child: Text(
                          "Methode de Paiement",
                          style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF3a3a3b),
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                          child: Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 115,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Color(0xFFfae3e2).withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 1),
                          ),
                        ]),
                        child: Card(
                          color: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(5.0),
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.only(
                              left: 10,
                              right: 30,
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  title: Text("Paiement avec la carte"),
                                  leading: Radio(
                                    groupValue: payment,
                                    value: "Paiement avec la carte",
                                    onChanged: (value) {
                                      setState(() {
                                        payment = value;
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: Text("Paiement a la livraison"),
                                  leading: Radio(
                                    groupValue: payment,
                                    value: "Paiement a la livraison",
                                    onChanged: (value) {
                                      setState(() {
                                        payment = value;
                                      });
                                    },
                                  ),
                                ),
                                CupertinoButton(
                                  child: Text(
                                    'Valider La Methode De Paiement',
                                    textAlign: TextAlign.center,
                                  ),
                                  onPressed: () async {
                                    print(details);
                                    if(payment=="Paiement avec la carte"){
                                      var tprice=Provider.of<CartItems>(context, listen: false).totalPrice.toString();
                                      var len=tprice.length;
                                      var price=tprice.substring(0,len-2)+tprice.substring(len-1,len)+"0";

                                      // Navigator.push(context, ScaleRoute(page: payViaNewCard(context)));
                                       mess=await payViaNewCard(context,price);
                                      // ignore: unrelated_type_equality_checks
                                      if (mess=='Transaction reussi'){
                                        setState(() {
                                          validation="validé";
                                          payment="Paiement avec la carte reussi";
                                        });
                                      }else{
                                        setState(() {
                                          validation="non validé";
                                        });
                                      }
                                    }else{
                                      setState(() {
                                        validation="validé";
                                      });
                                      // print(mess);
                                    }
                                  },
                                  color: Colors.redAccent,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                      Container(
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

                                if(validation=="validé"){
                                  showCustomDialog(context, eat, payment,details);
                                }else{
                                  Scaffold.of(context).showSnackBar(SnackBar(
                                    content: Text('Veuillez valider la methode de paiement'),

                                  ));
                                print(mess);

                                }
                              },
                              child: Center(
                                child: Text('Valider la commande',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
//                                  fontFamily: 'Montserrat'
                                    )),
                              ),
                            )),
                      )
                    ],
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(
                      bottom: 300.0,
                    ),
                    child: Center(
                      child: Text(
                        "Vous n'avez rien dans votre panier :(",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                }
              }),
            ),
          ),
        ]),
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
            onTap: _onItemTapped));
  }


}

void showCustomDialog(context, var eat, var payment,var details) async {
  var price = Provider.of<CartItems>(context, listen: false).totalPrice;
  var address;
  var tel;
  var nom;
  var prenom;
  AlertDialog alertDialog = AlertDialog(
    actions: <Widget>[
      MaterialButton(
        onPressed: () {

          try {
            Store _store = Store();
            _store.storeOrders({
              kTotalPrice: price,
              kAddress: address,
              kphone: tel,
              knom: nom,
              kprenom: prenom,
              keat: eat,
              kpayment: payment,
              'date':'${DateTime.now()}'
            }, Provider.of<CartItems>(context, listen: false).products);
            sendMail(context,price.toString(),address,tel,nom,prenom,eat,payment,details);

            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text('Orderd Successfully'),
            ));
            Navigator.pop(context);
          } catch (ex) {
            print(ex.message);
          }
        },
        child: Text('Confirmer'),
      )
    ],
    content: Container(

      width:double.maxFinite,
      child: ListView(
        children: [
          TextField(
            onChanged: (value) {
              address = value;
            },
            decoration: InputDecoration(hintText: ' votre Address'),
          ),
          TextField(
            onChanged: (value) {
              tel = value;
            },
            keyboardType: TextInputType.number,
            decoration: InputDecoration(hintText: ' Votre numero de tel'),
          ),
          TextField(
            onChanged: (value) {
              nom = value;
            },
            decoration: InputDecoration(hintText: ' votre nom'),
          ),
          TextField(
            onChanged: (value) {
              prenom = value;
            },
            decoration: InputDecoration(hintText: ' votre prénom'),
          ),
        ],
      ),
    ),
    title: Text('Total  = \$ $price'),
  );
  await showDialog(
      context: context,
      builder: (context) {
        return alertDialog;
      });
}



class Wheretoeat extends StatefulWidget {
  var eat;
  Wheretoeat({this.eat});
  @override
  _Wheretoeat createState() => _Wheretoeat();
}

class _Wheretoeat extends State<Wheretoeat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xFFfae3e2).withOpacity(0.1),
          spreadRadius: 1,
          blurRadius: 1,
          offset: Offset(0, 1),
        ),
      ]),
      child: Card(
        color: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(
            left: 10,
            right: 30,
          ),
          child: Column(
            children: [
              ListTile(
                title: Text("à emporter"),
                leading: Radio(
                  groupValue: widget.eat,
                  value: "à emporter",
                  onChanged: (value) {
                    setState(() {
                      widget.eat = value;
                    });
                  },
                ),
              ),
              ListTile(
                title: Text("sur place"),
                leading: Radio(
                  groupValue: widget.eat,
                  value: "sur place",
                  onChanged: (value) {
                    setState(() {
                      widget.eat = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TotalCalculationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CartItem> _items = Provider.of<CartItems>(context).products;
    return Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color(0xFFfae3e2).withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 1),
          ),
        ]),
        child: Card(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 25, right: 30, top: 10, bottom: 10),
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Expanded(
                      child: ListView.builder(
                          itemCount: _items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  _items[index].productName,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF3a3a3b),
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.left,
                                ),
                                Text(
                                  '[\$ ${_items[index].productPrice}] €',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF3a3a3b),
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.left,
                                )
                              ],
                            );
                          })),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Total",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF3a3a3b),
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "\$ ${Provider.of<CartItems>(context).totalPrice}",
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF3a3a3b),
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}

class CartItem extends StatelessWidget {
  String productName;
  double productPrice;
  String productImage;
  int productQuantity;
  var mezze;
  var viande;
  var keft;
  var pain;

  CartItem(
      {Key key,
      @required this.productName,
      @required this.productPrice,
      @required this.productImage,
      this.productQuantity,
      @required this.keft,
      @required this.pain,
      @required this.viande,
      @required this.mezze})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 138,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Color(0xFFfae3e2).withOpacity(0.3),
          spreadRadius: 1,
          blurRadius: 1,
          offset: Offset(0, 1),
        ),
      ]),
      child: Card(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
          ),
          child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(left: 5, right: 5, top: 10, bottom: 10),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => print(mezze[0]),
                      child: Center(
                          child: GestureDetector(
                        onTap: () => print(mezze.toString()),
                        child: Image.asset(
                          "assets/images/lyoom images/$productImage.jpg",
                          width: 110,
                          height: 100,
                        ),
                      )),
                    ),
                  ),
                ),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              child: Text(
                                "$productName",
                                style: TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF3a3a3b),
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            Container(
                              child: Text(
                                "$productPrice" + "€",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color(0xFF3a3a3b),
                                    fontWeight: FontWeight.w400),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 40,
                        ),
                      ],
                    ),
                    ajout1(mezze),
                    Expanded(child: ajout2(pain[0], viande[0], keft[0]))
                  ],
                )
              ],
            ),
          )),
    );
  }
}

class CartIconWithBadge extends StatelessWidget {
  int counter = 3;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconButton(
            icon: Icon(
              Icons.business_center,
              color: Color(0xFF3a3737),
            ),
            onPressed: () {}),
        counter != 0
            ? Positioned(
                right: 11,
                top: 11,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 14,
                    minHeight: 14,
                  ),
                  child: Text(
                    '$counter',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}


Widget ajout1(
  var mez,
) {
  List mezz = [];
  for (var i in mez) {
    if (!(i == 'Choisir un sauce')) mezz.add(i);
  }

  return mezz.isEmpty
      ? SizedBox(
          height: 5.0,
          width: 5.0,
        )
      : SizedBox(
          height: 20.0,
          width: 150.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: mezz.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () => print(mez.toString() + mezz.toString()),
                    child: Text(mezz[index] + "//"));
              }));
}

Widget ajout2(var pain, var viande, var keft) {
  List<String> adds = [];
  if (!(pain == 'Choisir un pain')) adds.add(pain);
  if (!(viande == 'Choisir un viande')) adds.add(viande);
  if (!(keft == 'Choisir un viande')) adds.add(keft);
  return adds.isEmpty
      ? SizedBox(
          height: 5.0,
          width: 5.0,
        )
      : SizedBox(
          height: 15.0,
          width: 150.0,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: adds.length,
              itemBuilder: (context, index) {
                return Text(adds[index] + "//");
              }));
}
sendMail(BuildContext context, String price,
String address,
String tel,
String nom,
String prenom,
String eat,
String payment,String details) async {
  String username = 'lyoomcantine1@gmail.com';
  String password = 'lyoomcantine123';
  String domainSmtp = 'mail.gmail.com';





  //also use for gmail smtp
  // ignore: deprecated_member_use
  final smtpServer = gmail(username, password);

  //user for your own domain
  // final smtpServer = SmtpServer(domainSmtp,username: username,password: password,port: 587);


  final message = Message()
    ..from = Address(username)
    ..recipients.add('lyoomcantine1@gmail.com')
  //..ccRecipients.addAll(['destCc1@example.com', 'destCc2@example.com'])
  //..bccRecipients.add(Address('bccAddress@example.com'))
    ..subject ="${DateTime.now()}"
    ..text = 'This is the plain text.\nThis is line 2 of the text part.'
    ..html = "<h1>Shawon</h1>\n<h2>$kTotalPrice:$price</h2>\n<h2>$kAddress:$address</h2>\n<h2>$kphone:$tel</h2>\n<h2>$knom:$nom</h2>\n<h2>$kprenom:$prenom</h2>\n<h2>$keat:$eat</h2>\n<h2>$kpayment:$payment </h2>\n<h2>$details</h2>\n<hp>  </p>";

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ' + sendReport.toString());
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
}