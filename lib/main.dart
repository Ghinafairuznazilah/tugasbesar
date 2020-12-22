import 'package:flutter/material.dart';
import 'package:futurehouse/splashscreen.dart';
import 'package:futurehouse/loginscreen.dart';
import 'package:futurehouse/homescreen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rumahkita.com',
      home : SplashScreen(),
      theme: ThemeData(
        primaryColor: Color(0xFF2196F3),
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        HomeScreen.id: (context) => HomeScreen(),
      
      },
    );
  }
}
