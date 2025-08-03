import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:torito/app/routes/app_routes.dart';

import '../../theme/app_colors.dart';
import '../history/history_view.dart';
import '../home/home_view.dart';
import '../profile/profile_view.dart';
import '../qr_payment/qr_payment_view.dart';
import 'main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      const HomeView(),
      const QrPaymentView(),
      const HistoryView(),
      const ProfileView(),
    ];

    return Obx(() {
      return Scaffold(
        body: pages[controller.currentIndex.value],
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showQuickActions(context);
          },
          backgroundColor: AppColors.primaryBlue,
          shape: CircleBorder(),
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 16,
          child: SizedBox(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  Icons.home_outlined,
                  Icons.home,
                  'Inicio',
                  0,
                  controller,
                ),
                _buildNavItem(
                  Icons.qr_code_2_outlined,
                  Icons.qr_code_2,
                  'Pagar QR',
                  1,
                  controller,
                ),
                const SizedBox(width: 48),
                _buildNavItem(
                  Icons.receipt_long_outlined,
                  Icons.receipt_long,
                  'Historial',
                  2,
                  controller,
                ),
                _buildNavItem(
                  Icons.person_outline,
                  Icons.person,
                  'Perfil',
                  3,
                  controller,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildNavItem(
    IconData icon,
    IconData activeIcon,
    String label,
    int index,
    MainController controller,
  ) {
    final isSelected = controller.currentIndex.value == index;
    return GestureDetector(
      onTap: () => controller.changeTab(index),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? activeIcon : icon,
              color: isSelected ? AppColors.primaryBlue : AppColors.gray,
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? AppColors.primaryBlue : AppColors.gray,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget quickActionItem({
  required IconData icon,
  required String text,
  required VoidCallback onTap,
}) {
  return ListTile(
    contentPadding: const EdgeInsets.symmetric(vertical: 4),
    leading: Icon(icon, color: AppColors.primaryBlue),
    title: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
    onTap: onTap,
  );
}

void showQuickActions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor:
        Colors.transparent, // para lograr el fondo oscuro y bordes redondeados
    isScrollControlled: true,
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              quickActionItem(
                icon: Icons.account_balance_wallet_outlined,
                text: 'Depositar USDT en tu wallet',
                onTap: () => Navigator.pop(context),
              ),
              quickActionItem(
                icon: Icons.money_off_csred_rounded,
                text: 'Retirar dinero de tu wallet',
                onTap: () => Navigator.pop(context),
              ),
              quickActionItem(
                icon: Icons.request_page_outlined,
                text: 'Solicitar un préstamo en BOBC',
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(AppRoutes.requestLoan);
                },
              ),
              quickActionItem(
                icon: Icons.history_toggle_off_rounded,
                text: 'Ver historial de BOBC',
                onTap: () => Navigator.pop(context),
              ),
              quickActionItem(
                icon: Icons.payment_outlined,
                text: 'Pagar toda mi deuda de BOBC',
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      );
    },
  );
}
