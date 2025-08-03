import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:torito/app/modules/shared/widgets/bobc_balance_card.dart';
import 'package:torito/app/routes/app_routes.dart';

import '../../theme/app_colors.dart';
import 'bobc_controller.dart';

class BobcView extends StatelessWidget {
  const BobcView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BobcController());

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        backgroundColor: AppColors.lightBackground,
        elevation: 0,
        title: const Text('BOBs', style: TextStyle(color: AppColors.textDark)),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BobcBalanceCard(
                avaliable: controller.available.value,
                limit: controller.limit.value,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        Get.toNamed(AppRoutes.requestLoan);
                      },
                      icon: const Icon(Icons.download),
                      label: const Text('Solicitar préstamo'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                  ),
                  // const SizedBox(width: 12),
                  // Expanded(
                  //   child: ElevatedButton.icon(
                  //     onPressed: () {},
                  //     icon: const Icon(Icons.qr_code_2),
                  //     label: const Text('Pagar con QR'),
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: AppColors.accentYellow,
                  //       foregroundColor: AppColors.textDark,
                  //       padding: const EdgeInsets.symmetric(vertical: 12),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
              const SizedBox(height: 24),
              const Text(
                'Deudas pendientes',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColors.primaryBlue,
                ),
              ),
              const SizedBox(height: 12),
              // Text(controller.debts.length.toString()),
              Expanded(
                child: ListView.separated(
                  itemCount: controller.debts.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (_, index) {
                    final debt = controller.debts[index];
                    return Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  '${debt['amountToPay']} BOBC',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 120,
                                height: 30,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.accentYellow,
                                    foregroundColor: AppColors.textDark,
                                  ),
                                  child: const Text(
                                    'Pagar deuda',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text('Monto solicitado: ${debt['requested']} BOBC'),
                          Text('Fecha solicitada: ${debt['requestDate']}'),
                          Text('Fecha límite: ${debt['dueDate']}'),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// navigation setup (ej. en main.dart o donde uses GetMaterialApp)
// GetPage(name: AppRoutes.bobc, page: () => const BobcView()),

// Solicitar préstamo.
// Se le muestra al usuario una pantalla con dos opciones: adjuntar qr, dejar datos de cuenta bancaria boliviana.

// Al crear cuenta bancaria boliviana, el usuario puede guardar en memoria los datos de cuenta bancaria para usar en otras ocaciones.
// al finalizar se le muestra un mensaje de exito diciendo que le notificaremos en cuanto le depositemos sus bobs.
