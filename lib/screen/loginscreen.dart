import 'package:flutter/material.dart';
import 'package:futurehouse/nav/buttomnav.dart';
import 'package:futurehouse/screen/registerscreen.dart';
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

final _auth = FirebaseAuth.instance;

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
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
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
                height: 20,
              ),
              Text(
                "Sign In to Rumahkita.com",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Please Enter your email and password below to continue to the Rumahkita.com begin!",
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 15),
              ),
              _formBuilder(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _formBuilder() {
    return Form(
      key: formKey,
      // autovalidate: true,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: nameController,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: Colors.black),
              onChanged: (value) {
                email = value;
              },
              onSaved: (value) {
                email = value;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter an email using @.com';
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.pink, width: 10)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.5)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.5)),
                labelText: 'Email',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextFormField(
              controller: passwordController,
              obscureText: true,
              style: TextStyle(color: Colors.black),
              onChanged: (value) {
                password = value;
              },
              onSaved: (value) {
                password = value;
              },
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter an password';
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.5)),
                labelText: 'Password',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
                SizedBox(height: 20),
                 RaisedButton(
            onPressed: () async {
              if (formKey.currentState.validate()) {
                setState(() {
                      showProgress = true;
                    });
                    try {
                      final newUser = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      print(newUser.toString());
                      if (newUser != null) {
                       Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Buttomnav()),
                    );
                        setState(() {
                          showProgress = false;
                        });
                      }
                    } catch (e) {
                      print(e.toString());
                  return null;
                    }
              }
            },
            color: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.07,
              child: Center(
                child: Text(
                  'Login',
                  style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          ),
                SizedBox(height: 20),
                MaterialButton(
                  padding: EdgeInsets.symmetric(horizontal: 20),
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
                          style: GoogleFonts.openSans(
                    color: Colors.white,
                    fontSize: 20),
              ),
                    ],
                  ),
                  textColor: Colors.white,
                ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Don't you have an account?",
                style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
              InkWell(
                child: FlatButton(
                  child: Text(
                    'Register',
                    style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        decoration: TextDecoration.underline),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => RegisterScreen()));
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
