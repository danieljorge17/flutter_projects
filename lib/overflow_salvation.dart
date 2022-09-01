import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Salvation extends StatefulWidget {
  const Salvation({Key? key}) : super(key: key);

  @override
  State<Salvation> createState() => _SalvationState();
}

class _SalvationState extends State<Salvation> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: AnimatedOpacity(
        duration: const Duration(milliseconds: 400),
        opacity: _visible ? 1 : 0,
        child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {},
        ),
      ),
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;
          setState(
            () {
              if (direction == ScrollDirection.reverse) {
                _visible = false;
              } else if (direction == ScrollDirection.forward) {
                _visible = true;
              } else if (direction == ScrollDirection.idle) {
                _visible = false;
              }
            },
          );
          return true;
        },
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (_, i) => ListTile(title: Text('$i')),
        ),
      ),
    );
  }
}
