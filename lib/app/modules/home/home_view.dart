import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:torito/app/modules/bobc/bobc_view.dart';
import 'package:torito/app/modules/home/home_controller.dart';
import 'package:torito/app/modules/shared/widgets/bobc_balance_card.dart';
import 'package:torito/app/routes/app_routes.dart';

import '../../theme/app_colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hola, Josué 👋',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textDark,
                ),
              ),
              const SizedBox(height: 20),
              Obx(() => _buildUsdtCard(controller)),
              const SizedBox(height: 16),
              Obx(() => _buildBobcCard(controller)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUsdtCard(HomeController controller) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoutes.usdtBalance);
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Balance USDT',
              style: TextStyle(
                color: AppColors.textDark,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              controller.usdtBalance.value.toStringAsFixed(2),
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: AppColors.textDark,
              ),
            ),
            Text(
              '~${controller.bobcEquivalent.value.toStringAsFixed(2)} BOBC',
              style: const TextStyle(color: AppColors.gray),
            ),
            const SizedBox(height: 6),
            Text(
              '+${controller.bobcEarningsThisWeek.value.toStringAsFixed(2)} BOBC esta semana',
              style: const TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    label: const Text('Depositar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryBlue,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(fontWeight: FontWeight.w600),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.close),
                    label: const Text('Retirar'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.accentYellow,
                      foregroundColor: AppColors.textDark,
                      textStyle: const TextStyle(fontWeight: FontWeight.w600),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBobcCard(HomeController controller) {
    return GestureDetector(
      onTap: () {
        print("object");
        // GetPage(name: AppRoutes.bobc, page: () => const BobcView());
        Get.to(BobcView());
      },
      child: BobcBalanceCard(
        avaliable: controller.bobcBalance.value,
        limit: controller.bobcLimit.value,
      ),
    );
  }

  Widget _buildBobcAction({
    required IconData icon,
    required String label,
    required Color backgroundColor,
    required Color textColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: textColor),
          const SizedBox(width: 12),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: textColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
