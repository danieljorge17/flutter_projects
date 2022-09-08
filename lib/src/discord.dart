import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

late double screenWidth;
late double screenHeigth;

double responsive({
  double width = 0,
  double height = 0,
}) {
  if ((width == 0 && height == 0) || (width != 0 && height != 0)) {
    return -1;
  } else if (width != 0) {
    return screenWidth * width / 428;
  } else {
    return screenHeigth * height / 926;
  }
}

class Discord extends StatelessWidget {
  const Discord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeigth = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const TopBar(),
          Expanded(
            child: Stack(
              children: const [
                ChannelContent(),
                SideBarInnerBar(),
                SideBar(),
              ],
            ),
          ),
          const Bottombar(),
        ],
      ),
    );
  }
}

class SideBarInnerBar extends StatefulWidget {
  const SideBarInnerBar({Key? key}) : super(key: key);

  @override
  State<SideBarInnerBar> createState() => _SideBarInnerBarState();
}

class _SideBarInnerBarState extends State<SideBarInnerBar> {
  // ValueKey<int> key = ValueKey<int>(0);
  bool _isDismissed = true;

  void onDissmiss() {
    _isDismissed = false;
  }

  @override
  Widget build(BuildContext context) {
    return _isDismissed
        ? Padding(
            padding: EdgeInsets.only(top: responsive(height: 12)),
            child: Dismissible(
              key: const ValueKey<int>(0),
              onDismissed: (DismissDirection direction) {
                setState(() {
                  onDissmiss();
                });
              },
              child: SizedBox(
                height: responsive(height: 432),
                width: responsive(width: 392),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(24),
                    bottomRight: Radius.circular(24),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 32, sigmaY: 32),
                    child: Container(
                      padding: EdgeInsets.only(
                        top: responsive(height: 24),
                        left: responsive(width: 120),
                      ),
                      color: const Color(0xFF262A3F).withOpacity(0.75),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ListView(
                              padding: EdgeInsets.zero,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Explorer",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: Color(0xFFEAEBF2),
                                          fontFamily: "Europa",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 24),
                                    ),
                                    Gap(responsive(height: 20)),
                                    Container(
                                      height: 1,
                                      width: responsive(width: 240),
                                      color: const Color(0xFFEAEBF2)
                                          .withOpacity(0.5),
                                    ),
                                    Gap(responsive(height: 16)),
                                    const Text(
                                      "Community",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: Color(0xFFEAEBF2),
                                          fontFamily: "Europa",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18),
                                    ),
                                    Gap(responsive(height: 10)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Events",
                                            style: TextStyle(
                                              color: const Color(0xFFEAEBF2)
                                                  .withOpacity(0.5),
                                              fontFamily: "Europa",
                                              fontSize: 14,
                                            ),
                                          ),
                                          Gap(responsive(height: 8)),
                                          Text(
                                            "App Showcase",
                                            style: TextStyle(
                                              color: const Color(0xFFEAEBF2)
                                                  .withOpacity(0.5),
                                              fontFamily: "Europa",
                                              fontSize: 14,
                                            ),
                                          ),
                                          Gap(responsive(height: 8)),
                                          Text(
                                            "Packages and Tools",
                                            style: TextStyle(
                                              color: const Color(0xFFEAEBF2)
                                                  .withOpacity(0.5),
                                              fontFamily: "Europa",
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Gap(responsive(height: 16)),
                                    const Text(
                                      "Work",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: Color(0xFFEAEBF2),
                                          fontFamily: "Europa",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18),
                                    ),
                                    Gap(responsive(height: 10)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Hiring",
                                            style: TextStyle(
                                              color: const Color(0xFFEAEBF2)
                                                  .withOpacity(0.5),
                                              fontFamily: "Europa",
                                              fontSize: 14,
                                            ),
                                          ),
                                          Gap(responsive(height: 8)),
                                          Text(
                                            "For Hire",
                                            style: TextStyle(
                                              color: const Color(0xFFEAEBF2)
                                                  .withOpacity(0.5),
                                              fontFamily: "Europa",
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Gap(responsive(height: 16)),
                                    const Text(
                                      "Help and Development",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: Color(0xFFEAEBF2),
                                          fontFamily: "Europa",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18),
                                    ),
                                    Gap(responsive(height: 10)),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Performance",
                                            style: TextStyle(
                                              color: const Color(0xFFEAEBF2)
                                                  .withOpacity(0.5),
                                              fontFamily: "Europa",
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Gap(responsive(height: 16)),
                                    const Text(
                                      "Discussion",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          color: Color(0xFFEAEBF2),
                                          fontFamily: "Europa",
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SvgPicture.asset(
                            "assets/discord/drag_tab_vertical.svg",
                            height: responsive(height: 96),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        : Container();
  }
}

class ChannelContent extends StatelessWidget {
  const ChannelContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          left: responsive(width: 92), right: responsive(width: 20)),
      color: const Color(0xFF262A3F),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Gap(responsive(height: 20)),
          Container(
            height: responsive(height: 160),
            width: responsive(width: 316),
            decoration: BoxDecoration(
              color: const Color(0xFF363A50),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Gap(responsive(height: 36)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: responsive(height: 16.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "Featured Community",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Color(0xFFEAEBF2),
                      fontFamily: "Europa",
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
                Text(
                  "See all",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: const Color(0xFFEAEBF2).withOpacity(0.5),
                    fontFamily: "Europa",
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
          Gap(responsive(height: 12)),
          Container(
            height: responsive(height: 128),
            width: responsive(width: 316),
            decoration: BoxDecoration(
              color: const Color(0xFF363A50),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Gap(responsive(height: 36)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsive(height: 16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "Popular Right Now",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Color(0xFFEAEBF2),
                      fontFamily: "Europa",
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
                Text(
                  "See all",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: const Color(0xFFEAEBF2).withOpacity(0.5),
                    fontFamily: "Europa",
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
          Gap(responsive(height: 12)),
          Row(
            children: [
              Container(
                height: responsive(height: 240),
                width: responsive(width: 240),
                decoration: BoxDecoration(
                  color: const Color(0xFF363A50),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Gap(responsive(width: 16)),
              Container(
                height: responsive(height: 240),
                width: responsive(width: 60),
                decoration: const BoxDecoration(
                  color: Color(0xFF363A50),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                ),
              ),
            ],
          ),
          Gap(responsive(height: 36)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: responsive(height: 16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Text(
                  "Recent Add",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      color: Color(0xFFEAEBF2),
                      fontFamily: "Europa",
                      fontWeight: FontWeight.w700,
                      fontSize: 18),
                ),
                Text(
                  "See all",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: const Color(0xFFEAEBF2).withOpacity(0.5),
                    fontFamily: "Europa",
                    fontSize: 14,
                  ),
                )
              ],
            ),
          ),
          Gap(responsive(height: 12)),
          Row(
            children: [
              Container(
                height: responsive(height: 128),
                width: responsive(width: 240),
                decoration: BoxDecoration(
                  color: const Color(0xFF363A50),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Gap(responsive(width: 16)),
              Container(
                height: responsive(height: 128),
                width: responsive(width: 60),
                decoration: const BoxDecoration(
                  color: Color(0xFF363A50),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: responsive(height: 20)),
      height: responsive(height: 348),
      width: responsive(width: 72),
      alignment: Alignment.topLeft,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF4D72DE),
            Color(0xFFA44CEE),
          ],
        ),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(32), bottomRight: Radius.circular(32)),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              SvgPicture.asset(
                "assets/discord/sidebar/curved_shape_sidebar_top.svg",
                width: responsive(width: 64),
              ),
              Expanded(
                child: Container(
                  width: responsive(width: 64),
                  color: const Color(0xFF21054E).withOpacity(0.25),
                ),
              ),
              SvgPicture.asset(
                "assets/discord/sidebar/curved_shape_sidebar_bottom.svg",
                width: responsive(width: 64),
              ),
            ],
          ),
          Positioned(
            top: responsive(height: 64),
            left: responsive(width: 61.2),
            child: SvgPicture.asset(
              "assets/discord/sidebar/selected_channel_shape.svg",
              width: responsive(width: 5.8),
            ),
          ),
          Positioned(
            top: responsive(height: 46),
            left: responsive(width: 0),
            child: Image.asset(
              "assets/discord/sidebar/blury_selected_channel.png",
              width: responsive(width: 64),
            ),
          ),
          Positioned(
            top: responsive(height: 58),
            left: responsive(width: 12),
            child: SvgPicture.asset(
              "assets/discord/sidebar/explore_icon.svg",
              width: responsive(width: 40),
            ),
          ),
          Positioned(
            top: responsive(height: 122),
            left: responsive(width: 12),
            child: Container(
              height: responsive(height: 40),
              width: responsive(width: 40),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: responsive(width: 1),
                  color: const Color(0xFFB875FC),
                ),
              ),
              child: Image.asset(
                "assets/discord/sidebar/channel_one.png",
                width: responsive(width: 40),
              ),
            ),
          ),
          Positioned(
            top: responsive(height: 186),
            left: responsive(width: 12),
            child: Container(
              height: responsive(height: 40),
              width: responsive(width: 40),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  width: responsive(width: 1),
                  color: const Color(0xFFB875FC),
                ),
              ),
              child: Image.asset(
                "assets/discord/sidebar/channel_two.png",
                width: responsive(width: 40),
              ),
            ),
          ),
          Positioned(
            top: responsive(height: 250),
            left: responsive(width: 12),
            child: SvgPicture.asset(
              "assets/discord/sidebar/add_channel_icon.svg",
              width: responsive(width: 40),
            ),
          ),
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: responsive(height: 108),
      width: double.infinity,
      padding: EdgeInsets.only(
        left: responsive(width: 24.5),
        right: responsive(width: 20),
      ),
      color: const Color(0xFF363A50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: responsive(height: 12)),
            child: SvgPicture.asset(
              "assets/discord/logo.svg",
              width: responsive(width: 43.49),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: responsive(height: 16)),
            padding: EdgeInsets.only(
                left: responsive(width: 16), right: responsive(width: 12)),
            height: responsive(height: 40),
            width: responsive(width: 316),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF4A4D64), width: 1),
                color: const Color(0xFF2C3047)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Explore...",
                  style: TextStyle(
                    fontFamily: "Europa",
                    color: Color(0xFF9497AF),
                    fontSize: 14,
                  ),
                ),
                SvgPicture.asset("assets/discord/icons/search_icon.svg"),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Bottombar extends StatefulWidget {
  const Bottombar({Key? key}) : super(key: key);

  @override
  State<Bottombar> createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int lastButtonPressedIndex = -1;

  void buttonPressedIndex({int? index}) {
    if (index == lastButtonPressedIndex) {
      lastButtonPressedIndex = -1;
      return;
    }
    if (index != null) lastButtonPressedIndex = index;
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: responsive(height: 88),
      padding: EdgeInsets.only(bottom: responsive(height: 8)),
      width: double.infinity,
      color: const Color(0xFF2C3047),
      child: Row(
        children: [
          Gap(responsive(width: 24)),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: responsive(height: -10),
                left: responsive(width: -12),
                child: Image.asset(
                  "assets/discord/sidebar/blury_selected_channel.png",
                  width: responsive(width: 64),
                ),
              ),
              Positioned(
                top: 0.5,
                right: 0.5,
                child: Image.asset(
                  "assets/discord/avatar_picture_one.png",
                  width: responsive(width: 39),
                ),
              ),
              SvgPicture.asset(
                "assets/discord/avatar_border_small.svg",
                width: responsive(width: 40),
              ),
            ],
          ),
          Gap(responsive(width: 24)),
          Container(
            width: 1,
            height: responsive(height: 48),
            color: const Color(0xFF4A4D64),
          ),
          Gap(responsive(width: 34)),
          InkWell(
            onTap: () {
              buttonPressedIndex(index: 0);
              setState(() {});
            },
            child: Container(
              height: responsive(height: 48),
              width: responsive(width: 48),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: lastButtonPressedIndex == 0
                    ? const Color(0xFF40445B)
                    : Colors.transparent,
              ),
              child: SvgPicture.asset(
                "assets/discord/icons/profile.svg",
                width: responsive(width: 15),
              ),
            ),
          ),
          Gap(responsive(width: 26)),
          InkWell(
            onTap: () {
              buttonPressedIndex(index: 1);
              setState(() {});
            },
            child: Container(
              height: responsive(height: 48),
              width: responsive(width: 48),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: lastButtonPressedIndex == 1
                    ? const Color(0xFF40445B)
                    : Colors.transparent,
              ),
              child: SvgPicture.asset(
                "assets/discord/icons/notification.svg",
                width: responsive(width: 15),
              ),
            ),
          ),
          Gap(responsive(width: 26)),
          InkWell(
            onTap: () {
              buttonPressedIndex(index: 2);
              setState(() {});
            },
            child: Container(
              height: responsive(height: 48),
              width: responsive(width: 48),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: lastButtonPressedIndex == 2
                    ? const Color(0xFF40445B)
                    : Colors.transparent,
              ),
              child: SvgPicture.asset(
                "assets/discord/icons/message.svg",
                width: responsive(width: 15),
              ),
            ),
          ),
          Gap(responsive(width: 26)),
          InkWell(
            onTap: () {
              buttonPressedIndex(index: 3);
              setState(() {});
            },
            child: Container(
              height: responsive(height: 48),
              width: responsive(width: 48),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: lastButtonPressedIndex == 3
                    ? const Color(0xFF40445B)
                    : Colors.transparent,
              ),
              child: SvgPicture.asset(
                "assets/discord/icons/setting.svg",
                width: responsive(width: 15),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
