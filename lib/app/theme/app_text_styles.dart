import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTextStyles {
  // Titulares principales
  static const TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryBlue,
  );

  // Subtítulos / textos secundarios
  static const TextStyle subtitle = TextStyle(
    fontSize: 16,
    color: AppColors.textDark,
  );

  // Estilo para botones primarios
  static const TextStyle button = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  // Enlaces (como "Reenviar código")
  static const TextStyle link = TextStyle(
    fontSize: 14,
    color: AppColors.accentYellow,
    decoration: TextDecoration.underline,
  );

  // Estilos específicos para onboarding
  static const TextStyle onboardingTitle = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
  );

  static const TextStyle onboardingSubtitle = TextStyle(
    fontSize: 16,
    color: AppColors.textLight,
  );
}
