import 'package:get/get.dart';

class HomeController extends GetxController {
  final usdtBalance = 1234.56.obs;
  final bobcEquivalent = 8520.00.obs;
  final bobcEarningsThisWeek = 2.3.obs;
  final bobcBalance = 2500.0.obs;
  final bobcLimit = 5000.0.obs;

  Future<void> loadBalances() async {
    // Simulate API fetch
    await Future.delayed(const Duration(seconds: 1));
    // Set values here if needed in future from backend
  }

  @override
  void onInit() {
    super.onInit();
    loadBalances();
  }
}
