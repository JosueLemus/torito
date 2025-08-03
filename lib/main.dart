import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:torito/app/routes/app_routes.dart';
import 'package:torito/app/theme/app_theme.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(const ToritoApp());
}

class ToritoApp extends StatelessWidget {
  const ToritoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Torito',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      getPages: AppPages.pages,
      theme: AppTheme.lightTheme,
    );
  }
}
