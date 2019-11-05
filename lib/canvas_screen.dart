import 'package:flutter/material.dart';
import 'package:whiteboardkit/whiteboardkit.dart';

class CanvasScreen extends StatefulWidget {

  static String id = 'canvas_screen';

  @override
  _CanvasScreenState createState() => _CanvasScreenState();

}

class _CanvasScreenState extends State<CanvasScreen> with SingleTickerProviderStateMixin{

  GestureWhiteboardController controller;

  @override
  void initState() {
    controller = new GestureWhiteboardController();
    controller.onChange().listen((draw) {

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Offline Lobby'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Whiteboard(
                controller: controller,
              )
            )
          ],
        )
      )
    );
  }


}