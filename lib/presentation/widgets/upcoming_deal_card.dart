import 'package:flutter/material.dart';
import 'app_colors.dart';

class UpcomingDealCard extends StatefulWidget {
  final String date;
  final String month;

  const UpcomingDealCard({
    super.key,
    required this.date,
    required this.month,
  });

  @override
  State<UpcomingDealCard> createState() => _UpcomingDealCardState();
}

class _UpcomingDealCardState extends State<UpcomingDealCard> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTapped = !isTapped;
        });
      },
      child: Container(
        width: 40,
        height: 53,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
        decoration: BoxDecoration(
          color: isTapped ? AppColor.homeColor2 : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: const Color.fromRGBO(138, 212, 196, 1),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              widget.date,
              style: const TextStyle(
                color: AppColor.cartColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              widget.month,
              style: const TextStyle(
                color: AppColor.cartColor,
                fontSize: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
