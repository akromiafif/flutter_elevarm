import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool isLogin = true.obs;
  late AnimationController animationController =
      AnimationController(vsync: this, duration: animationDuration);
  Duration animationDuration = const Duration(microseconds: 270);

  @override
  void ontInit() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
