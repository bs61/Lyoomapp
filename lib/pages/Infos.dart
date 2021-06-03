import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';



import 'package:flutter_app/widgets/Drawer.dart';
import 'package:flutter_app/widgets/appbar.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';




class Infos extends StatefulWidget {
  @override
  _Infos createState() => _Infos();
}

class _Infos extends State<Infos>  {
  Widget build(BuildContext context) {

    return Scaffold(
        drawer:appdrawer(),
        extendBodyBehindAppBar: true,
        appBar: appbar(context),
        body:  Scaffold(
          backgroundColor: Color(0xffF9F9F9),
          body: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Padding(
                padding:
                EdgeInsets.only(left: 16.0, right: 16.0, top: kToolbarHeight),
                child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      maxRadius: 90,
                      backgroundImage: AssetImage('assets/images/lyoomcantine.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Lyoom Cantine',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 16.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.yellowAccent,
                                blurRadius: 4,
                                spreadRadius: 1,
                                offset: Offset(0, 1))
                          ]),
                      height: 150,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                  icon:Icon(FontAwesomeIcons.facebook,color: Colors.indigo,) ,
                                  onPressed:(){_launchURL1();}

                                ),
                                Text(
                                  'Facebook',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(FontAwesomeIcons.instagram,) ,
                                  onPressed: () {_launchURL2();}

                                ),
                                Text(
                                  'Instagram',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(FontAwesomeIcons.phone,color: Colors.green,) ,
                                  onPressed:(){_launchURL4();}
                                      // Navigator.of(context).push(
                                      // MaterialPageRoute(
                                      //     builder: (_) => PaymentPage())),
                                ),
                                Text(
                                  'appeler',
                                  style: TextStyle(fontWeight: FontWeight.bold,),
                                )
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                IconButton(
                                  icon: Image.asset('assets/images/lyoomcantine.png'), onPressed: () {_launchURL3();},
                                ),
                                Text(
                                  'site web',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text('Bienvenue chez Lyoom',textAlign: TextAlign.center,style: GoogleFonts.piedra(fontSize: 25.0),),
                      subtitle: Text('Votre cantine orientale vous accueille pour vous déguster nos plats de brochettes, mezzés et casse-dalle inspirés des cuisines de toute la méditerranée dans un espace chargé de détails, de petites attentions et de nostalgie.',textAlign: TextAlign.center,style: GoogleFonts.kanit(fontSize: 17.0,fontWeight: FontWeight.bold,color: Colors.black87),),


                      ),
                    Divider(),
                    ListTile(
                      onTap: (){_launchURL5();},
                      title: Text('Ou nous  trouvez  ?'),
                      subtitle: Text('48 rue Jean Pierre Timbaud,75011 Paris.',style: TextStyle(color: Colors.blue),),
                      leading:Icon(Icons.location_on,size: 37.0,color: Colors.red,),
                      trailing: Icon(Icons.chevron_right, color: Colors.yellow),

                    ),
                    ListTile(
                      onTap: (){_launchURL6();},
                      title: Text('made with love by Octa+ technologies'),
                      leading:Image.asset('assets/images/octa.jpg'),
                      trailing: Icon(Icons.favorite, color: Colors.red),

                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
          ),
        ),
        );
  }
}
_launchURL1() async {

  const url = 'https://www.facebook.com/Lyoomcantineorientale';
  if (await canLaunch(url)) {
    await launch(url);

  } else {
    throw 'Could not launch $url';
  }
}
_launchURL2() async {

  const url = 'https://www.instagram.com/lyoom.cantine.official/?hl=fr';
  if (await canLaunch(url)) {
    await launch(url);

  } else {
    throw 'Could not launch $url';
  }
}
_launchURL3() async {

  const url = 'https://www.lyoom-cantine.com/';
  if (await canLaunch(url)) {
    await launch(url);

  } else {
    throw 'Could not launch $url';
  }
}
_launchURL4() async {

  const url = "tel://<0158303543>";
  if (await canLaunch(url)) {
    await launch(url);

  } else {
    throw 'Could not launch $url';
  }
}

_launchURL5() async {

  const url = "https://www.google.com/maps/place/Lyoom+Cantine/@48.8664343,2.3725825,17z/data=!4m5!3m4!1s0x47e66dd7d28fbcab:0x63e2dcf764351aca!8m2!3d48.8663702!4d2.3726206";
  if (await canLaunch(url)) {
    await launch(url);

  } else {
    throw 'Could not launch $url';
  }
}
_launchURL6() async {

  const url = "https://www.octaplus-technology.com/";
  if (await canLaunch(url)) {
    await launch(url);

  } else {
    throw 'Could not launch $url';
  }
}