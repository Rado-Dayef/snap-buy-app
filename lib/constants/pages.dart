import 'package:get/get.dart';
import 'package:snap_buy/constants/extensions.dart';
import 'package:snap_buy/constants/strings.dart';
import 'package:snap_buy/views/screens/book_details_screen.dart';
import 'package:snap_buy/views/screens/login_screen.dart';
import 'package:snap_buy/views/screens/nav_bar_screen.dart';
import 'package:snap_buy/views/screens/reset_password_screen.dart';
import 'package:snap_buy/views/screens/sign_up_screen.dart';
import 'package:snap_buy/views/screens/splash_screen.dart';

class Pages {
  static final List<GetPage> pagesList = [
    GetPage(
      name: Strings.loginRoute,
      page: () => const LoginScreen(),
      transition: Transition.noTransition,
      transitionDuration: 500.durationInMilliseconds,
    ),
    GetPage(
      name: Strings.signUpRoute,
      page: () => const SignUpScreen(),
      transition: Transition.noTransition,
      transitionDuration: 500.durationInMilliseconds,
    ),
    GetPage(
      name: Strings.splashRoute,
      page: () => const SplashScreen(),
      transition: Transition.noTransition,
      transitionDuration: 500.durationInMilliseconds,
    ),
    GetPage(
      name: Strings.navbarRoute,
      page: () => const NavBarScreen(),
      transition: Transition.noTransition,
      transitionDuration: 500.durationInMilliseconds,
    ),
    GetPage(
      name: Strings.bookDetailsRoute,
      page: () => const BookDetailsScreen(),
      transition: Transition.noTransition,
      transitionDuration: 500.durationInMilliseconds,
    ),
    GetPage(
      name: Strings.resetPasswordRoute,
      transition: Transition.noTransition,
      page: () => const ResetPasswordScreen(),
      transitionDuration: 500.durationInMilliseconds,
    ),
  ];
}
