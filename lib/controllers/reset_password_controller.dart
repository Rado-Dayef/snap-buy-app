import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_buy/constants/extensions.dart';
import 'package:snap_buy/constants/strings.dart';
import 'package:snap_buy/controllers/services/auth_service/firebase_auth_service.dart';

class ResetPasswordController extends GetxController {
  bool isLoading = false;
  String email = Strings.emptySign;
  bool isResetPasswordClicked = false;
  GlobalKey<FormState> resetPasswordFormStateKey = GlobalKey<FormState>();

  /// To reset all fields.
  void resetFields() {
    email = Strings.emptySign;
    update();
  }

  /// To check the fields after the user click submit.
  void checkFields() {
    if (isResetPasswordClicked) {
      resetPasswordFormStateKey.currentState!.validate();
    }
    update();
  }

  /// To send the reset password email to the user email.
  Future<void> resetPassword() async {
    isLoading = true;
    isResetPasswordClicked = true;
    checkFields();
    if (resetPasswordFormStateKey.currentState!.validate()) {
      resetPasswordFormStateKey.currentState!.save();
      String? response = await FirebaseAuthService().resetPassword(email);
      if (response != null) {
        response.showToast;
      } else {
        Strings.pleaseCheckYourInternetConnectionText.showToast;
      }
    }
    isLoading = false;
    update();
  }
}
