import 'package:get/get.dart';

import '../controllers/pesanan_my_order_controller.dart';

class PesananMyOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PesananMyOrderController>(
      () => PesananMyOrderController(),
    );
  }
}
