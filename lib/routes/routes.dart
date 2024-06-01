import 'package:get/get.dart';
import 'package:shopify_admin_dashboard/routes/page_name.dart';
import 'package:shopify_admin_dashboard/shared/error_screen.dart';
import 'package:shopify_admin_dashboard/views/User/home-web/home-page.dart';
import 'package:shopify_admin_dashboard/views/authentication/auth_screen.dart';
import 'package:shopify_admin_dashboard/views/Merchant/dashboard/dashboard_screen.dart';
import 'package:shopify_admin_dashboard/views/splash/splsah_screen.dart';

class AppRoutes {
  static List<GetPage> appRoutes() {
    return [
      GetPage(
        name: PageName.splash_screen,
        page: () => const SplashScreen(),
      ),
      GetPage(
        name: PageName.auth_screen,
        page: () => const AuthScreen(),
        transition: Transition.native,
        transitionDuration: const Duration(milliseconds: 500),
      ),
      GetPage(
        name: PageName.home_web_page,
        page: () => const HomeWebPage(),
        transition: Transition.native,
        transitionDuration: const Duration(milliseconds: 500),
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
