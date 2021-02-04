import 'package:flutter/material.dart';
import 'dart:async';
import 'package:futurehouse/screen/loginscreen.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  static const String id = "splashscreen";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer _timer;

  removeScreen() {
    return _timer = Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed(LoginScreen.id);
    });
  }

  @override
  void initState() {
    super.initState();
    removeScreen();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFF36A5B2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(100.0),
              child: Image.asset(
                "images/logorumah4.jpg",
                height: 120.0,
                width: 120.0,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "Rumahkita.com",
              style: GoogleFonts.openSans(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20)
              ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              "cari rekomendasi rumah impian? disini aja!",
              style:
                GoogleFonts.openSans(color: Colors.white, fontWeight: FontWeight.normal, fontSize: 15)
            ),
            Text(
              "#SesukakuSesukamu",
              style: GoogleFonts.openSans(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13)
            ),
          ],
        ),
      ),
    )
    );
  }
}
