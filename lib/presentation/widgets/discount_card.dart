import 'package:assignment/constants/app_textstyle.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class DiscountCard extends StatelessWidget {
  final String discountText;
  const DiscountCard({super.key, required this.discountText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColor.discountCardBorderColor,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Center(
              child: Text(
                discountText,
                style: AppTextStyle.discountText
              ),
            ),
          ),
        ],
      ),
    );
  }
}
