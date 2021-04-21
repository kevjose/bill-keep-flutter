import 'package:bill_keep/controllers/user_controller.dart';
import 'package:get/get.dart';
import 'package:bill_keep/controllers/controllers.dart';

class UserBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<UserController>(
      UserController(),
    );
  }
}
