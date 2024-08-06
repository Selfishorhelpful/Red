
import 'package:flutter/material.dart';

import '../../utils/helpers/app-color.dart';


class CustomThemeButton extends StatelessWidget {
  final String text;
  final double horizontalPadding;
  final double verticalPadding;
  final double textSize;
  final FontWeight textWeight;
  final VoidCallback onPressed;

  const CustomThemeButton({super.key,
    required this.text,
    required this.horizontalPadding,
    required this.verticalPadding,
    required this.textSize,
    required this.textWeight,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.theme,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
        child: Text(
          text,
          style: TextStyle(fontSize: textSize, fontWeight: textWeight, color: AppColors.text),
        ),
      ),
    );
  }
}
