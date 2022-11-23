import 'package:flutter/material.dart';
import 'package:flutter_elevarm/app/data/constants.dart';
import 'package:flutter_elevarm/app/modules/login/controllers/login_controller.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        textTheme: GoogleFonts.latoTextTheme(Theme.of(context).textTheme),
      ),
    );
  }
}
