import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_buy/constants/extensions.dart';
import 'package:snap_buy/constants/strings.dart';
import 'package:snap_buy/controllers/services/auth_service/firebase_auth_service.dart';
import 'package:snap_buy/controllers/services/firebase_services.dart';
import 'package:snap_buy/controllers/services/locale_storage_services.dart';
import 'package:snap_buy/models/user_model.dart';

class SignUpController extends GetxController {
  bool obscure = true;
  bool isLoading = false;
  bool isSignUpClicked = false;
  String name = Strings.emptySign;
  String email = Strings.emptySign;
  String password = Strings.emptySign;
  bool isGuest = LocaleStorageServices().getIsGuest();
  GlobalKey<FormState> signUpFormStateKey = GlobalKey<FormState>();

  /// To reset all fields.
  void resetFields() {
    email = Strings.emptySign;
    password = Strings.emptySign;
    name = Strings.emptySign;
    update();
  }

  /// To check the fields after the user click submit.
  void checkFields() {
    if (isSignUpClicked) {
      signUpFormStateKey.currentState!.validate();
    }
    update();
  }

  /// To sign up.
  Future<void> signUp() async {
    isLoading = true;
    isSignUpClicked = true;
    checkFields();
    if (signUpFormStateKey.currentState!.validate()) {
      signUpFormStateKey.currentState!.save();
      dynamic signUpResponse = await FirebaseAuthService().signUp(email, password);
      if (signUpResponse is User) {
        UserModel user = UserModel(
          name,
          fav: [],
          cart: [],
          email: email,
        );
        dynamic uploadUserResponse = await FirebaseServices().uploadUser(user);
        if (uploadUserResponse is UserModel) {
          Get.offNamed(Strings.loginRoute);
        } else {
          uploadUserResponse.toString().showToast;
        }
      } else {
        signUpResponse.toString().showToast;
      }
    }
    isLoading = false;
    update();
  }
}
