import 'package:flutter/material.dart';
import 'package:futurehouse/homescreen.dart';

class LoginScreen extends StatefulWidget {
  static const String id = "loginscreen";
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = 'user@gmail.com';
  String password = '123456';

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final formKey = new GlobalKey<FormState>();

  void _tampilkanalert() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Container(
        height: 50.0,
        child: new Center(
          child: new Text("login gagal. email/password salah"),
        ),
      ),
    );
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF36A5B2),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(100.0),
                child: Image.asset(
                  "images/logorumah4.jpg",
                  height: 120.0,
                  width: 120.0,
                  fit: BoxFit.fill,
                ),
              ),
            Text(
              "Rumahkita.com",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            Text(
              "Selamat Datang, silahkan masuk",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 15.0,
              ),
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
              validator: (value) {
                return value.isEmpty ? "email tidak boleh kosong" : null;
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
              validator: (value) {
                return value.isEmpty ? "password tidak boleh kosong" : null;
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
            onPressed: () {
              if (formKey.currentState.validate() &&
                  emailController.text.toString() == email &&
                  passwordController.text.toString() == password) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                    (Route<dynamic> route) => false);
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
                  'Login',
                  style: TextStyle(fontSize: 24, color: Colors.white),
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
          'Belum punya akun?',
          style: TextStyle(
               fontWeight: FontWeight.normal,
              color: Colors.black,
              fontSize: 18.0,
            ),
          ),
          SizedBox(width: 3.0),
          InkWell(
            child: FlatButton(
              child: Text(
                'Register here',
                style: TextStyle(
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              onPressed: () {},
            ),
          )
          ],
          )
        ],
      ),
    );
  }
}
