import 'package:get/get.dart';

import 'usdt_balance_controller.dart';

class UsdtBalanceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UsdtBalanceController());
  }
}
