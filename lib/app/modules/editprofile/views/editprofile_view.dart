import 'package:flutter/material.dart';
import 'package:flutter_elevarm/app/data/constants.dart';
import 'package:flutter_elevarm/app/modules/editprofile/controllers/editprofile_controller.dart';
import 'package:flutter_elevarm/app/modules/login/widgets/rounded_button.dart';
import 'package:flutter_elevarm/app/modules/login/widgets/rounded_input.dart';
import 'package:flutter_elevarm/app/modules/profile/views/profile_view.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class EditProfileView extends GetView<EditprofileController> {
  const EditProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    Get.put(EditprofileController());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    SizedBox(
                      width: 150,
                      height: 150,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: const Image(
                          image: AssetImage('assets/images/profile-3.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: kPrimaryColor,
                        ),
                        child: const Icon(
                          LineAwesomeIcons.camera,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Column(
                  children: <Widget>[
                    RoundedInput(
                      controller: controller.usernameController,
                      icon: Icons.person,
                      size: size,
                      hint: 'Username',
                      isSecure: false,
                    ),
                    RoundedInput(
                      controller: controller.emailController,
                      icon: Icons.email,
                      size: size,
                      hint: 'Email',
                      isSecure: false,
                    ),
                    RoundedInput(
                      controller: controller.passwordController,
                      icon: Icons.fingerprint,
                      size: size,
                      hint: 'Password',
                      isSecure: true,
                    ),
                    RoundedInput(
                      controller: controller.passwordController,
                      icon: Icons.fingerprint,
                      size: size,
                      hint: 'Confirm Password',
                      isSecure: true,
                    ),
                  ],
                ),
                const Divider(),
                RoundedButton(
                  title: 'EDIT',
                  size: size,
                  onTap: () {
                    Get.offAll(() => const ProfileView());
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
