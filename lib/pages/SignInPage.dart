

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/animation/ScaleRoute.dart';

import 'package:flutter_app/pages/SignUpPage.dart';
import 'package:flutter_app/pages/admin/Adminpanel.dart';

import 'package:flutter_app/services/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/provider/modelHud.dart';

import 'HomePage.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  String defaultFontFamily = 'Roboto-Light.ttf';
  double defaultFontSize = 14;
  double defaultIconSize = 17;
  final GlobalKey<FormState> globalKey=GlobalKey<FormState>();
  bool obs=true;
  String email,password;
  final auth=Auth();
  final adminmail='lyoomcantine1@gmail.com';
  final adminpassword='lyoomcantine123';
  String _errorMessage(String str) {
    switch (str) {
      case 'The password is invalid or the user does not have a password.':
        return "mot de passe invalid ou l'utilisateur n'existe pas";
      case 'Password should be at least 6 characters':
        return 'le mot de passe doit au moins contenir 6 caractère';
      case 'The email address is badly formatted.':
        return 'Adresse mail non valide';
      default :
        return 'veuillez verifier votre connection ';
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 35, bottom: 30),
        width: double.infinity,
        height: double.infinity,
        color: Colors.white70,
        child:  ModalProgressHUD(
          inAsyncCall: Provider.of<modelHud>(context).isLoading ,
          child: Form(
            key:globalKey ,
            child: ListView(
                children: <Widget>[


                 Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 230,
                              height: 100,
                              alignment: Alignment.center,
                              child: Image.asset(
                                "assets/images/menus/lyoomcantine.png",
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              // ignore: missing_return
                              validator:(value) {
                                if(value.isEmpty){
                                  return 'champs E-Mail est vide';
                                  // ignore: missing_return
                                }
                              },
                              onSaved: (value){
                                email=value;
                              },
                              showCursor: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Color(0xFF666666),
                                  size: defaultIconSize,
                                ),
                                fillColor: Color(0xFFF2F3F5),
                                hintStyle: TextStyle(
                                    color: Color(0xFF666666),
                                    fontFamily: defaultFontFamily,
                                    fontSize: defaultFontSize),
                                hintText: "E-Mail",
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              // ignore: missing_return
                              validator:(value) {
                                if(value.isEmpty){
                                  return 'champs E-mail est vide';
                                  // ignore: missing_return
                                }
                              },
                              onSaved: (value){
                                password=value;
                              },
                              showCursor: true,

                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  borderSide: BorderSide(
                                    width: 0,
                                    style: BorderStyle.none,
                                  ),
                                ),
                                filled: true,
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Color(0xFF666666),
                                  size: defaultIconSize,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      if(obs)
                                        obs=false;
                                      else
                                        obs=true;
                                    });
                                  },
                                  child: Icon(
                                    Icons.remove_red_eye,
                                    color: Color(0xFF666666),
                                    size: defaultIconSize,
                                  ),
                                ),
                                fillColor: Color(0xFFF2F3F5),
                                hintStyle: TextStyle(
                                  color: Color(0xFF666666),
                                  fontFamily: defaultFontFamily,
                                  fontSize: defaultFontSize,
                                ),
                                hintText: "Mot de passe",
                              ),
                              obscureText: obs,
                            ),


                            SizedBox(
                              height: 15,
                            ),
                            Container(
                              width: double.infinity,
                              child: Text(
                                "Mot de Passe oublié?",
                                style: TextStyle(
                                  color: Color(0xFF666666),
                                  fontFamily: defaultFontFamily,
                                  fontSize: defaultFontSize,
                                  fontStyle: FontStyle.normal,
                                ),
                                textAlign: TextAlign.end,
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                      Container(
                        width: double.infinity,
                        decoration: new BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: Color(0xFFfbab66),
                            ),
                            BoxShadow(
                              color: Color(0xFFf7418c),
                            ),
                          ],
                          gradient: new LinearGradient(
                              colors: [Color(0xFFf7418c), Color(0xFFfbab66)],
                              begin: const FractionalOffset(0.2, 0.2),
                              end: const FractionalOffset(1.0, 1.0),
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                        child: Builder(
                          builder:(context)=>  MaterialButton(
                              highlightColor: Colors.transparent,
                              splashColor: Color(0xFFf7418c),
                              //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
                                child: Text(
                                  "se connecter",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontFamily: "WorkSansBold"),
                                ),
                              ),
                                onPressed: ()  {
                                validate(context);
                                  }),
                        ),
                      ),
                            SizedBox(
                              height: 50,
                            ),

                          ],
                        ),


                   Align(
                      alignment: Alignment.bottomCenter,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: Text(
                              "vous n'avez pas un comte ? ",
                              style: TextStyle(
                                color: Color(0xFF666666),
                                fontFamily: defaultFontFamily,
                                fontSize: defaultFontSize,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => {
                            Navigator.push(context, ScaleRoute(page: SignUpPage()))
                            },
                            child: Container(
                              child: Text(
                                "S'Inscrire",
                                style: TextStyle(
                                  color: Color(0xFFf7418c),
                                  fontFamily: defaultFontFamily,
                                  fontSize: defaultFontSize,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                ],
              ),
          ),
        ),
        ),

    );
  }

  Future<void> validate(BuildContext context) async {
    final _modelhud=Provider.of<modelHud>(context,listen: false);
    _modelhud.changeisloading(true);
    if(globalKey.currentState.validate()){
      globalKey.currentState.save();
      if(email==adminmail || password==adminpassword){
        try{
          final result = await auth.signin(email.trim(), password);
          _modelhud.changeisloading(false);
          Navigator.push(context, ScaleRoute(page: AdminHome()));
        }catch(e) {
          _modelhud.changeisloading(false);
          String m = e.message.toString();
          Scaffold.of(context).showSnackBar(
              SnackBar(content: Text(_errorMessage(m).toString(),
              )));
        }
      }
      else{
        try{
          final result = await auth.signin(email.trim(), password);
          _modelhud.changeisloading(false);
          Navigator.push(context, ScaleRoute(page: Home()));
        }catch(e){
          _modelhud.changeisloading(false);
          String m=e.message.toString();
          Scaffold.of(context).showSnackBar(SnackBar(content:Text(_errorMessage(m).toString(),
          )));
        }

      }



    }
    _modelhud.changeisloading(false);
  }
}


class FacebookGoogleLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  gradient: new LinearGradient(
                      colors: [
                        Colors.black12,
                        Colors.black54,
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                width: 100.0,
                height: 1.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Text(
                  "Ou",
                  style: TextStyle(
                      color: Color(0xFF2c2b2b),
                      fontSize: 16.0,
                      fontFamily: "WorkSansMedium"),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: new LinearGradient(
                      colors: [
                        Colors.black54,
                        Colors.black12,
                      ],
                      begin: const FractionalOffset(0.0, 0.0),
                      end: const FractionalOffset(1.0, 1.0),
                      stops: [0.0, 1.0],
                      tileMode: TileMode.clamp),
                ),
                width: 100.0,
                height: 1.0,
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 10.0, right: 40.0),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFf7418c),
                  ),
                  child: Icon(
                    FontAwesomeIcons.facebookF,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: GestureDetector(
                onTap: () => {},
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  decoration: new BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFf7418c),
                  ),
                  child: new Icon(
                    FontAwesomeIcons.google,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
