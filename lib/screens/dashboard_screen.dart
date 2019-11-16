import 'package:flutter/material.dart';
import 'package:smudge_app/components/rounded_button.dart';
import 'package:smudge_app/components/hex_converter.dart';
import 'package:smudge_app/constants.dart';
import 'package:smudge_app/screens/canvas_screen.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:smudge_app/screens/welcome_screen.dart';
import 'package:sync/sync.dart';
import 'dart:async';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = GoogleSignIn();

final FirebaseDatabase database = FirebaseDatabase.instance;



class DashboardScreen extends StatefulWidget {

  static const id = 'dashboard_screen';

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  // check to see if there is a current user who is signed in
  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();

      if (user != null) {
        // then we have a currently signed in user
        loggedInUser = user;
        //print(loggedInUser.email); // testing purposes
      }
    }
    catch(e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(hexConvert('#04005E')),
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
              RoundedButton(
                title: 'Offline Draw',
                color: Color(hexConvert('#E92FFB')),
                onPressed: () {
                  Navigator.pushNamed(context, CanvasScreen.id);
                },
              ),
              RoundedButton(
                // TODO: change back to host lobby
                title: 'Write to DB',
                color: Color(hexConvert('#FF217A')),
                onPressed: () {
                  //TODO: change this to be an ONLINE canvas screen
                  //Navigator.pushNamed(context, CanvasScreen.id);

                  String fName = 'tedtest';
                  String lName = 'not!';
                  int myAge = 23;

                  //testing database write:
                  database.reference().child("message").set({
                    "firstname" : fName,
                    "lastname" : lName,
                    "age" : myAge,
                  });

                },
              ),
              RoundedButton(
                // TODO: change title back to join lobby
                title: 'Read from DB',
                color: Color(hexConvert('#450BD4')),
                onPressed: () {
                  //TODO: display a popup window, for User to enter lobby code

                  database.reference().child("message").once().then((DataSnapshot snapshot) {
                    Map<dynamic, dynamic> data = snapshot.value;

                    print("Values from db: ${data.values}" );

                  });

                },
              ),
              RoundedButton(
                title: 'Logout',
                color: Color(hexConvert('#000000')),
                onPressed: () {
                  // TODO: if we have enough time, maybe have a popup/dialog box
                  // asking if the user is sure they want to logout

                  _auth.signOut();
                  Navigator.pop(context); // takes us back to the previous screen
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}
