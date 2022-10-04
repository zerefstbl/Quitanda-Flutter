import 'package:get/get.dart';
import 'package:quitanda/src/pages/auth/view/sign.in.screen.dart';
import 'package:quitanda/src/pages/auth/view/sign.up.screen.dart';
import 'package:quitanda/src/pages/base/base.screen.dart';
import 'package:quitanda/src/pages/splash/splash.screen.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      page: () => const SplashScreen(),
      name: PagesRoutes.splashRoute,
    ),
    GetPage(
      page: () => SignInScreen(),
      name: PagesRoutes.signInRoute,
    ),
    GetPage(
      page: () => SignUpScreen(),
      name: PagesRoutes.signUpRoute,
    ),
    GetPage(
      page: () => const BaseScreen(),
      name: PagesRoutes.baseRoute,
    )
  ];
}

abstract class PagesRoutes {
  static const String signInRoute = '/signin';
  static const String signUpRoute = '/signup';
  static const String splashRoute = '/splash';
  static const String baseRoute = '/';
}
