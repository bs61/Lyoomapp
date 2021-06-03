

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_app/pages/SignInPage.dart';

import 'package:flutter_app/pages/admin/HistoryDetails.dart';
import 'package:flutter_app/pages/admin/order_details.dart';
import 'package:flutter_app/provider/cartprovider.dart';

import 'package:flutter_app/provider/modelHud.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<modelHud>(
          create: (context)=>modelHud(),
        ),
        ChangeNotifierProvider<CartItems>(
          create: (context)=>CartItems(),
        ),
         ],

       child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
        routes:{
          "/": (context) => SignInPage(),
          OrderDetails.id: (context) => OrderDetails(),
          HistoryDetails.id: (context) => HistoryDetails(),
        }
  ),
     ),
);}




