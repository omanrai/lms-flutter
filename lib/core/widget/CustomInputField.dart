import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final String labelText;
  final Icon prefixIcon;
  final double borderRadius;
  final TextEditingController? controller;
  final bool obscureText;
  final bool readOnly; // New property
  final VoidCallback? onTap; // Optional callback for read-only fields
  final String? Function(String?)? validator;

  const CustomInputField({
    Key? key,
    this.labelText = "Input",
    this.prefixIcon = const Icon(Icons.input),
    this.borderRadius = 8.0,
    this.controller,
    this.obscureText = false,
    this.readOnly = false, // Default to false
    this.onTap, // Callback when tapped (useful for read-only fields)
    this.validator
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      readOnly: readOnly,
      onTap: onTap,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        labelText: labelText,
        prefixIcon: prefixIcon,
        filled: readOnly, // Optional: change background when read-only
        fillColor: readOnly ? Colors.grey[200] : null,
      ),
    );
  }
}
