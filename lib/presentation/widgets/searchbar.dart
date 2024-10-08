import 'package:assignment/presentation/widgets/app_colors.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;

  const CustomSearchBar({
    super.key,
    this.hintText = "Search...",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288,
      height: 44,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius:  BorderRadius.circular(10),
        border: Border.all(
          color: const Color(0xFFE4E6ED),
          width: 1,
        ),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
