import 'package:get/get.dart';
import 'package:snap_buy/controllers/login_controller.dart';
import 'package:snap_buy/controllers/navbar_controller.dart';
import 'package:snap_buy/controllers/reset_password_controller.dart';
import 'package:snap_buy/controllers/sign_up_controller.dart';
import 'package:snap_buy/controllers/splash_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LoginController(),
      fenix: true,
    );
    Get.lazyPut(
      () => NavbarController(),
      fenix: true,
    );
    Get.lazyPut(
      () => SignUpController(),
      fenix: true,
    );
    Get.lazyPut(
      () => SplashController(),
      fenix: true,
    );
    Get.lazyPut(
      () => ResetPasswordController(),
      fenix: true,
    );
  }
}
