import 'package:flutter/material.dart';
import 'package:freetalk/core/theming/app_colors.dart';

class CustomTextButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextDecoration? decoration;

  const CustomTextButton({
    super.key,
    required this.title,
    required this.onTap,
    this.textColor,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      child: Text(
        title,
        style: TextStyle(
          color: textColor ?? AppColors.white,
          fontSize: fontSize,
          fontWeight: fontWeight,
          decoration: decoration,
        ),
      ),
    );
  }
}
