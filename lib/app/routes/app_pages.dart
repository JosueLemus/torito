import 'package:get/get.dart';
import 'package:torito/app/modules/bobc/bobc_binding.dart';
import 'package:torito/app/modules/bobc/bobc_view.dart';
import 'package:torito/app/modules/main/main_binding.dart';
import 'package:torito/app/modules/main/main_view.dart';
import 'package:torito/app/modules/request_loan/request_loan_binding.dart';
import 'package:torito/app/modules/request_loan/request_loan_view.dart';
import 'package:torito/app/modules/usdt_balance/usdt_balance_binding.dart';
import 'package:torito/app/modules/usdt_balance/usdt_balance_view.dart';

import '../modules/login/login_binding.dart';
import '../modules/login/login_view.dart';
import '../modules/onboarding/onboarding_binding.dart';
import '../modules/onboarding/onboarding_view.dart';
import '../modules/splash/splash_binding.dart';
import '../modules/splash/splash_view.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => const MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRoutes.bobc,
      page: () => const BobcView(),
      binding: BobCBinding(),
    ),
    GetPage(
      name: AppRoutes.usdtBalance,
      page: () => const UsdtBalanceView(),
      binding: UsdtBalanceBinding(),
    ),
    GetPage(
      name: AppRoutes.requestLoan,
      page: () => const RequestLoanView(),
      binding: RequestLoanBinding(),
    ),
  ];
}
