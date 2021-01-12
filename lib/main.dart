import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:futurehouse/buttomnav.dart';
import 'package:futurehouse/splashscreen.dart';
import 'package:futurehouse/loginscreen.dart';
import 'package:futurehouse/homescreen.dart';
import 'package:futurehouse/registerscreen.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
runApp(MyApp());
}

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
        RegisterScreen.id: (context) => RegisterScreen(),
        Buttomnav.id: (context) => Buttomnav(),
      },
    );
  }
}
