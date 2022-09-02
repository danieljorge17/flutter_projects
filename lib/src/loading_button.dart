import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rive/rive.dart';

const double height = 40.0;
const double width = 120.0;
RxBool startAnimation = false.obs;
SMIBool? isLoading;

class LoadingButtonPage extends StatelessWidget {
  const LoadingButtonPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: LoadingButton(),
      ),
    );
  }
}

class LoadingButton extends StatefulWidget {
  const LoadingButton({Key? key}) : super(key: key);

  @override
  State<LoadingButton> createState() => _LoadingButtonState();
}

class _LoadingButtonState extends State<LoadingButton> {
  void _onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, "state_machine");
    artboard.addController(controller!);
    isLoading = controller.findInput<bool>('isLoading') as SMIBool;
    //if (!controller.isActive) startAnimation.value = false;
  }

  void _hitBump() => isLoading?.change(true);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => startAnimation.value = !startAnimation.value,
      onTap: () {
        startAnimation.value = true;
        print("Tapped");
        _hitBump();
      },
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            color: Colors.white),
        child: Obx(
          () => startAnimation.value
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: RiveAnimation.asset(
                    "assets/animations/loading_animation.riv",
                    artboard: "my_artboard",
                    fit: BoxFit.contain,
                    onInit: _onRiveInit,
                  ),
                )
              : const Text(
                  "Some text",
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blue),
                ),
        ),
      ),
    );
  }
}
