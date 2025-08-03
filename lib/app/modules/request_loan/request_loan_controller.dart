import 'package:get/get.dart';

enum LoanStep { method, qr, bank, success }

class RequestLoanController extends GetxController {
  final currentStep = LoanStep.method.obs;
  final selectedMethod = ''.obs;

  final savedAccounts = <Map<String, String>>[].obs;

  final qrImage = RxnString();
  final name = ''.obs;
  final accountNumber = ''.obs;
  final ciOrNit = ''.obs;

  final selectedBank = RxnString();
  final accountType = RxnString();

  final saveAccount = false.obs;

  final banks = [
    'Banco Unión',
    'Banco Mercantil Santa Cruz',
    'Banco Nacional de Bolivia',
    'Banco BISA',
    'Banco Ganadero',
    'Banco FIE',
    'Banco Económico',
    'Banco Fortaleza',
  ];

  final accountTypes = [
    'Caja de ahorro',
    'Cuenta corriente',
    'Cuenta de depósito a plazo',
  ];

  bool get isFormValid =>
      name.isNotEmpty &&
      accountNumber.isNotEmpty &&
      ciOrNit.isNotEmpty &&
      selectedBank.value != null &&
      accountType.value != null;

  void goToQRStep() => currentStep.value = LoanStep.qr;
  void goToBankStep() => currentStep.value = LoanStep.bank;
  void goToSuccess() => currentStep.value = LoanStep.success;
  void reset() => currentStep.value = LoanStep.method;

  void saveBankAccount() {
    if (saveAccount.value) {
      savedAccounts.add({
        'name': name.value,
        'number': accountNumber.value,
        'bank': selectedBank.value ?? '',
        'type': accountType.value ?? '',
        'ci': ciOrNit.value,
      });
    }
  }
}
