// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netcarrots_task/src/data_layer/res/colors.dart';
import 'package:netcarrots_task/src/data_layer/res/numbers.dart';
import 'package:netcarrots_task/src/data_layer/res/styles.dart';

class CommonTextField extends StatelessWidget {
  const CommonTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.error = false,
    this.inputFormatters,
    this.onSubmitted,
    this.onChanged,
    this.focusNode,
    this.keyboardType,
    this.radius,
    this.name = false,
    this.obscureText = false,
    this.suffixIcon,
    this.textCapitalization = TextCapitalization.none,
    this.readOnly = false,
    this.maxLength,
    this.enabled = true,
    this.prefixIcon,
    this.style,
    this.textInputAction,
    this.onTap,
    this.fillColor,
    this.onPrefixTap,
    this.onSuffixTap,
    this.prefixConstraints,
    this.maxLines = 1,
    this.minLines = 1,
    this.toolBarOptions = true,
    this.shouldShowBorder = false,
    this.autofocus = true,
    this.textAlign = TextAlign.start,
  });

  final TextEditingController? controller;
  final String hint;
  final bool error;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onSubmitted;
  final void Function(String)? onChanged;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool name;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextCapitalization textCapitalization;
  final bool readOnly;
  final int? maxLength;
  final bool enabled;
  final TextStyle? style;
  final void Function()? onTap;
  final Color? fillColor;
  final void Function()? onPrefixTap;
  final void Function()? onSuffixTap;
  final double? radius;
  final BoxConstraints? prefixConstraints;
  final int maxLines;
  final int minLines;
  final bool toolBarOptions;
  final bool shouldShowBorder;
  final bool autofocus;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlign: textAlign,
      autofocus: autofocus,
      obscureText: obscureText,
      obscuringCharacter: "*",
      enabled: true,
      onChanged: onChanged,
      maxLength: maxLength,
      onTap: onTap,
      onSubmitted: onSubmitted,
      cursorWidth: d_2,
      maxLines: maxLines,
      minLines: minLines,
      cursorRadius: const Radius.circular(d_10),
      controller: controller,
      scrollPhysics: const ClampingScrollPhysics(),
      style: AppStyles.mainNormal14,
      cursorColor: AppColors.mainColor,
      textInputAction: textInputAction ?? TextInputAction.done,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      keyboardAppearance: Brightness.light,
      textCapitalization: textCapitalization,
      readOnly: readOnly,
      decoration: InputDecoration(
        counterText: "",
        filled: false,
        fillColor: Colors.white,
        hintText: hint,
        hintStyle: AppStyles.mainNormal14,
        focusedBorder: _inputBorder(),
        enabledBorder: _inputBorder(),
        isDense: true,
        border: _inputBorder(),
        contentPadding: AppStyles.pd20,
      ),
    );
  }

  OutlineInputBorder _inputBorder() {
    return OutlineInputBorder(
      borderSide: const BorderSide(
        color: AppColors.mainColor,
        width: 0.5,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(
          radius ?? d_10,
        ),
      ),
    );
  }
}
