import 'package:get/get.dart';
import 'package:torito/app/routes/app_routes.dart';

class LoginController extends GetxController {
  final phoneNumber = ''.obs;
  final currentStep = 0.obs;
  final otpCode = ''.obs;
  final isResendEnabled = false.obs;

  void sendCode() {
    currentStep.value = 1;
    // TODO: Aquí iría la lógica de envío real vía backend o Firebase
  }

  void verifyCode() {
    if (otpCode.value.length == 6) {
      Get.offAllNamed(AppRoutes.main); // o el siguiente paso que definas
    }
  }
}
