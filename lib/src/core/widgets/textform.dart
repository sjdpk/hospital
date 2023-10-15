import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital/src/core/resources/colors.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final double? height;
  final String? hintText;
  final bool isSecure;
  final bool textKeyBoard;
  final int? inputfieldLimit;
  final int maxLine;
  final Widget? suffixIcon;
  final String? label;
  final double horizontalMargin;
  final double verticalMargin;
  final bool enable;
  final bool isNumberKeyboard;
  final FloatingLabelBehavior floatingLabelBehavior;
  final TextInputAction? inputAction;
  final Function(String text)? onFieldSubmitted;
  final Function(String text)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(PointerDownEvent event)? onTapOutside;
  final Color? cursorColor;
  final Color borderMainColor;
  final Color borderSecColor;
  final Color? color;
  final double borderRadius;
  final double? marginl, margint, marginr, marginb;
  final double? contentPl, contentPt, contentPr, contentPb;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final String? Function(String? value)? validator;
  final TextStyle? style;

  final String? prefixText;
  final TextStyle? prefixStyle;

  final String? suffixText;
  final TextStyle? suffixStyle;
  final TextInputType? keyboardType;
  final bool? alignLabelWithHint;
  final bool autofocus;
  final Color? fillColor;
  final bool showBorder;
  final Widget? prefixIcon;
  final AutovalidateMode? autovalidateMode;

  const AppTextField({
    super.key,
    this.controller,
    this.focusNode,
    this.height,
    this.hintText,
    this.label,
    this.validator,
    this.inputfieldLimit,
    this.suffixIcon,
    this.inputAction,
    this.onFieldSubmitted,
    this.onChanged,
    this.onEditingComplete,
    this.onTapOutside,
    this.isSecure = false,
    this.textKeyBoard = true,
    this.maxLine = 1,
    this.horizontalMargin = 0,
    this.verticalMargin = 6,
    this.enable = true,
    this.isNumberKeyboard = false,
    this.floatingLabelBehavior = FloatingLabelBehavior.always,
    this.cursorColor,
    this.color,
    this.borderMainColor = primaryColor,
    this.borderSecColor = secondaryColor,
    this.borderRadius = 8,
    this.marginl = 0,
    this.margint,
    this.marginr = 0,
    this.marginb,
    this.contentPl,
    this.contentPt,
    this.contentPr,
    this.contentPb,
    this.hintStyle,
    this.labelStyle,
    this.style,
    this.prefixText,
    this.prefixStyle,
    this.suffixText,
    this.suffixStyle,
    this.keyboardType,
    this.alignLabelWithHint,
    this.autofocus = false,
    this.fillColor,
    this.showBorder = true,
    this.prefixIcon,
    this.autovalidateMode,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: style,
      autofocus: autofocus,
      autovalidateMode: autovalidateMode,
      onFieldSubmitted: onFieldSubmitted,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onTapOutside: onTapOutside,
      textInputAction: inputAction,
      enabled: enable,
      maxLines: maxLine,
      obscureText: isSecure,
      cursorColor: cursorColor ?? primaryColor,
      focusNode: focusNode,
      validator: validator,
      inputFormatters: [
        LengthLimitingTextInputFormatter(inputfieldLimit),
      ],
      controller: controller,
      keyboardType: keyboardType ?? (isNumberKeyboard ? TextInputType.number : TextInputType.emailAddress),
      decoration: InputDecoration(
        filled: fillColor != null ? true : false,
        fillColor: fillColor,
        floatingLabelBehavior: floatingLabelBehavior,
        prefixText: prefixText,
        prefixIcon: prefixIcon,
        alignLabelWithHint: alignLabelWithHint,
        prefixStyle: prefixStyle,
        suffixText: suffixText,
        suffixStyle: suffixStyle,
        contentPadding: EdgeInsets.fromLTRB(contentPl ?? 10, contentPt ?? 0, contentPr ?? 10, contentPb ?? 0),
        hintText: hintText,
        hintStyle: hintStyle,
        label: label != null ? Text(label!) : null,
        labelStyle: labelStyle,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderSide: showBorder ? const BorderSide() : BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        // when filed are not focus
        enabledBorder: OutlineInputBorder(
          borderSide: showBorder ? BorderSide(color: borderSecColor) : BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        // when filed are focus
        focusedBorder: OutlineInputBorder(
          borderSide: showBorder ? BorderSide(color: borderMainColor) : BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: showBorder ? BorderSide(color: borderSecColor) : BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: showBorder ? BorderSide(color: borderMainColor) : BorderSide.none,
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
    );
  }
}
