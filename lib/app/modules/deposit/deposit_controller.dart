import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:torito/app/routes/app_routes.dart';
import 'package:torito/services/wallet_services.dart';

class DepositController extends GetxController {
  final amount = 0.0.obs;
  final amountText = '0.00'.obs;

  final isLoading = false.obs;
  final isSuccess = false.obs;
  final errorMessage = ''.obs;

  final WalletService _walletService = WalletService();

  Future<void> deposit() async {
    isLoading.value = true;
    errorMessage.value = '';

    try {
      await _walletService.deposit(amount.value);
      isSuccess.value = true;
    } catch (e) {
      errorMessage.value = 'Error al procesar el depósito';
      Get.snackbar(
        'Error',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void updateAmount(double newAmount) {
    amount.value = newAmount;
    amountText.value = NumberFormat("##0.00", "en_US").format(newAmount);
  }

  void goBackHome() {
    Get.offAllNamed(AppRoutes.main);
  }

  void reset() {
    amount.value = 0.0;
    amountText.value = '0.00';
    isSuccess.value = false;
    isLoading.value = false;
    errorMessage.value = '';
  }

  void onAmountChanged(String value) {
    amountText.value = value;
    final parsed = double.tryParse(value.replaceAll(',', '.'));
    amount.value = parsed != null && parsed > 0 ? parsed : 0.0;
  }
}
