import 'package:flutter/material.dart';
import 'package:snap_buy/constants/colors.dart';
import 'package:snap_buy/constants/defaults.dart';
import 'package:snap_buy/constants/fonts.dart';

class TextFormFieldWidget extends StatelessWidget {
  final bool filled;
  final bool obscure;
  final int maxLines;
  final int minLines;
  final bool readOnly;
  final int? maxLength;
  final bool autofocus;
  final double padding;
  final String? initVal;
  final TextStyle? style;
  final String? labelName;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? placeholder;
  final VoidCallback? onClick;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final void Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final String? Function(String?)? validator;
  final TextEditingController? textController;
  final void Function(String)? onFieldSubmitted;

  const TextFormFieldWidget({
    super.key,
    this.style,
    this.onClick,
    this.onSaved,
    this.initVal,
    this.maxLength,
    this.onChanged,
    this.validator,
    this.labelName,
    this.prefixIcon,
    this.suffixIcon,
    this.placeholder,
    this.padding = 0,
    this.maxLines = 1,
    this.minLines = 1,
    this.keyboardType,
    this.textController,
    this.filled = false,
    this.obscure = false,
    this.textInputAction,
    this.onFieldSubmitted,
    this.readOnly = false,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: padding,
        ),
        child: TextFormField(
          onTap: onClick,
          onSaved: onSaved,
          minLines: minLines,
          readOnly: readOnly,
          maxLines: maxLines,
          obscureText: obscure,
          onChanged: onChanged,
          maxLength: maxLength,
          validator: validator,
          autofocus: autofocus,
          controller: textController,
          keyboardType: keyboardType,
          cursorColor: ThemeColors.themeBlue,
          onFieldSubmitted: onFieldSubmitted,
          textAlignVertical: TextAlignVertical.center,
          style: style ?? ThemeFonts.textStyleBlue16TimesNormal,
          textInputAction: textInputAction ?? TextInputAction.next,
          onTapOutside: (PointerDownEvent event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          decoration: InputDecoration(
            counterStyle: ThemeFonts.textStyleNull,
            label: labelName == null
                ? null
                : Text(
                    labelName.toString(),
                    style: ThemeFonts.textStyleBlue16TimesNormal,
                  ),
            fillColor: ThemeColors.themeBlue,
            filled: filled,
            hintText: placeholder,
            hintStyle: ThemeFonts.textStyleBlue16TimesNormal,
            labelStyle: ThemeFonts.textStyleBlue16TimesNormal,
            border: ThemeDefaults.outlineInputBorderBlueBorderRadius15,
            disabledBorder: ThemeDefaults.outlineInputBorderBlueBorderRadius15,
            enabledBorder: ThemeDefaults.outlineInputBorderBlueBorderRadius15,
            focusedBorder: ThemeDefaults.outlineInputBorderBlueBorderRadius15,
            focusedErrorBorder: ThemeDefaults.outlineInputBorderRedBorderRadius15,
            errorBorder: ThemeDefaults.outlineInputBorderRedBorderRadius15,
            errorStyle: ThemeFonts.textStyleRed10TimesNormal,
            prefixIconColor: ThemeColors.themeWhite,
            suffixIconColor: ThemeColors.themeWhite,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
