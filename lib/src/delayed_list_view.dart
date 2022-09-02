import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/src/bloc.dart';
import 'package:get/get.dart';

// class DelayedListView extends StatefulWidget {
//   const DelayedListView({Key? key}) : super(key: key);

//   @override
//   State<DelayedListView> createState() => _DelayedListViewState();
// }

// class _DelayedListViewState extends State<DelayedListView> {
//   bool _isAlign = true;
//   bool _isDraggingDown = false;

//   void onDrag(double dy) {
//     setState(() {
//       _isAlign = false;
//       _isDraggingDown = dy >= 0;
//     });
//   }

//   void onEnd() {
//     setState(() {
//       _isAlign = true;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return TweenAnimationBuilder(
//       tween:
//           Tween<double>(begin: _isAlign ? 0.5 : 0.0, end: _isAlign ? 0.0 : 0.5),
//       duration: const Duration(milliseconds: 250),
//       curve: Curves.decelerate,
//       builder: (_, double value, __) => Transform(
//         transform: Matrix4.identity()
//           ..setEntry(3, 2, 0.001)
//           ..rotateX(value * (_isDraggingDown ? -1 : 1)),
//         alignment: FractionalOffset.center,
//         child: GestureDetector(
//           onVerticalDragEnd: (details) => onEnd(),
//           onVerticalDragUpdate: (details) => onDrag(details.delta.dy),
//           child: const AnimatedCard(),
//         ),
//       ),
//     );
//   }
// }

class AnimatedCard extends StatelessWidget {
  const AnimatedCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
    );
  }
}

class ListViewTilted extends StatefulWidget {
  const ListViewTilted({Key? key}) : super(key: key);

  @override
  State<ListViewTilted> createState() => _ListViewTiltedState();
}

class _ListViewTiltedState extends State<ListViewTilted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: SafeArea(
        child: ListView(
            //children: List.generate(10, (index) => const DelayedListView()),
            ),
      ),
    );
  }
}

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Listener(
            onPointerMove: (opm) {
              print("onPointerMove .. ${opm.position.dy}");
            },
            child: ListView.builder(
              dragStartBehavior: DragStartBehavior.start,
              itemBuilder: (context, index) {
                return const AnimatedCard();
              },
            )));
  }
}

class Test3 extends StatefulWidget {
  const Test3({Key? key}) : super(key: key);

  @override
  State<Test3> createState() => _Test3State();
}

class _Test3State extends State<Test3> {
  double lastMetric = 0.0;
  bool isScrollingUp = false;

  _onStartScroll(ScrollMetrics metrics) {
    tiltedListViewBloc.onStartEndScroll(false);
    setState(() {});
    print("Father finished scrolling: ${tiltedListViewBloc.isScrollEnd.value}");
  }

  _onUpdateScroll(ScrollMetrics metrics) {
    tiltedListViewBloc.onChangeScroll(lastMetric >= metrics.pixels);
    setState(() {});
    lastMetric = metrics.pixels;
    print("Father is scrolling up: ${tiltedListViewBloc.isScrollingUp.value}");
  }

  _onEndScroll(ScrollMetrics metrics) {
    tiltedListViewBloc.onStartEndScroll(true);
    tiltedListViewBloc.onChangeScroll(false);
    setState(() {});
    print("Father finished scrolling: ${tiltedListViewBloc.isScrollEnd.value}");
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        if (scrollNotification is ScrollStartNotification) {
          _onStartScroll(scrollNotification.metrics);
        } else if (scrollNotification is ScrollUpdateNotification) {
          _onUpdateScroll(scrollNotification.metrics);
        } else if (scrollNotification is ScrollEndNotification) {
          _onEndScroll(scrollNotification.metrics);
        }
        return false;
      },
      child: ListView(
        children: List.generate(
          20,
          (index) => Obx(
            () => TweenAnimationBuilder(
              tween: Tween<double>(
                  begin: tiltedListViewBloc.isScrollingUp.value ? 0.8 : 0.0,
                  end: tiltedListViewBloc.isScrollingUp.value ? 0.0 : 0.8),
              duration: const Duration(milliseconds: 1000),
              curve: Curves.decelerate,
              builder: (_, double value, __) => Transform(
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateX(
                    value *
                        (tiltedListViewBloc.isScrollingUp.value ? -1 : 1) *
                        (tiltedListViewBloc.isScrollEnd.value ? 0 : 1),
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

// class Test2 extends StatelessWidget {
//   const Test2({Key? key}) : super(key: key);


//   _onStartScroll(ScrollMetrics metrics) {
//     //print(metrics);
//     print("Scroll Start");
//   }

//   _onUpdateScroll(ScrollMetrics metrics) {
//     //print(metrics);
//     print(metrics.axis);
//     print(metrics.axisDirection);
//     //print("Scroll Update");
//   }

//   _onEndScroll(ScrollMetrics metrics) {
//     //print(metrics);
//     print("Scroll End");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return NotificationListener<ScrollNotification>(
//       onNotification: (scrollNotification) {
//         if (scrollNotification is ScrollStartNotification) {
//           _onStartScroll(scrollNotification.metrics);
//         } else if (scrollNotification is ScrollUpdateNotification) {
//           _onUpdateScroll(scrollNotification.metrics);
//         } else if (scrollNotification is ScrollEndNotification) {
//           _onEndScroll(scrollNotification.metrics);
//         }
//         return false;
//       },
//       child: ListView(
//         children: List.generate(10, (index) => const AnimatedCard()),
//       ),
//     );
//   }
// }
