import 'package:flutter/material.dart';
import '../../constants/app_textstyle.dart';
import '../../constants/utils/utils.dart';
import 'app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  final bool leftIcon;
  final TextStyle? textStyle;

  const CustomAppBar({
    super.key,
    required this.title,
    this.height = kToolbarHeight,
    this.leftIcon = true,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (leftIcon)
            IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColor.black),
              onPressed: () {
                Navigator.of(context).pop(); // Navigate back
              },
            ),
          Expanded(
            child: Text(
              title,
              style: textStyle ?? AppTextStyle.infoStyle,
              textAlign: TextAlign.left,
            ),
          ),
          if (leftIcon)
            SizedBox(width: getProportionateWidth(40, context: context)),
        ],
      ),
      centerTitle: false,
      elevation: 0.0,
      backgroundColor: Colors.white,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
