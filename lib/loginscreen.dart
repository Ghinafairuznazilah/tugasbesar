import 'package:flutter/material.dart';
import 'package:futurehouse/buttomnav.dart';
import 'package:futurehouse/registerscreen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'dart:async';

class LoginScreen extends StatefulWidget {
  static const String id = "loginscreen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';
  
  final Color primaryColor = Color(0xFF36A5B2);
  final Color secondaryColor = Color(0xff232c51);
  final Color logoGreen = Color(0xff18203d);

  TextEditingController nameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  bool showProgress = false;

  final formKey = new GlobalKey<FormState>();

  Future<String> signInWithGoogle() async {
    await Firebase.initializeApp();

    final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential authResult =
        await firebaseAuth.signInWithCredential(credential);
    final User user = authResult.user;

    if (user != null) {
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final User currentUser = firebaseAuth.currentUser;
      assert(user.uid == currentUser.uid);

      print('signInWithGoogle succeeded: $user');

      return '$user';
    }

    return null;
  }

  Future<void> signOutGoogle() async {
    await googleSignIn.signOut();

    print("User Signed Out");
  }

  @override
  Widget build(BuildContext context) {
     return new SafeArea(
    child : Scaffold(
        backgroundColor: primaryColor,
        body: Container(
          alignment: Alignment.topCenter,
          margin: EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: Image.asset(
                    "images/logorumah4.jpg",
                    height: 100.0,
                    width: 100.0,
                    fit: BoxFit.fill,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Sign in to Rumahkita.com',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.openSans(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(height: 8),
                Text(
                  'Enter your email and password below to continue to the Rumahkita.com begin!',
                  textAlign: TextAlign.center,
                  style:
                      GoogleFonts.openSans(color: Colors.white, fontSize: 13),
                ),
                SizedBox(
                  height: 20,
                ),
                _buildTextField(
                    nameController, Icons.account_circle, 'Username'),
                SizedBox(height: 20),
                _buildTextField(passwordController, Icons.lock, 'Password'),
                SizedBox(height: 20),
                MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 50,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Buttomnav()),
                        (Route<dynamic> route) => false);
                  },
                  color: logoGreen,
                  child: Text('Login',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  textColor: Colors.white,
                ),
                SizedBox(height: 20),
                MaterialButton(
                  elevation: 0,
                  minWidth: double.maxFinite,
                  height: 50,
                  onPressed: () {
                    signInWithGoogle().then((result) {
                      if (result != null) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return Buttomnav();
                            },
                          ),
                        );
                      }
                    });
                  },
                  color: Colors.blue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(FontAwesomeIcons.google),
                      SizedBox(width: 10),
                      Text('Sign-in using Google',
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ],
                  ),
                  textColor: Colors.white,
                ),
                SizedBox(height: 5),
                Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Text(
          "Don't you have an account?",
          style:
                      GoogleFonts.openSans(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
          ),
          InkWell(
            child: FlatButton(
              child: Text(
                'Register',
                style:
                      GoogleFonts.openSans(color: Colors.white, fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline, fontSize: 15), 
              ),
              onPressed: (
              ) {
                Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RegisterScreen()));
              },
            ),
          )
          ],
          ),
              ],
            ),
        )
        )
     );
  }

  _buildTextField(
      TextEditingController controller, IconData icon, String labelText) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: secondaryColor, border: Border.all(color: Colors.blue)),
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.white),
            icon: Icon(
              icon,
              color: Colors.white,
            ),
            // prefix: Icon(icon),
            border: InputBorder.none),
      ),
    );
  }
}
