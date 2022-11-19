import 'package:flutter/material.dart';
import 'package:flutter_elevarm/app/data/constants.dart';
import 'package:flutter_elevarm/app/modules/login/widgets/rounded_button.dart';
import 'package:flutter_elevarm/app/modules/login/widgets/rounded_input.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  late Size size;
  late double viewInsets;
  late double defaultLoginSize;
  late double defaultRegisterSize;

  late Animation<double> containerSize =
      Tween<double>(begin: size.height * 0.1, end: defaultRegisterSize).animate(
    CurvedAnimation(
      parent: controller.animationController,
      curve: Curves.linear,
    ),
  );

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());

    size = MediaQuery.of(context).size;
    viewInsets = MediaQuery.of(context).viewInsets.bottom;
    defaultLoginSize = size.height - (size.height * 0.2);
    defaultRegisterSize = size.height - (size.height * 0.1);

    return Scaffold(
      body: Obx(
        () => Stack(
          children: <Widget>[
            AnimatedOpacity(
              duration: controller.animationDuration,
              opacity: controller.isLogin.value ? 0.0 : 1.0,
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: size.width,
                  height: size.height * 0.1,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      controller.isLogin.value = !controller.isLogin.value;
                      controller.animationController.reverse();
                    },
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: controller.isLogin.value ? 1.0 : 0.0,
              duration: controller.animationDuration * 4,
              child: Align(
                alignment: Alignment.center,
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: size.width,
                    height: defaultLoginSize,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Welcome Back',
                          style: GoogleFonts.lato(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 40),
                        SvgPicture.asset('assets/images/login.svg'),
                        const SizedBox(height: 40),
                        RoundedInput(
                          icon: Icons.email,
                          size: size,
                          hint: 'Username',
                          isSecure: false,
                        ),
                        RoundedInput(
                          icon: Icons.fingerprint,
                          size: size,
                          hint: 'Password',
                          isSecure: true,
                        ),
                        RoundedButton(title: 'LOGIN', size: size)
                      ],
                    ),
                  ),
                ),
              ),
            ),
            AnimatedBuilder(
              animation: controller.animationController,
              builder: ((context, child) {
                if (viewInsets == 0 && controller.isLogin.value) {
                  return buildRegisterContainer();
                } else if (!controller.isLogin.value) {
                  return buildRegisterContainer();
                }
                return Container();
              }),
            ),
            AnimatedOpacity(
              duration: controller.animationDuration * 5,
              opacity: controller.isLogin.value ? 0.0 : 1.0,
              child: Visibility(
                visible: !controller.isLogin.value,
                child: Align(
                  alignment: Alignment.center,
                  child: SingleChildScrollView(
                    child: SizedBox(
                      width: size.width,
                      height: defaultLoginSize,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Welcome',
                            style: GoogleFonts.lato(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 40),
                          SvgPicture.asset('assets/images/register.svg'),
                          const SizedBox(height: 40),
                          RoundedInput(
                            icon: Icons.person_outlined,
                            size: size,
                            hint: 'Username',
                            isSecure: false,
                          ),
                          RoundedInput(
                            icon: Icons.email,
                            size: size,
                            hint: 'Email',
                            isSecure: false,
                          ),
                          RoundedInput(
                            icon: Icons.fingerprint,
                            size: size,
                            hint: 'Password',
                            isSecure: true,
                          ),
                          RoundedButton(title: 'SIGN UP', size: size)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRegisterContainer() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: containerSize.value,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(100),
            topRight: Radius.circular(100),
          ),
          color: kBackgroundColor,
        ),
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            controller.isLogin.value = !controller.isLogin.value;
            controller.animationController.forward();
          },
          child: controller.isLogin.value
              ? Text(
                  "Don't have an account? Sign up",
                  style: GoogleFonts.lato(
                    color: kPrimaryColor,
                    fontSize: 18,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
