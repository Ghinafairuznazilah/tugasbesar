import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:futurehouse/screen/accountscreen.dart';
import 'package:futurehouse/nav/buttomnav.dart';
import 'package:futurehouse/screen/favoritescreen.dart';
import 'package:futurehouse/screen/shopscreen.dart';
import 'package:futurehouse/screen/jualscreen.dart';
import 'package:futurehouse/screen/splashscreen.dart';
import 'package:futurehouse/screen/loginscreen.dart';
import 'package:futurehouse/screen/homescreen.dart';
import 'package:futurehouse/screen/registerscreen.dart';



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
        AccountScreen.id: (context) => AccountScreen(),
        FavoriteScreen.id: (context) => FavoriteScreen(),
        ShopScreen.id: (context) => ShopScreen(),
        JualScreen.id: (context) => JualScreen(),
        
      },
    );
  }
}
