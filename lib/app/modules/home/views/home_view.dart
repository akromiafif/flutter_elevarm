import 'package:flutter/material.dart';
import 'package:flutter_elevarm/app/data/constants.dart';
import 'package:flutter_elevarm/app/modules/editprofile/views/editprofile_view.dart';
import 'package:flutter_elevarm/app/modules/goride/views/goride_view.dart';
import 'package:flutter_elevarm/app/modules/profile/views/profile_view.dart';

import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());

    return GetBuilder<HomeController>(
      builder: (context) {
        return Scaffold(
          bottomNavigationBar: GNav(
            backgroundColor: kPrimaryColor.withOpacity(0.5),
            activeColor: Colors.white,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            color: kPrimaryColor,
            gap: 16,
            onTabChange: (index) {
              controller.changeTabIndex(index);
            },
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
                textColor: Colors.white,
                iconSize: 30,
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
                textColor: Colors.white,
                iconSize: 30,
              ),
              GButton(
                icon: Icons.settings,
                text: 'Settings',
                textColor: Colors.white,
                iconSize: 30,
              ),
            ],
          ),
          body: IndexedStack(
            index: controller.tabIndex,
            children: const [
              GorideView(),
              ProfileView(),
              EditProfileView(),
            ],
          ),
        );
      },
    );
  }
}
