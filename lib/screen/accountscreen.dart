import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:futurehouse/screen/loginscreen.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountScreen extends StatefulWidget {
  static const String id = "accountscreen";
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  final Color primaryColor = Color(0xFF36A5B2);
  final Color secondaryColor = Color(0xff232c51);
  final Color logoGreen = Color(0xff18203d);

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          children: [
            ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.asset(
                    "images/download.png",
                    height: 80.0,
                    width: 80.0,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                  ),
                ),
               SizedBox(
              height: 5,
            ), 
               Text(
                  'User',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.openSans(color: Colors.black, fontWeight: FontWeight.normal, fontSize: 15),
                ), 
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
                  style:  GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildAccountOptionRow(context, "Change password"),
            buildAccountOptionRow(context, "Pencarian Peta"),
            buildAccountOptionRow(context, "Syarat Penggunaan"),
            buildAccountOptionRow(context, "Tentang kami"),
            buildAccountOptionRow(context, "Privacy and security"),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(
                  Icons.volume_up_outlined,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Notifications",
                  style: GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 15),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            buildNotificationOptionRow("New for you", true),
            buildNotificationOptionRow("Account activity", true),
            buildNotificationOptionRow("Opportunity", false),
            SizedBox(
              height: 25,
            ),
            Center(
              child: OutlineButton(
                padding: EdgeInsets.symmetric(horizontal: 40),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                   Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                        (Route<dynamic> route) => false);
                },
                child: Text("SIGN OUT",
                    style: 
                    GoogleFonts.openSans(fontWeight: FontWeight.bold, fontSize: 16,letterSpacing: 2.2, color: Colors.black),
  
              ),
            )
            )
          ],
        ),
      ),
    );
  }

  Row buildNotificationOptionRow(String title, bool isActive) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: 
             GoogleFonts.openSans(
                fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              value: isActive,
              onChanged: (bool val) {},
            ))
      ],
    );
  }

  GestureDetector buildAccountOptionRow(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(title),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Option 1"),
                    Text("Option 2"),
                    Text("Option 3"),
                  ],
                ),
                actions: [
                  FlatButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close")),
                ],
              );
            });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: 
             GoogleFonts.openSans(
                fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
  
}
