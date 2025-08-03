import 'package:get/get.dart';

import '../../routes/app_routes.dart';

class OnboardingController extends GetxController {
  final pageIndex = 0.obs;

  void nextPage() {
    if (pageIndex.value < 2) {
      pageIndex.value++;
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
