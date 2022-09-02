import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AnimatedCard extends StatelessWidget {
  const AnimatedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 120,
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
    );
  }
}

class TiltedListView extends StatefulWidget {
  const TiltedListView({Key? key}) : super(key: key);

  @override
  State<TiltedListView> createState() => _TiltedListViewState();
}

class _TiltedListViewState extends State<TiltedListView> {
  bool _isScrollingUp = false;
  bool _isIdle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: NotificationListener<UserScrollNotification>(
        onNotification: (notification) {
          final ScrollDirection direction = notification.direction;
          setState(
            () {
              if (direction == ScrollDirection.reverse) {
                _isIdle = false;
                _isScrollingUp = false;
              } else if (direction == ScrollDirection.forward) {
                _isIdle = false;
                _isScrollingUp = true;
              } else if (direction == ScrollDirection.idle) {
                _isIdle = true;
              }
              print("Notification: ${notification.metrics}");
            },
          );
          return true;
        },
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: List.generate(
            50,
            (index) => TweenAnimationBuilder(
              tween: Tween<double>(
                begin: _isIdle ? 0.6 : 0.0,
                end: _isIdle ? 0.0 : 0.6,
              ),
              duration: const Duration(milliseconds: 500),
              curve: Curves.decelerate,
              builder: (_, double value, __) => Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(
                    value * (_isScrollingUp ? -1 : 1),
                  ),
                alignment: FractionalOffset.center,
                child: const AnimatedCard(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
