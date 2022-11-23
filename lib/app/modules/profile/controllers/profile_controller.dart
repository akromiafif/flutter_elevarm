import 'package:flutter_elevarm/app/data/models/user.dart';
import 'package:flutter_elevarm/app/providers/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ProfileController extends GetxController {
  var user = User(email: '', id: '', username: '', password: '').obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    var userInfo = GetStorage().read('user-info');
    getUserInfo(userInfo["id"]);
    super.onInit();
  }

  void getUserInfo(String id) async {
    try {
      var response = await ServiceProvider().getUserInfo(id);
      user.value = response;
    } catch (err) {
      print(err);
    } finally {
      isLoading.value = false;
    }
  }
}
