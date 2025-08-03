import 'package:get/get.dart';

class UsdtBalanceController extends GetxController {
  var isLoading = true.obs;
  var transactions = [].obs;
  var usdtBalance = 1250.00.obs;
  var bobcEquivalent = 8750.00.obs;
  var bobcThisWeek = 15.25.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTransactions();
  }

  void fetchTransactions() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    transactions.value = [
      {"type": "deposit", "amount": 500.00, "date": "Aug 1, 2024"},
      {"type": "withdrawal", "amount": 150.00, "date": "Jul 28, 2024"},
      {"type": "deposit", "amount": 200.00, "date": "Jul 25, 2024"},
      {"type": "withdrawal", "amount": 100.00, "date": "Jul 22, 2024"},
    ];
    isLoading.value = false;
  }
}
