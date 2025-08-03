import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'request_loan_controller.dart';

class QrStepView extends GetView<RequestLoanController> {
  const QrStepView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adjuntar un código QR')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Icon(Icons.qr_code_scanner_outlined, size: 100),
            const SizedBox(height: 20),
            const Text(
              'Para continuar, elige una opción para adjuntar tu código QR.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                controller.qrImage.value = 'mock_foto.jpg';
                controller.goToSuccess();
              },
              icon: const Icon(Icons.camera_alt),
              label: const Text('Tomar una foto'),
            ),
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton.icon(
                onPressed: () {
                  controller.qrImage.value = 'mock_galeria.jpg';
                  controller.goToSuccess();
                },
                icon: const Icon(Icons.photo),
                label: const Text('Seleccionar desde galería'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
