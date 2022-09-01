import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class DemoWidget extends StatelessWidget {
  const DemoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GestureDetector in ListView')),
      body: ListView(children: <Widget>[
        Card(
          child: SizedBox(
            height: 500,
            child: Stack(
              children: const <Widget>[
                Drag(),
              ],
            ),
          ),
        ),
        Card(
          child: Container(
            height: 1000,
          ),
        ),
      ]),
    );
  }
}

class Drag extends StatefulWidget {
  const Drag({Key? key}) : super(key: key);

  @override
  DragState createState() => DragState();
}

class DragState extends State<Drag> {
  double x = 0, y = 0;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: x,
      top: y,
      child: RawGestureDetector(
        gestures: {
          AllowMultipleHorizontalDragGestureRecognizer:
              GestureRecognizerFactoryWithHandlers<
                  AllowMultipleHorizontalDragGestureRecognizer>(
            () => AllowMultipleHorizontalDragGestureRecognizer(),
            (AllowMultipleHorizontalDragGestureRecognizer instance) {
              instance.onUpdate = (details) {
                x += details.delta.dx;
                setState(() {});
              };
            },
          )
        },
        child: RawGestureDetector(
          gestures: {
            AllowMultipleVerticalDragGestureRecognizer:
                GestureRecognizerFactoryWithHandlers<
                    AllowMultipleVerticalDragGestureRecognizer>(
              () => AllowMultipleVerticalDragGestureRecognizer(),
              (AllowMultipleVerticalDragGestureRecognizer instance) {
                instance.onUpdate = (details) {
                  y += details.delta.dy;
                  print(details.delta);
                  setState(() {});
                };
              },
            )
          },
          child: Container(
            width: 100,
            height: 100,
            color: Colors.lightBlue,
            child: const Icon(
              Icons.games,
              color: Colors.white,
              size: 30,
            ),
          ),
        ),
      ),
    );
  }
}

class AllowMultipleVerticalDragGestureRecognizer
    extends VerticalDragGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}

class AllowMultipleHorizontalDragGestureRecognizer
    extends HorizontalDragGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}
