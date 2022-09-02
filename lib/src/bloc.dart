import 'package:get/get.dart';

TiltedListViewBloc get tiltedListViewBloc => Get.find<TiltedListViewBloc>();

class TiltedListViewBloc extends DisposableInterface {
  RxBool isScrollingUp = false.obs;
  RxBool isScrollEnd = true.obs;

  void onChangeScroll(bool isScrollingUp) {
    tiltedListViewBloc.isScrollingUp.value = isScrollingUp;
  }

  void onStartEndScroll(bool isScrollEnd) {
    tiltedListViewBloc.isScrollEnd.value = isScrollEnd;
  }
}
