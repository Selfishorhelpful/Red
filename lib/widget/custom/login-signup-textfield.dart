import 'package:flutter/material.dart';

import '../../utils/helpers/app-color.dart';


class CustomTextFieldPrimary extends StatelessWidget {
  final String labelText;
  final String hintText;

  const CustomTextFieldPrimary({super.key, required this.labelText, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Text(labelText,
              style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  color: AppColors.text)),
        ),
        TextField(
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
          ),
        ),
      ],
    );
  }
}