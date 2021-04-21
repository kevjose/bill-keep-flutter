import 'package:bill_keep/controllers/board_controller.dart';
import 'package:get/get.dart';
import 'package:bill_keep/controllers/controllers.dart';

class BoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<BoardController>(
      BoardController(),
    );
  }
}
