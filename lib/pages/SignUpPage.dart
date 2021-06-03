import 'package:flutter/material.dart';
import 'package:flutter_app/animation/ScaleRoute.dart';
import 'package:flutter_app/pages/HomePage.dart';
import 'package:flutter_app/pages/SignInPage.dart';
import 'package:flutter_app/provider/modelHud.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:provider/provider.dart';


class SignUpPage extends StatelessWidget {
  String defaultFontFamily = 'Roboto-Light.ttf';
  double defaultFontSize = 14;
  double defaultIconSize = 17;
  final GlobalKey<FormState> globalKey=GlobalKey<FormState>();
   String  _email,_password;
  final auth=Auth();
  String _errorMessage(String str) {
    switch (str) {
      case 'The email address is already in use by another account.':
        return 'Cette adresse mail est déja utilisé';
      case 'Password should be at least 6 characters':
        return 'le mot de passe doit au moins contenir 6 caractère';
      case 'The email address is badly formatted.':
        return 'Adresse mail non valide';
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
          child: ModalProgressHUD(
            inAsyncCall: Provider.of<modelHud>(context).isLoading ,
            child: Form(
              key:globalKey ,
              child: ListView(
                children: <Widget>[
                 InkWell(
                      child: Container(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Icon(Icons.close),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),

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
                        Row(
                          children: <Widget>[
                            Flexible(
                              flex: 1,
                              child: TextFormField(
                                validator:(value) {
                                  if(value.isEmpty){
                                    return 'champs Nom est vide';
                                  // ignore: missing_return
                                  }

                                },
                                showCursor: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFF2F3F5),
                                  hintStyle: TextStyle(
                                    color: Color(0xFF666666),
                                    fontFamily: defaultFontFamily,
                                    fontSize: defaultFontSize,
                                  ),
                                  hintText: "Nom",
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Flexible(
                              flex: 1,
                              child: TextFormField(
                                validator:(value) {
                                  if(value.isEmpty){
                                    return 'champs Prénom est vide';
                                  // ignore: missing_return
                                  }

                                },

                                showCursor: true,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10.0)),
                                    borderSide: BorderSide(
                                      width: 0,
                                      style: BorderStyle.none,
                                    ),
                                  ),
                                  filled: true,
                                  fillColor: Color(0xFFF2F3F5),
                                  hintStyle: TextStyle(
                                    color: Color(0xFF666666),
                                    fontFamily: defaultFontFamily,
                                    fontSize: defaultFontSize,
                                  ),
                                  hintText: "Prénom",
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          validator:(value) {
                            if(value.isEmpty){
                              return 'champs E-MAIL est vide';
                            // ignore: missing_return
                            }

                          },
                          onSaved: (value){
                            _email=value;
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
                          validator:(value) {
                            if(value.isEmpty){
                              return 'champs Mot de Passe est vide';
                            // ignore: missing_return
                            }

                          },
                          onSaved: (value){
                            _password =value;
                          },
                          showCursor: true,
                          obscureText: true,
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
                              Icons.lock,
                              color: Color(0xFF666666),
                              size: defaultIconSize,
                            ),

                            fillColor: Color(0xFFF2F3F5),
                            hintStyle: TextStyle(
                              color: Color(0xFF666666),
                              fontFamily: defaultFontFamily,
                              fontSize: defaultFontSize,
                            ),
                            hintText: "Mot de passe",
                          ),
                        ),
                        SizedBox(
                          height: 10,
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
                        builder:(context)=>MaterialButton(
                            highlightColor: Colors.transparent,
                            splashColor: Color(0xFFf7418c),
                            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(vertical: 10.0, horizontal: 42.0),
                              child: Text(
                                "Créer",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                    fontFamily: "WorkSansBold"),
                              ),
                            ),
                            onPressed: () async {
                              final _modelhud=Provider.of<modelHud>(context,listen: false);
                              _modelhud.changeisloading(true);
                              if(globalKey.currentState.validate()){
                                globalKey.currentState.save();

                                try{
                                  final result = await auth.signup(_email.trim(), _password);
                                  _modelhud.changeisloading(false);
                                  Navigator.push(context, ScaleRoute(page: Home()));
                                }catch(e){
                                  _modelhud.changeisloading(false);
                                  String m=e.message.toString();
                                  Scaffold.of(context).showSnackBar(SnackBar(content:Text(_errorMessage(m).toString(),
                                  )));
                                }

                              }
                              _modelhud.changeisloading(false);
                            }),
                      ),
                    ),
                        SizedBox(
                          height: 10,
                        ),
                        FacebookGoogleLogin()
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
                              "vous avez dejà un compte? ",
                              style: TextStyle(
                                color: Color(0xFF666666),
                                fontFamily: defaultFontFamily,
                                fontSize: defaultFontSize,
                                fontStyle: FontStyle.normal,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, ScaleRoute(page: SignInPage()));
                            },
                            child: Container(
                              child: Text(
                                "se connecter",
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
}
