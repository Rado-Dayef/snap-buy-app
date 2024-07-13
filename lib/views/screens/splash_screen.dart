import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snap_buy/constants/colors.dart';
import 'package:snap_buy/constants/extensions.dart';
import 'package:snap_buy/constants/fonts.dart';
import 'package:snap_buy/constants/strings.dart';
import 'package:snap_buy/controllers/splash_controller.dart';
import 'package:snap_buy/views/widgets/loading_widget.dart';

class SplashScreen extends GetWidget<SplashController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.themeWhite,
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                Strings.appLogoDarkOutlined,
                width: 200,
                height: 200,
              ),
              25.gap,
              const Text(
                Strings.appTitle,
                style: ThemeFonts.textStyleBlue40EloraBold,
              ),
              5.gap,
              const Text(
                Strings.appSubTitle,
                style: ThemeFonts.textStyleBlue20TimesBold,
              ),
              50.gap,
            ],
          ),
        ),
      ),
      bottomNavigationBar: const SizedBox(
        height: 50,
        child: LoadingWidget(
          size: 50,
        ),
      ),
    );
  }
}
