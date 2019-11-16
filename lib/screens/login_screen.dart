import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:smudge_app/components/rounded_button.dart';
import 'package:smudge_app/components/hex_converter.dart';
import 'package:smudge_app/constants.dart';
import 'package:smudge_app/screens/dashboard_screen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';


final FirebaseDatabase database = FirebaseDatabase.instance;


class LoginScreen extends StatefulWidget {

  static const id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {

  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(hexConvert('#33135c')),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 30.0,
              ),
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/banner_logo.png'),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Email'
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                obscureText: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Password'
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              RoundedButton(
                title: 'Login',
                color: Color(hexConvert('#e80074')),
                onPressed: () async {
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password
                    );
                    if (user != null) {
                      Navigator.pushNamed(context, DashboardScreen.id);
                    }
                  }
                  catch (e) {
                    print(e);
                  }





                  // TODO : need to validate the login before going to dash
                  //Navigator.pushNamed(context, DashboardScreen.id);

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
