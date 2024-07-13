import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_buy/constants/colors.dart';
import 'package:snap_buy/constants/extensions.dart';
import 'package:snap_buy/constants/fonts.dart';
import 'package:snap_buy/constants/strings.dart';
import 'package:snap_buy/controllers/login_controller.dart';
import 'package:snap_buy/controllers/services/locale_storage_services.dart';
import 'package:snap_buy/views/widgets/hero_widget.dart';
import 'package:snap_buy/views/widgets/loading_widget.dart';
import 'package:snap_buy/views/widgets/text_form_field_widget.dart';

class LoginScreen extends GetWidget<LoginController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.themeWhite,
      body: SafeArea(
        child: Padding(
          padding: 10.edgeInsetsAll,
          child: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: controller.loginFormStateKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Hero(
                      tag: Strings.logoTag,
                      child: Center(
                        child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: ThemeColors.themeWhite,
                            borderRadius: 100.borderRadiusAll,
                            border: Border.all(
                              color: ThemeColors.themeBlue,
                              width: 4,
                            ),
                            image: const DecorationImage(
                              image: AssetImage(Strings.appLogoDarkOutlined),
                            ),
                          ),
                        ),
                      ),
                    ),
                    10.gap,
                    const HeroWidget(
                      tag: Strings.titleTag,
                      child: Text(
                        Strings.appTitle,
                        textAlign: TextAlign.center,
                        style: ThemeFonts.textStyleBlue40EloraBold,
                      ),
                    ),
                    20.gap,
                    const HeroWidget(
                      tag: Strings.subTitleTag,
                      child: Text(
                        Strings.loginText,
                        style: ThemeFonts.textStyleBlue20TimesBold,
                      ),
                    ),
                    10.gap,
                    HeroWidget(
                      tag: Strings.emailTag,
                      child: TextFormFieldWidget(
                        labelName: Strings.emailText,
                        prefixIcon: const Icon(
                          Icons.email_outlined,
                          color: ThemeColors.themeBlue,
                        ),
                        onSaved: (String? value) {
                          controller.email = value!.trim();
                          controller.update();
                        },
                        onChanged: (_) {
                          controller.checkFields();
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return Strings.emailText + Strings.spaceSign + Strings.isRequiredValidation;
                          } else if (!RegExp(r"^[^@.]$").hasMatch(value[0]) || !RegExp(r"^[^@.]$").hasMatch(value[value.length - 1]) || RegExp(r'[^\w@.]').hasMatch(value)) {
                            return Strings.invalidEmailValidation;
                          } else if (!value.contains(Strings.atSign)) {
                            return Strings.emailDoesNotContainAtValidation;
                          }
                          return null;
                        },
                      ),
                    ),
                    10.gap,
                    HeroWidget(
                      tag: Strings.passwordTag,
                      child: GetBuilder<LoginController>(
                        builder: (_) {
                          return TextFormFieldWidget(
                            labelName: Strings.passwordText,
                            obscure: controller.obscure,
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: ThemeColors.themeBlue,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                controller.obscure = !controller.obscure;
                                controller.update();
                              },
                              child: Icon(
                                controller.obscure ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                                color: ThemeColors.themeBlue,
                              ),
                            ),
                            onSaved: (String? value) {
                              controller.password = value!.trim();
                              controller.update();
                            },
                            onChanged: (_) {
                              controller.checkFields();
                            },
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return Strings.passwordText + Strings.spaceSign + Strings.isRequiredValidation;
                              } else if (value.length < 8) {
                                return Strings.passwordText + Strings.spaceSign + Strings.lessThen8Validation;
                              } else if (value.length > 24) {
                                return Strings.passwordText + Strings.spaceSign + Strings.largerThen24Validation;
                              }
                              return null;
                            },
                          );
                        },
                      ),
                    ),
                    5.gap,
                    InkWell(
                      onTap: () => Get.offNamed(Strings.resetPasswordRoute),
                      child: const Text(
                        Strings.resetPasswordText + Strings.questionSign,
                        textAlign: TextAlign.end,
                        style: ThemeFonts.textStyleBlue14TimesBold,
                      ),
                    ),
                    20.gap,
                    HeroWidget(
                      tag: Strings.buttonTag,
                      child: Center(
                        child: GetBuilder<LoginController>(
                          builder: (_) {
                            return InkWell(
                              onTap: controller.isLoading ? () {} : controller.login,
                              child: Container(
                                height: 50,
                                width: 200,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: ThemeColors.themeBlue,
                                  borderRadius: 15.borderRadiusAll,
                                ),
                                child: controller.isLoading
                                    ? const LoadingWidget(
                                        color: ThemeColors.themeWhite,
                                      )
                                    : const Text(
                                        Strings.loginText,
                                        style: ThemeFonts.textStyleWhite20TimesBold,
                                      ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    controller.isGuest ? 0.gap : 10.gap,
                    controller.isGuest
                        ? 0.gap
                        : HeroWidget(
                            tag: Strings.textButtonTag,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  Strings.doNotHaveAnAccountText + Strings.spaceSign,
                                  style: ThemeFonts.textStyleBlue16TimesNormal,
                                ),
                                InkWell(
                                  onTap: () => Get.offNamed(Strings.signUpRoute),
                                  child: Container(
                                    padding: 8.edgeInsetsAll,
                                    alignment: Alignment.center,
                                    child: const Text(
                                      Strings.signUpText + Strings.questionSign,
                                      style: ThemeFonts.textStyleBlue16TimesBold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                    controller.isGuest ? 0.gap : 10.gap,
                    controller.isGuest
                        ? 0.gap
                        : HeroWidget(
                            tag: Strings.guestButtonTag,
                            child: InkWell(
                              onTap: () {
                                LocaleStorageServices().saveIsGuest(true);
                                Get.offNamed(Strings.splashRoute);
                              },
                              child: Padding(
                                padding: 5.edgeInsetsAll,
                                child: const Text(
                                  Strings.goAsGuestText + Strings.questionSign,
                                  textAlign: TextAlign.center,
                                  style: ThemeFonts.textStyleBlue16TimesBold,
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
