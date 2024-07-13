import 'package:flutter/material.dart';
import 'package:snap_buy/constants/colors.dart';

class ErrWidget extends StatelessWidget {
  final double size;
  final Color color;

  const ErrWidget({
    super.key,
    this.size = 30,
    this.color = ThemeColors.themeRed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Icon(
        Icons.error_outline,
        color: color,
        size: size,
      ),
    );
  }
}
