import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:snap_buy/constants/colors.dart';

class LoadingWidget extends StatelessWidget {
  final double size;
  final Color color;

  const LoadingWidget({
    super.key,
    this.size = 30,
    this.color = ThemeColors.themeBlue,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LoadingAnimationWidget.staggeredDotsWave(
        color: color,
        size: size,
      ),
    );
  }
}
