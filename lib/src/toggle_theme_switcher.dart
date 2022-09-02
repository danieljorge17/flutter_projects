import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ToggleThemeSwitcher extends StatefulWidget {
  const ToggleThemeSwitcher({Key? key}) : super(key: key);

  @override
  State<ToggleThemeSwitcher> createState() => _ToggleThemeSwitcherState();
}

class _ToggleThemeSwitcherState extends State<ToggleThemeSwitcher> {
  bool isDark = false;

  void onTap() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SizedBox(
          height: screenHeight,
          width: screenWidth,
          child: GestureDetector(
            onTap: onTap,
            child: Stack(
              children: [
                Center(
                  child: AnimatedContainer(
                    width: 96,
                    height: 48,
                    alignment: isDark ? Alignment.bottomRight : null,
                    padding: isDark
                        ? const EdgeInsets.only(bottom: 3)
                        : const EdgeInsets.all(0),
                    duration: const Duration(milliseconds: 400),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(24)),
                      color: isDark
                          ? const Color(0xFF5C47B5)
                          : const Color(0xFF7BD6FF),
                    ),
                    child: BackgroundAnimation(
                      isDark: isDark,
                    ),
                  ),
                ),
                AnimatedPositioned(
                  top: screenHeight / 2 - 20,
                  right: isDark
                      ? (screenWidth / 2 - 20) + 24
                      : (screenWidth / 2 - 20) - 24,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.decelerate,
                  child: Container(
                    width: 40,
                    height: 40,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                        color: Colors.transparent, shape: BoxShape.circle),
                    child: OverflowBox(
                      maxWidth: 80,
                      maxHeight: 80,
                      alignment: const Alignment(0.7, -0.7),
                      child: TweenAnimationBuilder(
                        key: GlobalKey(),
                        duration: const Duration(milliseconds: 500),
                        tween: Tween<double>(
                            begin: isDark ? pi : 2 * pi,
                            end: isDark ? 2 * pi : pi),
                        curve: Curves.decelerate,
                        builder: ((_, double angle, __) => Transform.rotate(
                              angle: -angle,
                              child: SvgPicture.asset(
                                  "assets/toggle_theme_switcher/moon_sun_shape.svg"),
                            )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BackgroundAnimation extends StatelessWidget {
  const BackgroundAnimation({Key? key, required this.isDark}) : super(key: key);
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    int delay = 400;

    return TweenAnimationBuilder<double>(
      key: GlobalKey(),
      tween: Tween<double>(begin: 0, end: 1),
      duration: Duration(milliseconds: delay),
      builder: (_, animationCompleted, __) {
        if (animationCompleted == 1) {
          return TweenAnimationBuilder(
            duration: const Duration(milliseconds: 300),
            tween: Tween<double>(begin: 0.0, end: 1.0),
            curve: Curves.decelerate,
            builder: ((_, double opacity, __) => Opacity(
                  opacity: opacity,
                  child: isDark
                      ? SvgPicture.asset(
                          "assets/toggle_theme_switcher/background_dark.svg",
                          color: const Color(0xFFAEA3DA),
                        )
                      : SvgPicture.asset(
                          "assets/toggle_theme_switcher/background_light.svg",
                          color: const Color(0xFFA2E1FD),
                        ),
                )),
          );
        }
        return Container();
      },
    );
  }
}
