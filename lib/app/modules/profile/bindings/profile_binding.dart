import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());

    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
  }
}
