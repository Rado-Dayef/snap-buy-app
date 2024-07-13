import 'package:get/get.dart';
import 'package:snap_buy/constants/extensions.dart';
import 'package:snap_buy/constants/strings.dart';
import 'package:snap_buy/controllers/services/firebase_services.dart';
import 'package:snap_buy/models/user_model.dart';

class SplashController extends GetxController {
  bool isLoading = false;
  int currentItemIndex = 0;
  bool isSendClicked = false;

  @override
  void onInit() {
    super.onInit();
    getCurrentUser();
  }

  /// To get the current user data.
  Future<void> getCurrentUser() async {
    dynamic fetchUserResponse = await FirebaseServices().fetchCurrentUser();
    await Future.delayed(
      4.durationInSeconds,
      () {
        if (fetchUserResponse is UserModel) {
          Get.offNamed(
            Strings.navbarRoute,
            arguments: fetchUserResponse,
          );
        } else {
          fetchUserResponse.toString().showToast;
        }
      },
    );
  }
}
