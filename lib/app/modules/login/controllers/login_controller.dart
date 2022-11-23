import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_elevarm/app/modules/profile/views/profile_view.dart';
import 'package:flutter_elevarm/app/providers/services.dart';
import 'package:get/get.dart';

class LoginController extends GetxController
    with GetSingleTickerProviderStateMixin {
  RxBool isLogin = true.obs;
  late AnimationController animationController =
      AnimationController(vsync: this, duration: animationDuration);
  Duration animationDuration = const Duration(microseconds: 270);

  final usernameLogin = TextEditingController();
  final passwordLogin = TextEditingController();

  final usernameRegister = TextEditingController();
  final passwordRegister = TextEditingController();
  final emailRegister = TextEditingController();

  @override
  void ontInit() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void loginUser(String username, String password, BuildContext context) async {
    var response = await ServiceProvider().login(username, password);

    if (response == null) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Failed',
        desc: 'password not match',
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      ).show();
    } else {
      Get.to(() => ProfileView());
    }
  }

  void signUpUser(String username, String email, String password,
      BuildContext context) async {
    var response = await ServiceProvider().signUp(username, email, password);

    if (response == null) {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.error,
        animType: AnimType.rightSlide,
        title: 'Failed',
        desc: 'Username already exists',
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      ).show();
    } else {
      AwesomeDialog(
        context: context,
        dialogType: DialogType.success,
        animType: AnimType.rightSlide,
        title: 'Success',
        desc: 'Congrats!! please login again',
        btnCancelOnPress: () {},
        btnOkOnPress: () {},
      ).show();
    }
  }
}
