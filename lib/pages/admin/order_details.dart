import 'package:flutter/widgets.dart';
import 'package:flutter_app/models/foodorder.dart';
import 'package:flutter_app/models/order.dart';
import 'package:flutter_app/services/store.dart';
import 'package:flutter_app/widgets/global.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  static String id = 'OrderDetails';

  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  Store store = Store();
  // ignore: deprecated_member_use
  final FirebaseFirestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    Order parent = ModalRoute.of(context).settings.arguments;
    String documentId=parent.documentId;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: ()=>  Navigator.pop(context),)
        ],
      ),
      backgroundColor: Color(0xFFE1F1F4),
      body: StreamBuilder<QuerySnapshot>(
          stream: store.loadOrderDetails(documentId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Foodorder> products = [];
              for (var doc in snapshot.data.docs) {
                products.add(Foodorder(
                  pName: doc.data()[kProductName],
                  pQuantity: doc.data()[kProductQuantity],
                  keft: doc.data()[kkeft],
                  mezze: doc.data()[kmezze],
                  pain: doc.data()[kpain],
                  viande: doc.data()[kviande],
                ));
              }

              return Column(
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              color: Color(0xFFFDD6AF)
                          ),
                          height: MediaQuery.of(context).size.height * .6,

                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text('nom : ${products[index].pName}',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Quantit?? : ${products[index].pQuantity}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                putviande(products[index].viande),
                                putpain(products[index].pain),
                                putkeft(products[index].keft),
                                Expanded(child:putmezze(products[index].mezze),),
                              ],
                            ),
                          ),
                        ),
                      ),
                      itemCount: products.length,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: ButtonTheme(
                            buttonColor: Colors.white,
                            child: RaisedButton(
                              color:Color(0xFFE37978) ,
                              onPressed: () {
                                setState(() {
                                  _firestore.collection(kOrders).doc(documentId).delete();
                                  Navigator.pop(context);
                                });
                              },
                              child: Text('Supprimer'),
                            ),
                          ),
                        ),
                        SizedBox(width: 20.0,),
                        Expanded(
                          child: ButtonTheme(
                            buttonColor: Colors.white,
                            child: RaisedButton(
                              color:Color(0xFFE37978) ,
                              onPressed: () {
                                setState(() {
                                  store.storeOrders2( {
                                    kTotalPrice: parent.totallPrice,
                                    kAddress: parent.address,
                                    kphone: parent.phone,
                                    knom: parent.nom,
                                    kprenom: parent.prenom,
                                    keat: parent.eat,
                                    kpayment: parent.payment
                                  },products);
                                  _firestore.collection(kOrders).doc(documentId).delete();
                                  Navigator.pop(context);
                                });
                              },
                              child: Text('Termin??'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: Text('Chargement du Details'),
              );
            }
          }),
    );
  }

  putviande(var viande) {
    if(viande=='Choisir un viande'){
      return SizedBox(height: 3.0,width: 5.0,);
    }else{
      return Row(
        children: [
          Text('viande:',style:TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
          Text(viande,style: TextStyle(fontSize: 20.0),),
        ],
      );
    }
  }

  putpain(var pain) {
    if(pain=='Choisir un pain'){
      return SizedBox(height: 3.0,width: 5.0,);
    }else{
      return Row(
        children: [
          Text('pain:',style:TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
          Text(pain,style: TextStyle(fontSize: 20.0),),
        ],
      );
    }
  }

  putkeft(var keft) {if(keft=='Choisir un viande'){
    return SizedBox(height: 3.0,width: 5.0,);
  }else{
    return Row(
      children: [
        Text('viande:',style:TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
        Text(keft,style: TextStyle(fontSize: 20.0),),
      ],
    );
  }}

  putmezze(var mezze) {
    List add=[];
    for(var i in mezze){
      if(!(i=='Choisir un sauce'))
        add.add(i);
    }
    return add.isEmpty
        ?SizedBox(height: 5.0,width: 5.0,)
        :SizedBox(height: 20.0,width: 400.0,child: ListView.builder(itemCount: add.length,itemBuilder: (context,index){return Column(
          children: [
            SizedBox(height: 10.0,),
            Row(
              children: [
                Text('Mezz?? ${index+1}:  ',style:TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold),),
                Text(add[index],style: TextStyle(fontSize: 20.0),),
              ],
            ),
            SizedBox(height: 10.0,),
          ],
        );}));
  }
}