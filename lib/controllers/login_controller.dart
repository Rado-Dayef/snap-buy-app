import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_buy/constants/extensions.dart';
import 'package:snap_buy/constants/strings.dart';
import 'package:snap_buy/controllers/navbar_controller.dart';
import 'package:snap_buy/controllers/services/auth_service/firebase_auth_service.dart';
import 'package:snap_buy/controllers/services/firebase_services.dart';
import 'package:snap_buy/controllers/services/locale_storage_services.dart';
import 'package:snap_buy/models/user_model.dart';

class LoginController extends GetxController {
  bool obscure = true;
  bool isLoading = false;
  bool isLoginClicked = false;
  String email = Strings.emptySign;
  String password = Strings.emptySign;
  bool isGuest = LocaleStorageServices().getIsGuest();
  GlobalKey<FormState> loginFormStateKey = GlobalKey<FormState>();

  /// To reset all fields.
  void resetFields() {
    email = Strings.emptySign;
    password = Strings.emptySign;
    update();
  }

  /// To check the fields after the user click submit.
  void checkFields() {
    if (isLoginClicked) {
      loginFormStateKey.currentState!.validate();
    }
    update();
  }

  /// To login, and check if the user is on guest account or not to.
  Future<void> login() async {
    isLoading = true;
    isLoginClicked = true;
    checkFields();
    if (loginFormStateKey.currentState!.validate()) {
      loginFormStateKey.currentState!.save();
      dynamic loginResponse = await FirebaseAuthService().login(email, password);
      if (loginResponse is User) {
        if (isGuest) {
          await getCurrentUserIfIsGuest();
          Get.back();
        } else {
          Get.offNamed(Strings.splashRoute);
        }
      } else {
        loginResponse.toString().showToast;
      }
    }
    isLoading = false;
    update();
  }

  /// To get the current user after login if the user was guest.
  Future<void> getCurrentUserIfIsGuest() async {
    dynamic fetchUserResponse = await FirebaseServices().fetchCurrentUser();
    await Future.delayed(
      4.durationInSeconds,
      () {
        NavbarController navbarController = Get.find<NavbarController>();
        LocaleStorageServices().saveIsGuest(false);
        if (fetchUserResponse is UserModel) {
          navbarController.currentUser = fetchUserResponse;
          navbarController.isGuest = LocaleStorageServices().getIsGuest();
          navbarController.saveAction();
          for (int index = 0; index < navbarController.booksList.length; index++) {
            bool isFav = fetchUserResponse.fav.contains(navbarController.booksList[index].id);
            bool isCart = fetchUserResponse.cart.contains(navbarController.booksList[index].id);
            if (isFav) {
              navbarController.booksList[index].isFav = true;
            }
            if (isCart) {
              navbarController.booksList[index].isCart = true;
            }
          }
          navbarController.update();
        } else {
          fetchUserResponse.toString().showToast;
        }
      },
    );
  }
}
