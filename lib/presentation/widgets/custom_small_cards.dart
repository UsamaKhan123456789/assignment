import 'package:assignment/presentation/widgets/app_colors.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String imagePath;

  const CustomCard({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColor.cardBorderColor,
          width: 1, // Border width
        ),
      ),
      child: Center(
        child: Image.asset(
          imagePath,
          width: 40,
          height: 40,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
