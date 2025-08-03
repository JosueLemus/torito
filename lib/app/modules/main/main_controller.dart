import 'package:get/get.dart';

import '../history/history_controller.dart';
// import '../home/home_controller.dart';
// import '../profile/profile_controller.dart';
// import '../qr_payment/qr_payment_controller.dart';

class MainController extends GetxController {
  var currentIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();

    // Inicializar los controladores necesarios para cada tab
    // Get.put(HomeController(), permanent: true);
    // Get.put(QrPaymentController(), permanent: true);
    Get.put(HistoryController(), permanent: true);
    // Get.put(ProfileController(), permanent: true);
  }

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
