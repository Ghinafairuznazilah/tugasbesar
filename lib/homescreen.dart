import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  static const String id = "homescreen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   @override
  Widget build(BuildContext context) {

    Widget namaSection = Container(
      padding: EdgeInsets.only(top: 16),
      child: Text(
        'Welcome user, your email : ghina@gmail.com.',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ); 


    Widget imageSection = Container(
      child: Image.asset('images/logorumah4.jpg'),
    );

    Widget titleSection = Container(
      padding: EdgeInsets.only(top: 16),
      child: Text(
        'Mathematic book kurikulum 2013',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ); 

    Widget descriptionSection = Container(
      padding: EdgeInsets.all(16),
      child: Text(
          'yuk belajar matematika, matematika itu mudah loh.'
          'Buku ini terdiri dari 7 bab, yang berisi materi-materi mtk dasar '
          'diterbitkan tanggal 4 desember 2020',
          textAlign: TextAlign.justify,
        )
    );

    Widget rateSection = Row(
      children: <Widget>[
        Icon(Icons.star, color: Colors.yellow),
        Icon(Icons.star, color: Colors.yellow),
        Icon(Icons.star, color: Colors.yellow),
        Icon(Icons.star, color: Colors.yellow),
        Icon(Icons.star),
      ],
    );

    Widget reviewSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        rateSection,
        Text('170 Reviews'),
      ],
    );

    Widget menuSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _buildMenuSection(
          Icons.bookmark,
          "Save", 
          "can be save until 30day"
          ),
          _buildMenuSection(
          Icons.done,
          "selesai membaca", 
          "388 halaman"
          ),
          _buildMenuSection(
          Icons.info,
          "info", 
          "click for more info"
          ),
      ],
    ); 

    return MaterialApp(
      title: 'Material Apps',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Icon(Icons.arrow_back_ios, color: Colors.black),
          title: Text(
            'Learn Layouting',
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            Icon(Icons.search, color: Colors.black,)
          ],
        ),
        body: ListView(
          children: [
            namaSection,
            imageSection,
            titleSection,
            descriptionSection,
            Container(
              padding: EdgeInsets.only(bottom: 24),
              child: reviewSection,
            ),
            menuSection,
          ],
        ),
      ),
    );
  }
}

Widget _buildTextSection(
  String text, 
  double textSize,
  double paddingTop,
) {
  return Container(
    padding: EdgeInsets.only(top: paddingTop),
    child: Text(
      text,
      style: TextStyle(
        fontSize: textSize,
      ),
    ),
  );
}

Widget _buildMenuSection(
  IconData iconData,
  String title,
  String timestamp,
) {

  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(iconData),
      _buildTextSection(title, 16, 8),
      _buildTextSection(timestamp, 12, 12),
    ],
  );
}