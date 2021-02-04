import 'package:flutter/material.dart';
import 'package:futurehouse/model/item.dart';
import 'package:google_fonts/google_fonts.dart';

class CardItem extends StatefulWidget {
  final Item item;

  CardItem({@required this.item});

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width : 500,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: Colors.lightBlue,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
            ),
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
          Padding(
            padding: const EdgeInsets.all(5),
            child: Align(
              alignment: Alignment.bottomLeft,
            child: Text(
              widget.item.name,
              style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
            ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Align(
              alignment: Alignment.bottomLeft,
            child: Text(
              widget.item.luas,
              style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
              maxLines: 3,
            ),
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(5),
            child: Align(
              alignment: Alignment.bottomLeft,
            child: Text(
              widget.item.harga,
              style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
              maxLines: 3,
            ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
             child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                widget.item.alamat,
                      style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
              ),
             )
            ),
          Padding(
            padding: const EdgeInsets.all(5),
             child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                widget.item.telp,
                      style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
              ),
             )
            ),
        ],
      ),
    );
  }
}
