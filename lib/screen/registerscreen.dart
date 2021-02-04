import 'package:flutter/material.dart';
import 'package:futurehouse/screen/loginscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  static const String id = "registerscreen";
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool showProgress = false;
  String email, password;

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  final _auth = FirebaseAuth.instance;

  final formKey = new GlobalKey<FormState>();

  final Color primaryColor = Color(0xFF36A5B2);
  final Color secondaryColor = Color(0xff232c51);
  final Color logoGreen = Color(0xff18203d);

  void _tampilkanalert() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Container(
        height: 25.0,
        child: new Center(
          child: new Text("Register Gagal"),
        ),
      ),
    );
    showDialog(context: context, child: alertDialog);
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
                "Sign Up to Rumahkita.com",
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
              controller: emailController,
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
          RaisedButton(
            onPressed: () async {
              if (formKey.currentState.validate()) {
                setState(() {
                  showProgress = true;
                });
                try {
                  final newuser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if (newuser != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                    setState(() {
                      showProgress = false;
                    });
                  }
                } catch (e) {
                  print(e.toString());
                  return null;
                }
              } else {
                _tampilkanalert();
              }
            },
            color: Colors.black,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.07,
              child: Center(
                child: Text(
                  'Register',
                  style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Do you have an account?',
                style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 18),
              ),
              InkWell(
                child: FlatButton(
                  child: Text(
                    'Login',
                    style: GoogleFonts.openSans(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 18,
                        decoration: TextDecoration.underline),
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginScreen()));
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
