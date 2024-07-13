import 'package:flutter/material.dart';

class NavbarItemModel {
  final String title;
  final Widget widget;
  final String darkIcon;
  final String lightIcon;

  const NavbarItemModel(
    this.title, {
    required this.widget,
    required this.darkIcon,
    required this.lightIcon,
  });
}
