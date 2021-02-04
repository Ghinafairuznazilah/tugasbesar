import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:futurehouse/screen/accountscreen.dart';
import 'package:futurehouse/screen/jualscreen.dart';
import 'package:futurehouse/screen/homescreen.dart';
import 'package:google_fonts/google_fonts.dart';

class Buttomnav extends StatefulWidget {
  static const String id = "buttomnav";
  @override
  _ButtomnavState createState() => _ButtomnavState();
}

class _ButtomnavState extends State<Buttomnav> {

  final Color primaryColor = Color(0xFF36A5B2);
  final Color secondaryColor = Color(0xff232c51);
  final Color logoGreen = Color(0xff18203d);

  int selectedPage = 2;

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
     title: 
     Text( 'Rumahkita.com',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.openSans(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                ),
     elevation: 0,
     backgroundColor: primaryColor,
     centerTitle: true,
),
body: [
  HomeScreen(),
  JualScreen(),
  AccountScreen()
]
[selectedPage],
        bottomNavigationBar: ConvexAppBar(
          style: TabStyle.fixedCircle,
          backgroundColor:  primaryColor,
          items: [
            TabItem(
              icon: Icons.home,
              title:'Home',
              ),
              TabItem(
              icon: Icons.add,
              title:'Jual',
              ),
              TabItem(
              icon: Icons.account_circle,
              title:'Account',
              ),
          ],
          initialActiveIndex: 2,
          onTap: (int i){
            setState(() {
              selectedPage = i;
            });

          },
          ),
      ),
    );

  }
}