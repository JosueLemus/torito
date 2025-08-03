import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'request_loan_controller.dart';

class BankAccountStepView extends GetView<RequestLoanController> {
  const BankAccountStepView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F5F7),
      appBar: AppBar(
        title: const Text(
          'Cuenta bancaria',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ListView(
                  children: [
                    _inputField(
                      label: 'Nombre del titular',
                      hint: 'Ej: Juan Pérez',
                      onChanged: (v) => controller.name.value = v,
                    ),
                    _inputField(
                      label: 'Número de cuenta',
                      hint: 'Ingrese el número de cuenta',
                      onChanged: (v) => controller.accountNumber.value = v,
                    ),
                    _dropdownField(
                      label: 'Banco',
                      hint: 'Seleccione un banco',
                      options: controller.banks,
                      value: controller.selectedBank,
                    ),
                    _dropdownField(
                      label: 'Tipo de cuenta',
                      hint: 'Seleccione el tipo de cuenta',
                      options: controller.accountTypes,
                      value: controller.accountType,
                    ),
                    _inputField(
                      label: 'CI o NIT',
                      hint: 'Ingrese su CI o NIT',
                      onChanged: (v) => controller.ciOrNit.value = v,
                    ),
                    Obx(
                      () => CheckboxListTile(
                        value: controller.saveAccount.value,
                        onChanged: (val) =>
                            controller.saveAccount.value = val ?? false,
                        title: const Text(
                          'Guardar esta cuenta para futuras solicitudes',
                          style: TextStyle(fontSize: 14),
                        ),
                        contentPadding: EdgeInsets.zero,
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Dot(active: false),
                      SizedBox(width: 4),
                      Dot(active: true),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Obx(() {
                    final isValid = controller.isFormValid;
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: isValid
                            ? () {
                                controller.saveBankAccount();
                                controller.goToSuccess();
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF0E2E74),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text('Guardar y continuar'),
                      ),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField({
    required String label,
    required String hint,
    required Function(String) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
          ),
          const SizedBox(height: 6),
          TextField(
            decoration: InputDecoration(
              hintText: hint,
              filled: true,
              fillColor: const Color(0xFFF4F5F7),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
            ),
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }

  Widget _dropdownField({
    required String label,
    required String hint,
    required List<String> options,
    required RxnString value,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
          ),
          const SizedBox(height: 6),
          Obx(() {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFF4F5F7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: DropdownButton<String>(
                isExpanded: true,
                underline: const SizedBox(),
                value: value.value,
                hint: Text(hint, style: const TextStyle(fontSize: 14)),
                onChanged: (val) => value.value = val,
                items: options
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
              ),
            );
          }),
        ],
      ),
    );
  }
}

class Dot extends StatelessWidget {
  final bool active;
  const Dot({super.key, this.active = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: active ? 22 : 6,
      height: 6,
      decoration: BoxDecoration(
        color: active ? Colors.black : Colors.black26,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
