import 'package:flutter/material.dart';
import 'package:smudge_app/screens/login_screen.dart';
import 'package:smudge_app/screens/canvas_screen.dart';
import 'package:smudge_app/screens/registration_screen.dart';
import 'package:smudge_app/screens/welcome_screen.dart';
import 'package:whiteboardkit/whiteboardkit.dart';

void main() => runApp(DrawingTest());

class DrawingTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      */
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        CanvasScreen.id: (context) => CanvasScreen(),
      },


    );
  }
}