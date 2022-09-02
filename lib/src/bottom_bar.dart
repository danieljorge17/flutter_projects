import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class BottomBarFancyPage extends StatelessWidget {
  const BottomBarFancyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.grey,
      body: BottomBarFancy(),
    );
  }
}

class BottomBarFancy extends StatefulWidget {
  const BottomBarFancy({Key? key}) : super(key: key);

  @override
  State<BottomBarFancy> createState() => _BottomBarFancyState();
}

class _BottomBarFancyState extends State<BottomBarFancy> {
  late RiveAnimationController _controllerShort;
  late RiveAnimationController _controllerMedium;
  late RiveAnimationController _controllerLong;

  bool _isPlaying = false;

  void whichControllerPlaysNow({required startIndex, required int endIndex}) {
    if ((startIndex >= 0) && (endIndex >= 0)) {
      switch ((endIndex - startIndex).abs()) {
        case 0:
          print("Animation not needed");

          break;
        case 1:
          _controllerShort.isActive = true;
          break;
        case 2:
          _controllerMedium.isActive = true;
          break;
        default:
          _controllerLong.isActive = true;
          break;
      }
    } else {
      print("Invalid index input");
    }
  }

  @override
  void initState() {
    super.initState();
    _controllerShort = OneShotAnimation(
      "short_animation",
      autoplay: false,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );
    _controllerMedium = OneShotAnimation(
      "medium_animation",
      autoplay: false,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );
    _controllerLong = OneShotAnimation(
      "long_animation",
      autoplay: false,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        height: 100,
        width: 472,
        color: Colors.black,
        child: GestureDetector(
          onTap: () {
            if (_isPlaying) {
              return;
            } else {
              whichControllerPlaysNow(startIndex: 1, endIndex: 3);
            }
          },
          child: RiveAnimation.asset(
            "assets/animations/gap_animation.riv",
            //artboard: "only_gap",
            fit: BoxFit.contain,
            controllers: [_controllerShort, _controllerMedium, _controllerLong],
          ),
        ),
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Center(
  //     child: AnimatedContainer(
  //       duration: const Duration(milliseconds: 500),
  //       height: 100,
  //       width: 472,
  //       color: Colors.black,
  //       child: Row(
  //         crossAxisAlignment: CrossAxisAlignment.end,
  //         children: [
  //           Flexible(
  //             flex: 5,
  //             child: SizedBox(
  //               height: 80,
  //               child: Stack(
  //                 clipBehavior: Clip.none,
  //                 children: [
  //                   Container(
  //                     color: Colors.white,
  //                   ),
  //                   Positioned(
  //                     right: -1,
  //                     child: Container(
  //                       height: 80,
  //                       width: 2,
  //                       color: Colors.white,
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //           const RiveAnimation.asset(
  //             "assets/animations/gap_animation.riv",
  //             artboard: "only_gap",
  //             fit: BoxFit.cover,
  //             //controllers: [],
  //           ),
  //           Flexible(
  //             flex: 1,
  //             child: SizedBox(
  //               height: 80,
  //               child: Stack(
  //                 clipBehavior: Clip.none,
  //                 children: [
  //                   Container(
  //                     color: Colors.white,
  //                   ),
  //                   Positioned(
  //                     left: -1,
  //                     child: Container(
  //                       height: 80,
  //                       width: 2,
  //                       color: Colors.white,
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

}
