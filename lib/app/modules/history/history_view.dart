import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';
import 'history_controller.dart';

class HistoryView extends GetView<HistoryController> {
  const HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        title: const Text(
          'Historial',
          style: TextStyle(color: AppColors.textDark, fontSize: 30),
        ),
        centerTitle: false,
      ),
      body: Obx(() {
        return Column(
          children: [
            _TabBar(controller: controller),
            const Divider(height: 1),
            Expanded(
              child: ListView.separated(
                itemCount: controller.filteredItems.length,
                separatorBuilder: (_, __) =>
                    const Divider(height: 1, color: AppColors.lightBackground),
                itemBuilder: (_, index) {
                  final item = controller.filteredItems[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: AppColors.lightBackground,
                      child: Text(
                        item.emoji,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    title: Text(item.title, style: AppTextStyles.subtitle),
                    subtitle: Text(
                      '${item.date} • ${item.status}',
                      style: const TextStyle(color: AppColors.gray),
                    ),
                    trailing: Text(
                      item.amount,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: item.isPositive ? Colors.green : Colors.red,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}

class _TabBar extends StatelessWidget {
  final HistoryController controller;

  const _TabBar({required this.controller});

  @override
  Widget build(BuildContext context) {
    final tabs = {
      HistoryTab.all: 'Todos',
      HistoryTab.deposit: 'Depósitos',
      HistoryTab.withdrawal: 'Retiros',
      HistoryTab.payment: 'Pagos',
    };

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: tabs.entries.map((entry) {
        final isSelected = controller.selectedTab.value == entry.key;
        return GestureDetector(
          onTap: () => controller.selectedTab.value = entry.key,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
            child: Column(
              children: [
                Text(
                  entry.value,
                  style: TextStyle(
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                    color: isSelected ? AppColors.primaryBlue : AppColors.gray,
                  ),
                ),
                if (isSelected)
                  Container(
                    margin: const EdgeInsets.only(top: 6),
                    height: 2,
                    width: 24,
                    color: AppColors.primaryBlue,
                  ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
