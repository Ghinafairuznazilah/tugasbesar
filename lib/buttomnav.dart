import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';


class Buttomnav extends StatefulWidget {
  static const String id = "buttomnav";
  @override
  _ButtomnavState createState() => _ButtomnavState();
}

class _ButtomnavState extends State<Buttomnav> {
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar : AppBar(
          title : Text('Rumahkita.com')
        ),
        bottomNavigationBar: ConvexAppBar(
          items: [
            TabItem(
              icon: Icons.home,
              title:'Home',
              ),
            TabItem(
              icon: Icons.store,
              title:'Iklan Saya',
              ),
              TabItem(
              icon: Icons.add,
              title:'Jual',
              ),
              TabItem(
              icon: Icons.favorite,
              title:'Favorite',
              ),
              TabItem(
              icon: Icons.account_circle,
              title:'Akun saya',
              ),
          ],
          ),
      ),
    );

  }
}