import 'package:flutter/material.dart';
import 'package:flutter_elevarm/app/modules/login/widgets/rounded_button.dart';
import 'package:flutter_elevarm/app/modules/login/widgets/rounded_input.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double viewInsets = MediaQuery.of(context).viewInsets.bottom;
    double defaultLoginSize = size.height - (size.height * 0.2);
    double defaultRegisterSize = size.height - (size.height * 0.1);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Align(
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
            )
          ],
        ),
      ),
    );
  }
}
