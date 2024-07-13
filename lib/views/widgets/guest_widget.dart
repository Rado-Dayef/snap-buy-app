import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_buy/constants/colors.dart';
import 'package:snap_buy/constants/extensions.dart';
import 'package:snap_buy/constants/fonts.dart';
import 'package:snap_buy/constants/strings.dart';

class GuestWidget extends StatelessWidget {
  const GuestWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: 10.edgeInsetsAll,
      decoration: BoxDecoration(
        borderRadius: 15.borderRadiusAll,
        border: Border.all(
          color: ThemeColors.themeBlue,
          width: 2,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 75,
            child: Image.asset(Strings.idDarkIcon),
          ),
          5.gap,
          const Text(
            Strings.guestMessage,
            style: ThemeFonts.textStyleBlue20TimesNormal,
          ),
          10.gap,
          const Text(
            Strings.guestSubMessage,
            style: ThemeFonts.textStyleBlue20TimesNormal,
          ),
          25.gap,
          Row(
            children: [
              _buttonItem(
                Strings.loginText,
                route: Strings.loginRoute,
              ),
              10.gap,
              _buttonItem(
                Strings.signUpText,
                route: Strings.signUpRoute,
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _buttonItem(
    String title, {
    required String route,
  }) {
    return Expanded(
      child: InkWell(
        onTap: () => Get.toNamed(route),
        child: Container(
          padding: 15.edgeInsetsVertical,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: ThemeColors.themeBlue,
            borderRadius: 15.borderRadiusAll,
          ),
          child: Text(
            title,
            style: ThemeFonts.textStyleWhite16TimesBold,
          ),
        ),
      ),
    );
  }
}
