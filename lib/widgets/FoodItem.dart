import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/animation/ScaleRoute.dart';
import 'package:flutter_app/models/foods.dart';
import 'package:flutter_app/pages/FoodDetailsPage.dart';


 class FoodTiles extends StatelessWidget {
   int index;


    FoodTiles(
     {Key key,
        @required this.index})
        : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return  Padding(
//      padding: const EdgeInsets.only(top:3.0,left: 5.0,right: 5.0),
//      child: FlatButton(
//        onPressed: (){},
//        child: Column(
//          children: [
//            Card(
//                child: ClipRRect(
//                  borderRadius: BorderRadius.only(
//                      topLeft: Radius.circular(30),
//                      topRight: Radius.circular(30)
//                    ),
//                  child: Container(
//                    height: 200.0,
//                    width: 350.0,
//                    decoration: BoxDecoration(
//                      image: DecorationImage(
//                        image: AssetImage('assets/images/popular_foods/'+imageUrl+'.jpg'),
//                        fit: BoxFit.cover
//                      )
//                    ),
//
//                  ),
//                ),
//              shape: RoundedRectangleBorder(
//                borderRadius: BorderRadius.only(
//              topLeft: Radius.circular(30),
//              topRight: Radius.circular(30)
//              ),
//              ),
//              shadowColor: Colors.deepOrangeAccent,
//
//            ),
//            Opacity(
//              opacity: 0.7,
//              child: Container(
//                alignment: Alignment.bottomLeft,
//                height: 92.0,
//                width: 350.0,
//                decoration: BoxDecoration(
//                  borderRadius: BorderRadius.only(
//                      bottomLeft: Radius.circular(30),
//                      bottomRight: Radius.circular(30)
//                  ),
//                  color: Colors.black,
//                ),
//                child: Padding(
//                  padding: const EdgeInsets.only(left:5.0),
//                  child: Column(children:[ GradientText(name,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold), gradient: LinearGradient(
//                      colors: [Colors.blue, Colors.green]),textAlign: TextAlign.center,),  Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: [
//
//                        Text('Prix:'+price+'€',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.white),),
//                        Column(
//                        children: [
//                          Container(
//                            padding: EdgeInsets.only(top: 3, left: 5),
//                            child: Row(
//                              children: <Widget>[
//                                Icon(
//                                  Icons.star,
//                                  size: 20,
//                                  color: Color(0xFFfb3132),
//                                ),
//                                Icon(
//                                  Icons.star,
//                                  size: 20,
//                                  color: Color(0xFFfb3132),
//                                ),
//                                Icon(
//                                  Icons.star,
//                                  size: 20,
//                                  color: Color(0xFFfb3132),
//                                ),
//                                Icon(
//                                  Icons.star,
//                                  size: 20,
//                                  color: Color(0xFFfb3132),
//                                ),
//                                Icon(
//                                  Icons.star_half,
//                                  size: 20,
//                                  color: Color(0xFF9b9b9c),
//                                ),
//                              ],
//                            ),
//                          ),
//                          Text(rating,style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,color: Colors.lime),),
//                        ],
//                      ),
//                    ],
//                  ),]),
//                ),
//              ),
//            ),
//          ],
//        ),
//      ),
//    );
//}
   @override
   Widget build(BuildContext context) {
     return Padding(
       padding: const EdgeInsets.symmetric(vertical:8.0),
       child: GestureDetector(
         onTap: (){Navigator.push(context, ScaleRoute(page:  DetailsPage(heroTag: foods[index].pLocation, foodName: foods[index].pName, foodPrice: foods[index].pPrice)));
         },
         child: ClipRRect(
           borderRadius: BorderRadius.all(
             Radius.circular(40.0),
           ),
           child: Stack(
             children: <Widget>[
               Container(
                 height: 230.0,
                 width: 410.0,
                 child: Image(
                   image: AssetImage(
                       'assets/images/lyoom images/'+foods[index].pLocation+'.jpg'
                   ),
                   fit: BoxFit.cover,
                 ),
               ),
               Positioned(
                 left: 0.0,
                 bottom: 0.0,
                 width: 410.0,
                 height: 70.0,
                 child: Container(
                   decoration: BoxDecoration(
                       gradient: LinearGradient(
                           begin: Alignment.bottomCenter,
                           end: Alignment.topCenter,
                           colors: [Colors.black, Colors.black12])),
                 ),
               ),
               Positioned(
                 left: 10.0,
                 bottom: 20.0,
                 right: 10.0,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: <Widget>[
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: <Widget>[
                         Text(
                           foods[index].pName,
                           style: TextStyle(
                               fontSize: 14.0,
                               fontWeight: FontWeight.bold,
                               color: Colors.white),
                         ),
                         Row(
                           children: <Widget>[
                             Icon(
                               Icons.star,
                               color: Theme.of(context).primaryColor,
                               size: 16.0,
                             ),
                             Icon(
                               Icons.star,
                               color: Theme.of(context).primaryColor,
                               size: 16.0,
                             ),
                             Icon(
                               Icons.star,
                               color: Theme.of(context).primaryColor,
                               size: 16.0,
                             ),
                             Icon(
                               Icons.star,
                               color: Theme.of(context).primaryColor,
                               size: 16.0,
                             ),
                             Icon(
                               Icons.star,
                               color: Theme.of(context).primaryColor,
                               size: 16.0,
                             ),
                             SizedBox(
                               width: 10.0,
                             ),
                           ],
                         ),
                       ],
                     ),
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: <Widget>[
                         Text(
                           foods[index].pPrice.toString()+"€",
                           style: TextStyle(
                               fontSize: 18.0,
                               fontWeight: FontWeight.bold,
                               color: Colors.orangeAccent),
                         ),

                       ],
                     ),
                   ],
                 ),
               ),
             ],
           ),
         ),
       ),
     );
   }
}