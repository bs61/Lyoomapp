import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/pages/admin/History.dart';
import 'package:flutter_app/pages/admin/takeorders.dart';

class AdminHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromRGBO(99, 159, 171,1.0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Center(
                child: GestureDetector(
                  onTap: (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>OrdersScreen()),
                  );},
                  child: Container(
                    height: 190.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        image: DecorationImage(
                            image: AssetImage('assets/images/topmenu/mezzés.jpg'),
                            fit: BoxFit.cover)),
                    child: Center(
                      child: Text(
                        'Prendre les Commandes',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: (){Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>HistoryScreen()),
                  );},
                  child: Container(
                    height: 190.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30.0)),
                        image: DecorationImage(
                            image: AssetImage('assets/images/topmenu/extras.jpg'),
                            fit: BoxFit.cover)),
                    child: Center(
                      child: Text(
                        'Historique du jour',
                        textAlign: TextAlign.center,
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
