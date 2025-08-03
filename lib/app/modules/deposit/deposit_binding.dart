import 'package:get/get.dart';

import 'deposit_controller.dart';

class DepositBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DepositController());
  }
}
