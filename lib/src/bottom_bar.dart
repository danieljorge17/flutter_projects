import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
//RxBool isPlaying = false.obs;

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
      return;
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
                left: -9.8,
                bottom: 0,
                height: 100,
                width: 472,
                child: SizedBox(
                  height: 100,
                  width: 472,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                        width: adjustleftContainer(),
                        height: 80,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
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
                      SizedBox(
                        height: 100,
                        width: 140,
                        child: Obx(
                          () {
                            lastButtonPressed.value;
                            return BuildAnimation(
                              controllerLong: _controllerLong,
                              controllerMedium: _controllerMedium,
                              controllerShort: _controllerShort,
                              function: () {
                                if (!_isPlaying) {
                                  whichControllerPlaysNow(
                                      startIndex: lastButtonPressed.value,
                                      endIndex: buttonPressed.value);
                                  lastButtonPressed.value = buttonPressed.value;
                                }
                              },
                            );
                          },
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 600),
                        curve: Curves.easeInOut,
                        width: adjustRightContainer(),
                        height: 80,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
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
                ((index) => AnimatedIcon(index: index)),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(
                4,
                ((index) => AnimatedText(index: index)),
              ),
            ),
          ],
        ),
        Container(
          height: 24,
          color: const Color(0xFF3F4C73),
        ),
      ],
    );
  }

  double? adjustleftContainer() {
    switch (buttonPressed.value) {
      case 0:
        return 5;
      case 1:
        return 100;
      case 2:
        return 195;
      case 3:
        return 290;
    }
    return null;
  }

  double? adjustRightContainer() {
    switch (buttonPressed.value) {
      case 0:
        return 290;
      case 1:
        return 195;
      case 2:
        return 100;
      case 3:
        return 5;
    }
    return null;
  }

  // double? adjustleftContainer() {
  //   switch (buttonPressed.value) {
  //     case 0:
  //       return 0;
  //     case 1:
  //       return 90;
  //     case 2:
  //       return 180;
  //     case 3:
  //       return 270;
  //   }
  //   return null;
  // }

  // double? adjustRightContainer() {
  //   switch (buttonPressed.value) {
  //     case 0:
  //       return 270;
  //     case 1:
  //       return 180;
  //     case 2:
  //       return 90;
  //     case 3:
  //       return 0;
  //   }
  //   return null;
  // }
}

class BuildAnimation extends StatelessWidget {
  const BuildAnimation({
    Key? key,
    required this.function,
    required this.controllerShort,
    required this.controllerMedium,
    required this.controllerLong,
  }) : super(key: key);
  final RiveAnimationController controllerShort;
  final RiveAnimationController controllerMedium;
  final RiveAnimationController controllerLong;

  final Function() function;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        function();
      },
    );

    return RiveAnimation.asset(
      "assets/animations/fast_gap_animation.riv",
      fit: BoxFit.contain,
      controllers: [controllerShort, controllerMedium, controllerLong],
    );
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
        curve: Curves.easeInQuad,
        alignment: buttonPressed.value == widget.index
            ? Alignment.topCenter
            : Alignment.bottomCenter,
        height: 100,
        width: 60,
        color: Colors.transparent,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeInQuad,
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

class BottomBarLabels {
  static List<String> labels = ["Home", "Goals", "Garden", "Profile"];
}

class AnimatedText extends StatelessWidget {
  const AnimatedText({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 60,
      alignment: Alignment.bottomCenter,
      child: Obx(
        () {
          return AnimatedOpacity(
            duration: const Duration(milliseconds: 600),
            curve: Curves.easeInExpo,
            opacity: buttonPressed.value == index ? 1.0 : 0.0,
            child: Text(
              BottomBarLabels.labels[index].toUpperCase(),
              style: TextStyle(
                  fontSize: 12,
                  fontFamily: "Baloo Chettan 2",
                  color: buttonPressed.value == index
                      ? Colors.white
                      : Colors.transparent),
            ),
          );
        },
      ),
    );
  }
}

List<String> buttonsFirstIconLabel = ["home", "goal", "garden", "profile"];

class AnimatedIcon extends StatelessWidget {
  const AnimatedIcon({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedContainer(
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInQuad,
        alignment: buttonPressed.value == index
            ? Alignment.topCenter
            : Alignment.bottomCenter,
        height: 90,
        width: 60,
        color: Colors.transparent,
        child: Container(
          height: 60,
          width: 60,
          decoration: const BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedOpacity(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOutExpo,
                opacity: buttonPressed.value == index ? 0.0 : 1.0,
                child: SvgPicture.asset(
                    "assets/bottom_bar_fancy/${buttonsFirstIconLabel[index]}_line.svg"),
              ),
              AnimatedOpacity(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOutExpo,
                opacity: buttonPressed.value == index ? 1.0 : 0.0,
                child: SvgPicture.asset(
                    "assets/bottom_bar_fancy/${buttonsFirstIconLabel[index]}_colorful.svg"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
