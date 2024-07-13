import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_buy/constants/colors.dart';
import 'package:snap_buy/constants/extensions.dart';
import 'package:snap_buy/constants/fonts.dart';
import 'package:snap_buy/constants/strings.dart';
import 'package:snap_buy/controllers/navbar_controller.dart';
import 'package:snap_buy/views/widgets/guest_widget.dart';
import 'package:snap_buy/views/widgets/loading_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavbarController>(
      builder: (navbarController) {
        return navbarController.isGuest
            ? Center(
                child: SingleChildScrollView(
                  padding: 10.edgeInsetsAll,
                  physics: const BouncingScrollPhysics(),
                  child: const GuestWidget(),
                ),
              )
            : Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: InkWell(
                    onTap: navbarController.signOut,
                    child: Container(
                      width: 250,
                      padding: 15.edgeInsetsAll,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: ThemeColors.themeBlue,
                        borderRadius: 15.borderRadiusAll,
                      ),
                      child: GetBuilder<NavbarController>(
                        builder: (_) {
                          return navbarController.isLoading
                              ? const LoadingWidget(
                                  color: ThemeColors.themeWhite,
                                )
                              : const Text(
                                  Strings.logoutText,
                                  style: ThemeFonts.textStyleWhite20TimesNormal,
                                );
                        },
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
