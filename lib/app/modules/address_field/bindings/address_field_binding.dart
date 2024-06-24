import 'package:get/get.dart';

import '../controllers/address_field_controller.dart';

class AddressFieldBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddressFieldController>(
      () => AddressFieldController(),
    );
  }
}
