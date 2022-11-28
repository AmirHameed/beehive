import 'package:beehive/utils/constants.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function? onClick;
  final double borderRadius;
  final Color? color;
  final Color? textColor;
  final TextStyle? fontStyle;
  final Color? borderColor;
  final double fontSize;
  final bool isEnabled;

  const AppButton(
      {required this.text,
      required this.onClick,
      this.borderRadius = 8,
      this.color,
      this.borderColor,
        this.fontStyle,
      this.textColor,
      this.fontSize = 15,
      this.isEnabled = true});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: const BoxConstraints(minHeight: 44, maxHeight: 44),
      onPressed: isEnabled ? () => onClick?.call() : null,
      fillColor: isEnabled ? color : Colors.white54,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          side: BorderSide(width: 1, color: borderColor ?? color!)),
      child: Text(text,
          style:fontStyle?? TextStyle(
              color: textColor,
              fontSize: fontSize,
              fontFamily: Constants.cairoBold)),
    );
  }
}

class IconAppButton extends StatelessWidget {
  final Widget? prefixIcon;
  final String text;
  final Function? onClick;
  final double borderRadius;
  final Color? color;
  final Color? textColor;
  final double fontSize;
  final bool isEnabled;

  const IconAppButton(
      {required this.text,
      required this.onClick,
      this.borderRadius = 8,
      this.color,
      this.textColor,
      this.fontSize = 15,
      this.isEnabled = true,
      this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        constraints: const BoxConstraints(minHeight: 44, maxHeight: 44),
        onPressed: isEnabled ? () => onClick?.call() : null,
        fillColor: isEnabled ? color : Colors.white54,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              prefixIcon != null ? prefixIcon! : const SizedBox(),
              SizedBox(width: prefixIcon != null ? 5 : 0),
              Text(text,
                  style: TextStyle(
                      color: textColor,
                      fontFamily: Constants.cairoMedium,
                      fontSize: fontSize))
            ]));
  }
}
