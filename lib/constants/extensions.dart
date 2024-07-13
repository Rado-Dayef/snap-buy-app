
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension Space on num {
  /// Border Radius.
  BorderRadius get borderRadiusAll => BorderRadius.circular(toDouble());

  BorderRadius get borderRadiusTop => BorderRadius.vertical(
    top: Radius.circular(toDouble()),
  );

  BorderRadius get borderRadiusLeft => BorderRadius.horizontal(
    left: Radius.circular(toDouble()),
  );

  BorderRadius get borderRadiusRight => BorderRadius.horizontal(
    right: Radius.circular(toDouble()),
  );

  BorderRadius get borderRadiusBottom => BorderRadius.vertical(
    bottom: Radius.circular(toDouble()),
  );

  /// Edge Insets.
  EdgeInsets get edgeInsetsAll => EdgeInsets.all(toDouble());

  EdgeInsets get edgeInsetsTop => EdgeInsets.only(
    top: toDouble(),
  );

  EdgeInsets get edgeInsetsLeft => EdgeInsets.only(
    left: toDouble(),
  );

  EdgeInsets get edgeInsetsRight => EdgeInsets.only(
    right: toDouble(),
  );

  EdgeInsets get edgeInsetsBottom => EdgeInsets.only(
    bottom: toDouble(),
  );

  EdgeInsets get edgeInsetsVertical => EdgeInsets.symmetric(
    vertical: toDouble(),
  );

  EdgeInsets get edgeInsetsHorizontal => EdgeInsets.symmetric(
    horizontal: toDouble(),
  );

  /// Duration.
  Duration get durationInSeconds => Duration(
    seconds: toInt(),
  );

  Duration get durationInMilliseconds => Duration(
    milliseconds: toInt(),
  );

  /// Gap.
  SizedBox get gap => SizedBox(
    height: toDouble(),
    width: toDouble(),
  );
}
extension StringExtensions on String {
  void get showToast => Fluttertoast.showToast(msg: this);
}
