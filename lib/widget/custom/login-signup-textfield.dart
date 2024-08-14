import 'package:flutter/material.dart';
import '../../utils/helpers/app-color.dart';

class CustomTextFieldPrimary extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscureText;
  final bool isPasswordVisible;
  final VoidCallback? togglePasswordVisibility;

  const CustomTextFieldPrimary({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.validator,
    this.obscureText = false,
    this.isPasswordVisible = false,
    this.togglePasswordVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            labelText,
            style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.normal,
                color: AppColors.text),
          ),
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureText && !isPasswordVisible, // Hide or show password
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.normal,
                color: AppColors.subText),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.text),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: AppColors.theme),
            ),
            suffixIcon: obscureText  // Show the visibility icon if it's a password field
                ? IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility  // Show this when password is visible
                          : Icons.visibility_off,  // Show this when password is hidden
                      color: AppColors.text,
                    ),
                    onPressed: togglePasswordVisibility,  // Call the function to toggle visibility
                  )
                : null,
          ),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
