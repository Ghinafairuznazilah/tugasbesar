import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:futurehouse/model/item.dart';

class CartPage extends StatefulWidget {
  final Item item;

  CartPage({@required this.item});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  

   @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
      ),
      height: 300.0,
      margin: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 12.0,
      ),
      child: Stack(
        children: [
          Container(
            height: 250.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: widget.item.image.isNotEmpty
                  ? Image.network(
                      widget.item.image,
                      height: 200,
                      width: 500,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      "images/logorumah4.jpg",
                      height: 200,
                      width: 500,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.item.name,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.openSans(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  Text(
                    widget.item.harga,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.openSans(
                        color: Theme.of(context).accentColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 15),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  
}
