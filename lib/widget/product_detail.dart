import 'dart:io';
import 'package:flutter/material.dart';
import 'package:futurehouse/model/item.dart';
import 'package:futurehouse/firebase_services/firebase_services.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailPage extends StatefulWidget {
  final Item item;
  final String id;

  ProductDetailPage({@required this.item, this.id});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  TextEditingController nameController;
  TextEditingController descController;
  TextEditingController alamatController;
  TextEditingController hargaController;
  TextEditingController luasController;
  TextEditingController telpController;
  File image;

  final Color primaryColor = Color(0xFF36A5B2);
  final Color secondaryColor = Color(0xff232c51);
  final Color logoGreen = Color(0xff18203d);

  FirebaseServices _firebaseServices = FirebaseServices();
  


Future _addToCart() {
    return _firebaseServices.kontenRef
        .doc(_firebaseServices.getUserId())
        .collection("new cart")
        .doc(widget.item.id)
        .set({"name" : widget.item.name, "harga" : widget.item.harga, "image" : widget.item.image});
  }

  Future _addToSaved() {
    return _firebaseServices.kontenRef
        .doc(_firebaseServices.getUserId())
        .collection("favorit")
        .doc(widget.item.id)
        .set({"name" : widget.item.name, "harga" : widget.item.harga, "image" : widget.item.image});
  }

  final SnackBar _snackBar = SnackBar(
    content: Text("Product added to the cart"),
  );
  @override
  void initState() {
    nameController = TextEditingController();
    descController = TextEditingController();
    alamatController = TextEditingController();
    hargaController = TextEditingController();
    luasController = TextEditingController();
    telpController = TextEditingController();
    nameController.text = '';
    descController.text = '';
    alamatController.text = '';
    hargaController.text = '';
    luasController.text = '';
    telpController.text = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 35),
        color: Colors.white,
        child: Column(
          children: [
            Container(
              color: primaryColor,
              height: 50,
              padding: EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Detail Rumah',
                       style : GoogleFonts.openSans(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 18),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      child: Padding(
                        padding: EdgeInsets.all(5),
                        child: Icon(Icons.arrow_back),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 1,
              color: Colors.black,
            ),
            Expanded(
              child: ListView(
      padding: EdgeInsets.all(15),
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
  
        Padding(
          padding: const EdgeInsets.only(
            top: 10.0,
            left: 10.0,
            right: 10.0,
            bottom: 10.0,
          ),
          child: Text(
            widget.item.name,
            textAlign: TextAlign.center,
            style : GoogleFonts.openSans(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10.0,
          ),
          child: Text(
            "Desc : "+ widget.item.desc,
           textAlign: TextAlign.justify,
            style : GoogleFonts.openSans(
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10.0,
          ),
          child: Text(
            "Harga :  "+widget.item.harga,
            textAlign: TextAlign.left,
            style : GoogleFonts.openSans(
                        color: Colors.blue,
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10.0,
          ),
          child: Text(
            "Lokasi : "+widget.item.alamat,
            textAlign: TextAlign.left,
            style : GoogleFonts.openSans(
                        color: Colors.deepPurple,
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10.0,
          ),
          child: Text(
            "Luas  : "+widget.item.luas,
            textAlign: TextAlign.left,
            style : GoogleFonts.openSans(
                        color: Colors.indigoAccent,
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 10.0,
          ),
          child: Text(
            "Telp.  : "+widget.item.telp,
            textAlign: TextAlign.left,
            style : GoogleFonts.openSans(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.normal,
                        fontSize: 15),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () async {
                              await _addToSaved();
                              Scaffold.of(context).showSnackBar(_snackBar);
                            },
                child: Container(
                  width: 65.0,
                  height: 65.0,
                  decoration: BoxDecoration(
                    color: Color(0xFFDCDCDC),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                    "images/love.png",
                    height: 65.0,
                    width: 65.0,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () async {
                                await _addToCart();
                                Scaffold.of(context).showSnackBar(_snackBar);
                              },
                  child: Container(
                    height: 65.0,
                    margin: EdgeInsets.only(
                      left: 16.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      "Add To Cart",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    ),
            ),
          ],
      )
),
);

  }
}
