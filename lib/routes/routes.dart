import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/routes/page_name.dart';
import 'package:shopify_admin_dashboard/shared/error_screen.dart';
import 'package:shopify_admin_dashboard/views/dashboard/dashboard_screen.dart';
import 'package:shopify_admin_dashboard/views/splash/splsah_screen.dart';

class AppRoutes {
  static List<GetPage> appRoutes() {
    return [
      GetPage(
        name: PageName.splash_screen,
        page: () => const SplashScreen(),
      ),
      GetPage(
        name: PageName.dashboard_screen,
        page: () => const DashboardScreen(),
        transition: Transition.native,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: PageName.error_screen,
        page: () => const ErrorScreen(),
        transition: Transition.native,
        transitionDuration: const Duration(milliseconds: 500),
      )
    ];
  }
}
