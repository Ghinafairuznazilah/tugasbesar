import 'package:flutter/material.dart';
import 'package:futurehouse/screen/edit_item_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:futurehouse/model/item.dart';
import 'package:futurehouse/widget/card_item.dart';


class JualScreen extends StatefulWidget {
  static const String id = "jualcreen";
  @override
  _JualScreenState createState() => _JualScreenState();
}

class _JualScreenState extends State<JualScreen> {

final Color primaryColor = Color(0xFF36A5B2);
  final Color secondaryColor = Color(0xff232c51);
  final Color logoGreen = Color(0xff18203d);

   @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
     return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => EditItemPage(
                            item: null,
                          ),
                          ));
        },
        child: Icon(Icons.add),
        backgroundColor: secondaryColor ,
      ),
      body: Container(
        padding: EdgeInsets.only(
          top : 0,
        ),
              color: Colors.white,
              child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection('item').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return ListView(
                    scrollDirection: Axis.vertical,
                    children: snapshot.data.docs.map((document) {
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
                        child: CardItem(item: item),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditItemPage(
                                item: item,
                                id: document.id,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  );
                },
              ),
        
      ),
     );
  }

}