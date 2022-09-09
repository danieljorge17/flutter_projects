import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class StackWithGestures extends StatefulWidget {
  const StackWithGestures({Key? key}) : super(key: key);

  @override
  State<StackWithGestures> createState() => _StackWithGesturesState();
}

class _StackWithGesturesState extends State<StackWithGestures> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue,
            ),
          ),
          ColoredBox(
            color: Colors.orange,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 40,
                  height: 40,
                  color: Colors.black,
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: 60,
                          height: 120,
                          color: Colors.red.withOpacity(0.5),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Gap(40),
        ],
      ),
    );
  }
}
