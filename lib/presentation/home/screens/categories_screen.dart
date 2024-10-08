import 'package:flutter/material.dart';

import '../../../constants/app_textstyle.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          "Coming Soon..",
          style: AppTextStyle.headingText,
        ),
      ),
    );
  }
}
