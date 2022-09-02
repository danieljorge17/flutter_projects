import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:rive/rive.dart';

class BottomBarFancyPage extends StatelessWidget {
  const BottomBarFancyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: BottomBarFancy(),
    );
  }
}

RxInt buttonPressed = 0.obs;
RxInt lastButtonPressed = 0.obs;

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                4,
                ((index) => ButtonAnimated(index: index)),
              ),
            ),
            Obx(
              () => Positioned(
                left: buttonPressed.value == 0 ? -9.8 : null,
                right: buttonPressed.value == 3 ? -9.8 : null,
                bottom: 0,
                height: 100,
                width: 472,
                child: SizedBox(
                  height: 100,
                  width: 472,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: adjustleftContainer(),
                        child: SizedBox(
                          height: 80,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 800),
                                color: const Color(0xFF3F4C73),
                              ),
                              Positioned(
                                right: -1,
                                child: Container(
                                  height: 80,
                                  width: 2,
                                  color: const Color(0xFF3F4C73),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        width: 140,
                        child: GestureDetector(
                          onTap: () {
                            if (_isPlaying) {
                              return;
                            } else {
                              whichControllerPlaysNow(
                                  startIndex: lastButtonPressed.value,
                                  endIndex: buttonPressed.value);
                              print(
                                  "LB: ${lastButtonPressed.value}\nBP: ${buttonPressed.value}");
                              lastButtonPressed.value = buttonPressed.value;
                            }
                          },
                          child: RiveAnimation.asset(
                            "assets/animations/gap_animation.riv",
                            fit: BoxFit.contain,
                            controllers: [
                              _controllerShort,
                              _controllerMedium,
                              _controllerLong
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: adjustRightContainer(),
                        child: SizedBox(
                          height: 80,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 800),
                                color: const Color(0xFF3F4C73),
                              ),
                              Positioned(
                                left: -1,
                                child: Container(
                                  height: 80,
                                  width: 2,
                                  color: const Color(0xFF3F4C73),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                4,
                ((index) => ClickeableArea(index: index)),
              ),
            ),
          ],
        ),
        Container(
          height: 24,
          color: Colors.black12,
        )
      ],
    );
  }

  int adjustleftContainer() {
    switch (buttonPressed.value) {
      case 0:
        return 0;
      case 1:
        return 7;
      case 2:
        return 17;
      case 3:
        return 1;
      default:
        return 0;
    }
  }

  int adjustRightContainer() {
    switch (buttonPressed.value) {
      case 0:
        return 1;
      case 1:
        return 22;
      case 2:
        return 16;
      case 3:
        return 0;
      default:
        return 0;
    }
  }
}

class ButtonAnimated extends StatefulWidget {
  const ButtonAnimated({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<ButtonAnimated> createState() => _ButtonAnimatedState();
}

class _ButtonAnimatedState extends State<ButtonAnimated> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        curve: Curves.decelerate,
        alignment: buttonPressed.value == widget.index
            ? Alignment.topCenter
            : Alignment.bottomCenter,
        height: 100,
        width: 60,
        color: Colors.transparent,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          curve: Curves.decelerate,
          height: buttonPressed.value == widget.index ? 60 : 30,
          width: buttonPressed.value == widget.index ? 60 : 30,
          decoration: const BoxDecoration(
              color: Color(0xFF3F4C73), shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class ClickeableArea extends StatefulWidget {
  const ClickeableArea({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<ClickeableArea> createState() => _ClickeableAreaState();
}

class _ClickeableAreaState extends State<ClickeableArea> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Button index: ${widget.index}");
        buttonPressed.value = widget.index;
        setState(() {});
      },
      child: Obx(
        () => Container(
          alignment: buttonPressed.value == widget.index
              ? Alignment.topCenter
              : Alignment.bottomCenter,
          height: 100,
          width: 60,
          color: Colors.transparent,
        ),
      ),
    );
  }
}
