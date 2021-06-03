import 'package:flutter_app/services/store.dart';
import 'package:flutter_app/widgets/global.dart';
import 'package:flutter_app/pages/admin/order_details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/order.dart';

class OrdersScreen extends StatelessWidget {
  static String id = 'OrdersScreen';
  final Store _store = Store();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:AppBar(),
      body: StreamBuilder<QuerySnapshot>(
        stream: _store.loadOrders(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text('there is no orders'),
            );
          } else {
            List<Order> orders = [];
            for (var doc in snapshot.data.docs) {
              orders.add(Order(
                documentId: doc.id,
                address: doc.data()[kAddress],
                totallPrice: doc.data()[kTotalPrice],
                phone:doc.data()[kphone],
                nom: doc.data()[knom],
                payment: doc.data()[kpayment],
                prenom: doc.data()[kprenom],
                eat: doc.data()[keat],
                date: doc.data()['date']
              ));
            }
            return ListView.builder(
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(20),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, OrderDetails.id,
                        arguments: orders[index]);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30.0)),
                      color: Color(0xFFF6CBE1)
                    ),
                    height: MediaQuery.of(context).size.height * .3,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('Prix Total:= \$${orders[index].totallPrice}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Addresse: ${orders[index].address}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),    SizedBox(
                            height: 5,
                          ), Row(
                            children: [
                              Text(
                                'nom: ${orders[index].nom}',
                                style: TextStyle(
                                    fontSize: 18,),
                              ),
                              SizedBox(width: 3.0,),
                              Text(
                                'prénom: ${orders[index].prenom}',
                                style: TextStyle(
                                  fontSize: 18,),
                              ),

                            ],
                          ),


                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Tel: ${orders[index].phone}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            ' ${orders[index].eat}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            ' ${orders[index].payment}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text('date:= \$${orders[index].date}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
              itemCount: orders.length,
            );
          }
        },
      ),
    );
  }
}