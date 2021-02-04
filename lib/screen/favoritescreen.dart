import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:futurehouse/widget/product_detail.dart';
import 'package:futurehouse/firebase_services/firebase_services.dart';
import 'package:futurehouse/widget/cart_page.dart';
import 'package:futurehouse/model/item.dart';


class FavoriteScreen extends StatefulWidget {
  static const String id = "favoritescreen";
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {

final Color primaryColor = Color(0xFF36A5B2);
  final Color secondaryColor = Color(0xff232c51);
  final Color logoGreen = Color(0xff18203d);

   final FirebaseServices _firebaseServices = FirebaseServices();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
         FutureBuilder<QuerySnapshot>(
            future: _firebaseServices.kontenRef.get(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${snapshot.error}"),
                  ),
                );
              }

              // Collection Data ready to display
              if (snapshot.connectionState == ConnectionState.done) {
                // Display the data inside a list view
                return ListView(
                  padding: EdgeInsets.only(
                    top: 108.0,
                    bottom: 12.0,
                  ),
                  children: snapshot.data.docs.map((document)  {
                     Item item = Item(
                        id: document['id'],
                        name: document['name'],
                        image: document['image'],
                        alamat : document['alamat'],
                        harga : document['harga'],
                        luas: document['luas'],
                        desc: document['desc'],
                        telp: document['telp'],
                      );
                       return InkWell(
                        child: CartPage(item: item),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailPage(
                                item: item,
                                id: document.id,
                              ),
                            ),
                          );
                        },
                      );
                  }).toList(),
                );
              }

              // Loading State
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),

        ],
      ),
    );
  }
}