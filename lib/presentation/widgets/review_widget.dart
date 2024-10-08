import 'package:flutter/material.dart';

class ReviewWidget extends StatelessWidget {
  final String avatarAssetPath;
  final String name;
  final double rating;
  final String timeAgo;
  final String reviewText;

  const ReviewWidget({
    super.key,
    required this.avatarAssetPath,
    required this.name,
    required this.rating,
    required this.timeAgo,
    required this.reviewText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(avatarAssetPath),
                radius: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        _buildStarRating(rating),
                        const SizedBox(width: 8),
                        Text(
                          timeAgo,
                          style: const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        const Spacer(),
                        const Icon(Icons.more_vert),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            reviewText,
            textAlign: TextAlign.justify,
            style: const TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }

  Widget _buildStarRating(double rating) {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < rating
              ? Icons.star
              : (index < rating + 0.5 ? Icons.star_half : Icons.star_border),
          color: Colors.yellow,
          size: 16,
        );
      }),
    );
  }
}
