import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_buy/constants/colors.dart';
import 'package:snap_buy/constants/extensions.dart';
import 'package:snap_buy/constants/fonts.dart';
import 'package:snap_buy/constants/strings.dart';

void customSnackbar() {
  Get.rawSnackbar(
    backgroundColor: ThemeColors.themeBlue,
    borderRadius: 15,
    borderColor: ThemeColors.themeWhite,
    isDismissible: false,
    snackPosition: SnackPosition.TOP,
    margin: 10.edgeInsetsAll,
    duration: const Duration(
      seconds: 5,
    ),
    barBlur: 10,
    overlayBlur: 5,
    messageText: Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(Strings.idLightIcon),
            ),
            10.gap,
            Expanded(
              flex: 9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    Strings.authenticationRequiredText,
                    style: ThemeFonts.textStyleWhite16TimesBold,
                  ),
                  5.gap,
                  const Text(
                    Strings.guestSnackbarSubMessage,
                    style: ThemeFonts.textStyleWhite16TimesNormal,
                  ),
                ],
              ),
            ),
          ],
        ),
        10.gap,
        Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  Get.back();
                  Get.toNamed(Strings.loginRoute);
                },
                child: Container(
                  padding: 15.edgeInsetsVertical,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ThemeColors.themeBlue,
                    borderRadius: 15.borderRadiusAll,
                    border: Border.all(
                      color: ThemeColors.themeWhite,
                    ),
                  ),
                  child: const Text(
                    Strings.loginText,
                    style: ThemeFonts.textStyleWhite16TimesBold,
                  ),
                ),
              ),
            ),
            10.gap,
            Expanded(
              child: InkWell(
                onTap: () {
                  Get.back();
                  Get.toNamed(Strings.signUpRoute);
                },
                child: Container(
                  padding: 15.edgeInsetsVertical,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: ThemeColors.themeBlue,
                    borderRadius: 15.borderRadiusAll,
                    border: Border.all(
                      color: ThemeColors.themeWhite,
                    ),
                  ),
                  child: const Text(
                    Strings.signUpText,
                    style: ThemeFonts.textStyleWhite16TimesBold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
