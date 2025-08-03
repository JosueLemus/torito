import 'package:get/get.dart';

class BobcController extends GetxController {
  final RxDouble available = 2500.0.obs;
  final RxDouble limit = 5000.0.obs;

  final debts = [
    {
      'amountToPay': 260.0,
      'requested': 250.0,
      'requestDate': '01/08/2025',
      'dueDate': '15/08/2025',
    },
    {
      'amountToPay': 155.0,
      'requested': 150.0,
      'requestDate': '15/07/2025',
      'dueDate': '30/07/2025',
    },
  ].obs;
}
