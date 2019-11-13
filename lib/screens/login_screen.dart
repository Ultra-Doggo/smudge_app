import 'package:flutter/material.dart';
import 'package:smudge_app/components/rounded_button.dart';
import 'package:smudge_app/components/hex_converter.dart';
import 'package:smudge_app/constants.dart';
import 'package:smudge_app/screens/dashboard_screen.dart';


class LoginScreen extends StatefulWidget {

  static const id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}


class _LoginScreenState extends State<LoginScreen> {
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
                  child: Image.asset('images/placeholder_logo.png'),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Email'
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                onChanged: (value) {
                  //Do something with the user input.
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
                onPressed: () {
                  Navigator.pushNamed(context, DashboardScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
