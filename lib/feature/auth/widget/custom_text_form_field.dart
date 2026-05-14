import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Color? fillColor;
  final dynamic border; // Kept to avoid breaking existing usages passing border: null

  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.validator,
    this.fillColor,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      style: TextStyle(
        color: theme.colorScheme.onSurface,
        fontFamily: "LeagueSpartan",
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: fillColor, // Falls back to theme if null
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: theme.hintColor)
            : null,
        suffixIcon: suffixIcon,
        // Ensure error validations have the right border and font styling
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: theme.colorScheme.error, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: theme.colorScheme.error, width: 2.0),
        ),
        errorStyle: TextStyle(
          color: theme.colorScheme.error,
          fontFamily: "LeagueSpartan",
          fontSize: 13,
        ),
      ),
    );
  }
}
