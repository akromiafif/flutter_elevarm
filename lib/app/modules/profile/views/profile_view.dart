import 'package:flutter/material.dart';
import 'package:flutter_elevarm/app/data/constants.dart';
import 'package:flutter_elevarm/app/modules/editprofile/views/editprofile_view.dart';
import 'package:flutter_elevarm/app/modules/login/views/login_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  @override
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());

    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => controller.isLoading.value
              ? Center(
                  child: Text(
                    "Loading...",
                    style: GoogleFonts.lato(
                      color: tDarkColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                )
              : SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 70, horizontal: 40),
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
                                  image:
                                      AssetImage('assets/images/profile.jpg'),
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
                                  color: kPrimaryColor.withOpacity(0.8),
                                ),
                                child: const Icon(
                                  LineAwesomeIcons.alternate_pencil,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          controller.user.value.username,
                          style: GoogleFonts.lato(
                            color: tDarkColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          controller.user.value.email,
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            color: tDarkColor,
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => const EditProfileView());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor,
                              side: BorderSide.none,
                              shape: const StadiumBorder(),
                            ),
                            child: Text(
                              'Edit Profile',
                              style: GoogleFonts.lato(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        _buildProfileMenu(
                          title: 'Settings',
                          icon: LineAwesomeIcons.cog,
                          endIcon: true,
                          onPress: () {},
                        ),
                        _buildProfileMenu(
                          title: 'Billing Details',
                          icon: LineAwesomeIcons.wallet,
                          endIcon: true,
                          onPress: () {},
                        ),
                        _buildProfileMenu(
                          title: 'User Management',
                          icon: LineAwesomeIcons.user_check,
                          endIcon: true,
                          onPress: () {},
                        ),
                        const Divider(),
                        _buildProfileMenu(
                          title: 'Information',
                          icon: LineAwesomeIcons.info,
                          endIcon: true,
                          onPress: () {},
                        ),
                        _buildProfileMenu(
                          title: 'Logout',
                          icon: LineAwesomeIcons.alternate_sign_out,
                          endIcon: false,
                          onPress: () {
                            GetStorage().remove('user-info');
                            Get.offAll(() => LoginView());
                          },
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}

class _buildProfileMenu extends StatelessWidget {
  const _buildProfileMenu({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    required this.endIcon,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: tAccentColor.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: tAccentColor,
        ),
      ),
      title: Text(
        title,
        style: GoogleFonts.openSans(
          color: tDarkColor,
          fontSize: 18,
        ),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(
                LineAwesomeIcons.angle_right,
                color: Colors.grey,
                size: 20,
              ))
          : null,
    );
  }
}
