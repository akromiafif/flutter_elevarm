import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/goride_controller.dart';

class GorideView extends GetView<GorideController> {
  const GorideView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'GorideView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
