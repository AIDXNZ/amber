import 'dart:ui';
import 'package:aiapp/Screens/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'ChatScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scoped_model/scoped_model.dart';
import './MainModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Homescreen extends StatelessWidget {
  static const fontFam = 'Montserrat';

  final Color prim1 = new Color(0xFF671fd0);
  final Color sec1 = new Color(0xFF2e00a1);
  final Color prim2 = new Color(0xFF2e00a1);
  final Color sec2 = new Color(0xFFFF1D61);

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: MainModel(),
      child: new Scaffold(
        backgroundColor: Colors.indigo[10],
        floatingActionButton: new FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChatScreen()),
            );
          },
          child: new Icon(Icons.chat),
          backgroundColor: new Color(0xFF671fd0),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: new BottomAppBar(
          elevation: 10.0,
          color: Colors.white,
          notchMargin: 10.0,
          shape: new CircularNotchedRectangle(),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              new IconButton(
                icon: Icon(Icons.bubble_chart),
                color: new Color(0xFF2e00a1),
                iconSize: 28.0,
                alignment: Alignment.centerLeft,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dashboard()),
                  );
                },
              ),
              ScopedModelDescendant<MainModel>(
                  builder: (context, child, model) {
                return new IconButton(
                  icon: Icon(Icons.search),
                  color: prim1,
                  iconSize: 28.0,
                  alignment: Alignment.centerLeft,
                  onPressed: () => model.setMethod('Ass Fuck'),
                );
              }),
            ],
          ),
        ),
        body: new Stack(children: <Widget>[
          new SafeArea(
            top: true,
            child: new Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      FadeAnimatedTextKit(
                        duration: Duration(milliseconds: 5000),
                        isRepeatingAnimation: false,
                        text: ["Hello!", "Let's Talk", "Home"],
                        textStyle: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat'),
                      ),
                    ],
                  ),
                ),
                new SizedBox(
                  height: 50.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                                          children:<Widget>[
                                            new SpinKitPulse(
                                              color: Colors.pink,
                                            ),
                                            new Material(
                        borderRadius: BorderRadius.circular(10.0),
                        elevation: 0.0,
                        shadowColor: Color(0xFFFFAFBD),
                        child: new Container(
                          height: 100.0,
                          width: 300.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                new BoxShadow(
                                    color: Color(0xFFFFAFBD),
                                    offset: new Offset(0.0, 10.0),
                                    blurRadius: 10.0,
                                    spreadRadius: 1.0)
                              ],
                              gradient: LinearGradient(
                                  colors: [Color(0xFFffc3a0), Color(0xFFFFAFBD)]),
                              ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                ScopedModelDescendant<MainModel>(
                                    builder: (context, child, model) {
                                  return typeWriterText();
                                }),
                              ],
                            ),
                          ),
                        ),
                      )
                                          ] ,
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

final typeWriterText = () => ScopedModelDescendant<MainModel>(
    builder: (context, child, model) => new TypewriterAnimatedTextKit(
          isRepeatingAnimation: false,
          duration: Duration(seconds: 5),
          text: [
            "Hello ${model.user} how are you feeling today?",
          ],
          textStyle: TextStyle(
              fontSize: 24.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: 'Montserrat'),
        ));
