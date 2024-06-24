import 'package:get/get.dart';

import '../controllers/sewa_controller.dart';

class SewaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SewaController>(
      () => SewaController(),
    );
  }
}
