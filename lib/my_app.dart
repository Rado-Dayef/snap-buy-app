import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:snap_buy/constants/binding.dart';
import 'package:snap_buy/constants/colors.dart';
import 'package:snap_buy/constants/extensions.dart';
import 'package:snap_buy/constants/fonts.dart';
import 'package:snap_buy/constants/pages.dart';
import 'package:snap_buy/constants/strings.dart';
import 'package:snap_buy/controllers/services/locale_storage_services.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: ThemeColors.themeBlue,
      ),
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.appTitle,
      theme: ThemeData(
        useMaterial3: false,
        hoverColor: ThemeColors.themeTransparent,
        splashColor: ThemeColors.themeTransparent,
        highlightColor: ThemeColors.themeTransparent,
        appBarTheme: AppBarTheme(
          elevation: 20,
          backgroundColor: ThemeColors.themeBlue,
          shadowColor: ThemeColors.themeBlue.withOpacity(0.99),
          titleTextStyle: ThemeFonts.textStyleWhite20TimesBold,
          shape: RoundedRectangleBorder(
            borderRadius: 15.borderRadiusBottom,
          ),
        ),
      ),
      initialBinding: Binding(),
      initialRoute: FirebaseAuth.instance.currentUser != null
          ? Strings.splashRoute
          : LocaleStorageServices().getIsGuest() && FirebaseAuth.instance.currentUser == null
              ? Strings.splashRoute
              : Strings.loginRoute,
      getPages: Pages.pagesList,
    );
  }
}
