import 'package:flutter/material.dart';
import 'package:smudge_app/components/rounded_button.dart';
import 'package:smudge_app/components/hex_converter.dart';
import 'package:smudge_app/constants.dart';
import 'package:smudge_app/screens/canvas_screen.dart';



class DashboardScreen extends StatefulWidget {

  static const id = 'dashboard_screen';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(hexConvert('#237A57')),
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
              RoundedButton(
                title: 'Offline Draw',
                color: Color(hexConvert('#fdbb2d')),
                onPressed: () {
                  Navigator.pushNamed(context, CanvasScreen.id);
                },
              ),
              RoundedButton(
                title: 'Host Lobby',
                color: Color(hexConvert('#b21f1f')),
                onPressed: () {
                  //TODO: change this to be an ONLINE canvas screen
                  Navigator.pushNamed(context, CanvasScreen.id);
                },
              ),
              RoundedButton(
                title: 'Join Lobby',
                color: Color(hexConvert('#1a2a6c')),
                onPressed: () {
                  //TODO: display a popup window, for User to enter lobby code
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

