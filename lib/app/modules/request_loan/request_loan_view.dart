import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bank_account_step_view.dart';
import 'qr_step_view.dart';
import 'request_loan_controller.dart';
import 'request_loan_success_view.dart';

class RequestLoanView extends GetView<RequestLoanController> {
  const RequestLoanView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      switch (controller.currentStep.value) {
        case LoanStep.method:
          return _methodSelector();
        case LoanStep.qr:
          return QrStepView();
        case LoanStep.bank:
          return BankAccountStepView();
        case LoanStep.success:
          return RequestLoanSuccessView();
      }
    });
  }

  Widget _methodSelector() {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FB),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Solicitar préstamo BOBC',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Paso 1 de 2',
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
                SizedBox(height: 6),
                Text(
                  '¿Cómo deseas recibir tu préstamo?',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
          _loanMethodOption(
            title: 'Adjuntar un código QR',
            subtitle: 'Para recibir tus BOBC escaneando un código QR.',
            selected: controller.selectedMethod.value == 'qr',
            onTap: () {
              controller.selectedMethod.value = 'qr';
            },
            icon: Icons.qr_code,
          ),
          const SizedBox(height: 12),
          _loanMethodOption(
            title: 'Cuenta bancaria boliviana',
            subtitle: 'Proporciona la información de tu cuenta bancaria.',
            selected: controller.selectedMethod.value == 'bank',
            onTap: () {
              controller.selectedMethod.value = 'bank';
            },
            icon: Icons.account_balance,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: controller.selectedMethod.value.isNotEmpty
                    ? () {
                        if (controller.selectedMethod.value == 'qr') {
                          controller.goToQRStep();
                        } else {
                          controller.goToBankStep();
                        }
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: controller.selectedMethod.value.isNotEmpty
                      ? const Color(0xFF0D1C3F)
                      : const Color(0xFFD1D5DB),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text('Continuar'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _loanMethodOption({
    required String title,
    required String subtitle,
    required bool selected,
    required VoidCallback onTap,
    required IconData icon,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? const Color(0xFF0D1C3F) : Colors.transparent,
            width: 1.6,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black12.withOpacity(0.05),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.black87),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: const TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 12),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: selected
                      ? const Color(0xFF0D1C3F)
                      : Colors.grey.withOpacity(0.4),
                  width: 2,
                ),
              ),
              child: selected
                  ? Center(
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFF0D1C3F),
                        ),
                      ),
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
