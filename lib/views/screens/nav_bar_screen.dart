import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:snap_buy/constants/colors.dart';
import 'package:snap_buy/constants/extensions.dart';
import 'package:snap_buy/constants/fonts.dart';
import 'package:snap_buy/constants/strings.dart';
import 'package:snap_buy/controllers/navbar_controller.dart';

class NavBarScreen extends GetWidget<NavbarController> {
  const NavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Padding(
          padding: 10.edgeInsetsAll,
          child: Image.asset(Strings.profileLightIcon),
        ),
        titleSpacing: 0,
        title: GetBuilder<NavbarController>(
          builder: (_) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.currentUser.name,
                  style: ThemeFonts.textStyleWhite20TimesBold,
                ),
                controller.isGuest
                    ? 0.gap
                    : Text(
                        controller.currentUser.email,
                        style: ThemeFonts.textStyleTransparentWhite14TimesNormal,
                      ),
              ],
            );
          },
        ),
        actions: [
          GetBuilder<NavbarController>(
            builder: (_) {
              return controller.isGuest
                  ? PopupMenuButton(
                      shadowColor: ThemeColors.themeBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: 15.borderRadiusAll,
                      ),
                      elevation: 5,
                      color: ThemeColors.themeWhite,
                      popUpAnimationStyle: AnimationStyle(
                        duration: 500.durationInMilliseconds,
                      ),
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem(
                            child: const Text(
                              Strings.loginText,
                              style: ThemeFonts.textStyleBlue16TimesNormal,
                            ),
                            onTap: () => Get.toNamed(Strings.loginRoute),
                          ),
                          PopupMenuItem(
                            child: const Text(
                              Strings.signUpText,
                              style: ThemeFonts.textStyleBlue16TimesNormal,
                            ),
                            onTap: () => Get.toNamed(Strings.signUpRoute),
                          ),
                        ];
                      },
                    )
                  : 0.gap;
            },
          ),
          5.gap,
        ],
      ),
      body: GetBuilder<NavbarController>(
        builder: (_) {
          return controller.navbarItemsList.elementAt(controller.currentItemIndex).widget;
        },
      ),
      bottomNavigationBar: Container(
        height: 60,
        padding: 5.edgeInsetsAll,
        decoration: BoxDecoration(
          color: ThemeColors.themeBlue,
          borderRadius: 15.borderRadiusTop,
          border: Border.all(
            color: ThemeColors.themeBlue,
          ),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: ThemeColors.themeBlue.withOpacity(0.99),
            ),
          ],
        ),
        child: GetBuilder<NavbarController>(
          builder: (_) {
            return GNav(
              rippleColor: ThemeColors.themeBlue,
              hoverColor: ThemeColors.themeBlue,
              gap: 5,
              activeColor: ThemeColors.themeBlue,
              iconSize: 24,
              padding: 5.edgeInsetsAll,
              duration: 500.milliseconds,
              selectedIndex: controller.currentItemIndex,
              onTabChange: (index) => controller.changeIndex(index),
              textStyle: ThemeFonts.textStyleBlue20TimesNormal,
              tabBackgroundColor: ThemeColors.themeWhite,
              color: ThemeColors.themeWhite,
              haptic: false,
              tabs: [
                gButton(0),
                gButton(1),
                gButton(2),
                gButton(3),
              ],
            );
          },
        ),
      ),
    );
  }

  GButton gButton(int index) {
    return GButton(
      borderRadius: 15.borderRadiusAll,
      icon: Icons.control_point,
      duration: 1.durationInSeconds,
      text: controller.navbarItemsList[index].title,
      leading: Center(
        child: GetBuilder<NavbarController>(
          builder: (_) {
            return SizedBox(
              height: 40,
              width: 25,
              child: Center(
                child: Image.asset(
                  controller.currentItemIndex == index ? controller.navbarItemsList[index].darkIcon : controller.navbarItemsList[index].lightIcon,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
