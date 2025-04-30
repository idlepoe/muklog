import 'package:get/get.dart';

import '../controllers/item_edit_controller.dart';

class ItemEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ItemEditController>(
      () => ItemEditController(),
    );
  }
}
