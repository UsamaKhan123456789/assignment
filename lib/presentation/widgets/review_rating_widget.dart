import 'package:flutter/material.dart';

import 'app_colors.dart';

class ReviewRatingWidget extends StatelessWidget {
  const ReviewRatingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 343,
        height: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColor.containerBg,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildRatingRow(5, 70),
            _buildRatingRow(4, 50),
            _buildRatingRow(3, 30),
            _buildRatingRow(2, 20),
            _buildRatingRow(1, 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 24,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 24,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 24,
                ),
                Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 24,
                ),
                Icon(
                  Icons.star_half,
                  color: Colors.yellow,
                  size: 24,
                ),
                SizedBox(width: 8),
                Text(
                  '4.5',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '52 Reviews',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingRow(int stars, double percentage) {
    return Row(
      children: [
        Text(
          '$stars',
          style: const TextStyle(fontSize: 16),
        ),
        const Icon(
          Icons.star,
          color: Colors.yellow,
          size: 16,
        ),
        Expanded(
          child: Container(
            height: 10,
            margin: const EdgeInsets.only(right: 100.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: FractionallySizedBox(
              widthFactor: percentage / 100,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.green,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
