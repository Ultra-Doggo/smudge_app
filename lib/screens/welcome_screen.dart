import 'package:flutter/material.dart';
import 'package:smudge_app/screens/login_screen.dart';
import 'package:smudge_app/screens/registration_screen.dart';
import 'package:smudge_app/components/rounded_button.dart';
import 'package:smudge_app/components/hex_converter.dart';
// import 'package:animated_text_kit/animated_text_kit.dart';


class WelcomeScreen extends StatefulWidget {

  static String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();

}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation animation;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.blueGrey[600],
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            //stops: [],
            colors: [
              Color(hexConvert('#0c0931')),
              Color(hexConvert('#00cfe5'))
            ]
          )
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[

                Text(
                  'Smüdge',
                  style: TextStyle(
                    fontSize: 66.0,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  )
                ),
                /*
                ColorizeAnimatedTextKit(
                  text: ['Smudge'],
                  colors: [
                    Colors.redAccent,
                    Colors.amber,
                    Colors.greenAccent,
                    Colors.lightBlueAccent,
                    Colors.purple,
                    Colors.pinkAccent,
                  ],

                  textStyle: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.start,
                  alignment: Alignment.center,
                ),
                */
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/placeholder_logo.png'),
                    height: 75.0,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              title: 'Log In',
              color: Color(hexConvert('#e80074')),
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
            RoundedButton(
              title: 'Register',
              color: Color(hexConvert('#c200db')),
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}