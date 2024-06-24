import 'package:get/get.dart';

import '../controllers/history_my_order_controller.dart';

class HistoryMyOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HistoryMyOrderController>(
      () => HistoryMyOrderController(),
    );
  }
}
