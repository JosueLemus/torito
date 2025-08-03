import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final step = controller.currentStep.value;

      return Scaffold(
        backgroundColor: AppColors.lightBackground,
        body: SafeArea(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 420),
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 400),
                transitionBuilder: (child, animation) => FadeTransition(
                  opacity: animation,
                  child: SlideTransition(
                    position: Tween<Offset>(
                      begin: const Offset(0.2, 0),
                      end: Offset.zero,
                    ).animate(animation),
                    child: child,
                  ),
                ),
                child: step == 0
                    ? const _PhoneInput(key: ValueKey(0))
                    : const _OTPInput(key: ValueKey(1)),
              ),
            ),
          ),
        ),
      );
    });
  }
}

class _PhoneInput extends GetView<LoginController> {
  const _PhoneInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: key,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Ingresa tu número',
          style: AppTextStyles.title.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryBlue,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Te enviaremos un código por SMS para verificarlo.',
          style: AppTextStyles.subtitle.copyWith(
            color: AppColors.gray.shade600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.gray.shade300),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Text('🇧🇴 +591'),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: TextField(
                onChanged: (val) => controller.phoneNumber.value = val,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  hintText: 'Tu número de teléfono',
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.gray.shade300),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: controller.sendCode,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text('Continuar', style: AppTextStyles.button),
          ),
        ),
      ],
    );
  }
}

class _OTPInput extends GetView<LoginController> {
  const _OTPInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: key,
      children: [
        Text(
          'Revisa tu SMS',
          style: AppTextStyles.title.copyWith(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryBlue,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Te enviamos un código de 6 dígitos al +591 ${controller.phoneNumber}',
          style: AppTextStyles.subtitle.copyWith(
            fontSize: 14,
            color: AppColors.gray.shade600,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(6, (index) {
            return SizedBox(
              width: 48,
              child: TextField(
                onChanged: (val) {
                  final current = controller.otpCode.value;
                  if (val.isNotEmpty && current.length < 6) {
                    controller.otpCode.value += val;
                  }
                },
                maxLength: 1,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  counterText: '',
                  filled: true,
                  fillColor: AppColors.white,
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.gray.shade300),
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 24),
        TextButton(
          onPressed: controller.isResendEnabled.value
              ? controller.sendCode
              : null,
          child: Text(
            '¿No recibiste el código? Reenviar',
            style: AppTextStyles.subtitle.copyWith(
              color: controller.isResendEnabled.value
                  ? AppColors.primaryBlue
                  : AppColors.gray.shade400,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: controller.verifyCode,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.accentYellow,
              foregroundColor: AppColors.primaryBlue,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text('Verificar', style: AppTextStyles.button),
          ),
        ),
      ],
    );
  }
}
