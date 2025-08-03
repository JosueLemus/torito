import 'package:get/get.dart';

enum HistoryTab { all, deposit, withdrawal, payment }

class HistoryItem {
  final String title;
  final String date;
  final String status;
  final String amount;
  final bool isPositive;
  final String type;
  final String emoji;

  HistoryItem({
    required this.title,
    required this.date,
    required this.status,
    required this.amount,
    required this.isPositive,
    required this.type,
    required this.emoji,
  });
}

class HistoryController extends GetxController {
  final selectedTab = HistoryTab.all.obs;

  final allItems = <HistoryItem>[
    HistoryItem(
      title: 'Pago a Supermercado Sur',
      date: '12/03/2024',
      status: 'Completado',
      amount: '-50 BOBC',
      isPositive: false,
      type: 'payment',
      emoji: '💸',
    ),
    HistoryItem(
      title: 'Depósito',
      date: '10/03/2024',
      status: 'Completado',
      amount: '+100 BOBC',
      isPositive: true,
      type: 'deposit',
      emoji: '📥',
    ),
    HistoryItem(
      title: 'Retiro',
      date: '08/03/2024',
      status: 'Completado',
      amount: '-200 BOBC',
      isPositive: false,
      type: 'withdrawal',
      emoji: '🏦',
    ),
    HistoryItem(
      title: 'Pago a Tienda de Ropa',
      date: '05/03/2024',
      status: 'Completado',
      amount: '-75 BOBC',
      isPositive: false,
      type: 'payment',
      emoji: '📤',
    ),
    HistoryItem(
      title: 'Depósito',
      date: '03/03/2024',
      status: 'Completado',
      amount: '+50 BOBC',
      isPositive: true,
      type: 'deposit',
      emoji: '📥',
    ),
  ];

  List<HistoryItem> get filteredItems {
    switch (selectedTab.value) {
      case HistoryTab.deposit:
        return allItems.where((e) => e.type == 'deposit').toList();
      case HistoryTab.withdrawal:
        return allItems.where((e) => e.type == 'withdrawal').toList();
      case HistoryTab.payment:
        return allItems.where((e) => e.type == 'payment').toList();
      default:
        return allItems;
    }
  }
}
