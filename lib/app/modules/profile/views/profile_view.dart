import 'package:flutter/material.dart';
import 'package:flutter_elevarm/app/data/colors.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: <Widget>[
                Stack(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
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
                          color: tPrimaryColor,
                        ),
                        child: const Icon(
                          LineAwesomeIcons.alternate_pencil,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Afif Akromi',
                  style: GoogleFonts.lato(
                    color: tDarkColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'socakromiafif@gmail.com',
                  style: GoogleFonts.lato(
                    color: tDarkColor,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tPrimaryColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder(),
                    ),
                    child: Text(
                      'Edit Profile',
                      style: GoogleFonts.lato(
                        color: tDarkColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const Divider(),
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
                  onPress: () {},
                ),
              ],
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
          fontWeight: FontWeight.bold,
          fontSize: 16,
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
