import 'package:get/get.dart';
import 'package:torito/app/modules/bobc/bobc_controller.dart';

class BobCBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BobcController());
  }
}
