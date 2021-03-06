import 'package:flutter/material.dart';
import 'dart:async';
import "homeScreen.dart";

void main() => runApp(Covid());

class Covid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //heme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: new SplashScreen(),
      theme: ThemeData(
        primaryColor: Colors.black,
        fontFamily: 'Orbitron',
        backgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          color: Colors.black,
          iconTheme: IconThemeData(
            color: Colors.blueAccent
          ),
          brightness: Brightness.dark
        )
      ),
      routes: <String, WidgetBuilder>{
        '/HomeScreen': (BuildContext context) => new HomePage()
      },
    );
  }
}
class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed('/HomeScreen');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black54,
      body: new Center(
        child: Text("COVID-19",style: TextStyle(
          fontFamily: 'Orbitron',
          color: Colors.white
        ),),
      ),
    );
  }
}