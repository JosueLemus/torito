import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import 'onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final pages = [
      _OnboardingPage(
        key: const ValueKey(0),
        color: Colors.white,
        icon: Icons.account_balance_wallet_outlined,
        title: 'Deposita tus USDT',
        subtitle: 'Agrega USDT a tu cuenta y úsalos como respaldo.',
        iconColor: AppColors.primaryBlue,
        textColor: AppColors.primaryBlue,
      ),
      _OnboardingPage(
        key: const ValueKey(1),
        color: Colors.white,
        icon: Icons.shield_outlined,
        title: 'Tus USDT te respaldan',
        subtitle:
            'Obtén bolivianos sin vender tus ahorros. ¡Aprovecha sin gastar!',
        iconColor: AppColors.accentYellow,
        textColor: AppColors.primaryBlue,
      ),
      _OnboardingPage(
        key: const ValueKey(2),
        color: AppColors.primaryBlue,
        icon: Icons.payments_outlined,
        title: 'Recibe en banco o por QR',
        subtitle: 'Te enviamos el préstamo a tu cuenta o por QR.',
        iconColor: AppColors.white,
        textColor: AppColors.white,
      ),
    ];

    return Obx(() {
      final index = controller.pageIndex.value;
      final isLast = index == pages.length - 1;
      final currentPage = pages[index];

      return Scaffold(
        backgroundColor: currentPage.color,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 32),
              Expanded(
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder: (child, animation) {
                    return SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ).animate(animation),
                      child: FadeTransition(opacity: animation, child: child),
                    );
                  },
                  child: currentPage,
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: Row(
                  key: ValueKey(index),
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(pages.length, (i) {
                    final baseColor = currentPage.textColor ?? AppColors.white;
                    final isActive = i == index;
                    return AnimatedContainer(
                      duration: const Duration(milliseconds: 250),
                      margin: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 16,
                      ),
                      width: isActive ? 12 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isActive
                            ? baseColor
                            : baseColor.withOpacity(0.4),
                      ),
                    );
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: FadeInUp(
                  delay: const Duration(milliseconds: 200),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isLast
                          ? AppColors.accentYellow
                          : (currentPage.textColor ?? AppColors.white),
                      foregroundColor: isLast
                          ? AppColors.primaryBlue
                          : currentPage.color,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: controller.nextPage,
                    child: Text(isLast ? 'Empezar' : 'Siguiente'),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class _OnboardingPage extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;
  final String subtitle;
  final Color iconColor;
  final Color? textColor;

  const _OnboardingPage({
    required Key key,
    required this.color,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.iconColor,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contentColor = textColor ?? AppColors.white;

    return Container(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ZoomIn(
            duration: const Duration(milliseconds: 500),
            child: Icon(icon, size: 80, color: iconColor),
          ),
          const SizedBox(height: 24),
          FadeInDown(
            delay: const Duration(milliseconds: 100),
            child: Text(
              title,
              style: AppTextStyles.onboardingTitle.copyWith(
                color: contentColor,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 8),
          FadeInUp(
            delay: const Duration(milliseconds: 200),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.onboardingSubtitle.copyWith(
                color: contentColor.withOpacity(0.9),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
