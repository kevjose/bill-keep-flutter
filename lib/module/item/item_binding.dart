import 'package:bill_keep/controllers/controllers.dart';
import 'package:bill_keep/module/item/item_controller.dart';
import 'package:bill_keep/module/item/item_service.dart';
import 'package:get/get.dart';

class ItemBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(() => AuthController(), fenix: true);
    Get.lazyPut<ItemService>(() => ItemService());
    Get.lazyPut<ItemController>(
      () => ItemController(
        itemService: Get.find<ItemService>(),
      ),
    );
  }
}
