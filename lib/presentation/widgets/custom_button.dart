import 'package:assignment/constants/app_textstyle.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color? buttonColor;
  final List<Color>? gradientColors;
  final VoidCallback onPressed;

  const CustomButton({
    super.key,
    required this.text,
    this.buttonColor,
    this.gradientColors,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335,
      height: 50,
      padding: const EdgeInsets.fromLTRB(15, 9, 15, 9),
      decoration: BoxDecoration(
        color: buttonColor,
        gradient: gradientColors != null
            ? LinearGradient( // Apply gradient if provided
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: gradientColors!,
        )
            : null,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: EdgeInsets.zero,
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            text,
            style: AppTextStyle.buttonStyle
          ),
        ),
      ),
    );
  }
}
