import 'package:flutter/material.dart';
import 'package:torito/app/theme/app_colors.dart';

class BobcBalanceCard extends StatelessWidget {
  final double avaliable;
  final double limit;

  const BobcBalanceCard({
    super.key,
    required this.avaliable,
    required this.limit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Saldo disponible en BOBC'),
          const SizedBox(height: 4),
          Text(
            avaliable.toString(),
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          LinearProgressIndicator(
            value: (avaliable / limit),
            backgroundColor: AppColors.gray.shade300,
            color: AppColors.accentYellow,
          ),
          const SizedBox(height: 4),
          Text('Límite: $limit BOBC'),
        ],
      ),
    );
  }
}
