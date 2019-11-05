import 'package:flutter/material.dart';
import 'package:smudge_app/canvas_screen.dart';
import 'package:whiteboardkit/whiteboardkit.dart';

void main() => runApp(DrawingTest());

class DrawingTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: CanvasScreen.id,
      routes: {
        CanvasScreen.id: (context) => CanvasScreen(),
      },


    );
  }
}