import 'package:get/get.dart';
import '../controllers/goride_controller.dart';

class GorideBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GoRideController>(
      () => GoRideController(),
    );
  }
}
