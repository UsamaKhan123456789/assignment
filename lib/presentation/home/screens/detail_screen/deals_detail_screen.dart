import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../constants/assets.dart';
import '../../../widgets/app_colors.dart';

class DealsDetailScreen extends StatefulWidget {
  const DealsDetailScreen({super.key});

  @override
  State<DealsDetailScreen> createState() => _DealsDetailScreenState();
}

class _DealsDetailScreenState extends State<DealsDetailScreen> {
  final List<String> imageList = [
    Assets.image1,
    Assets.image2,
    Assets.image3,
    Assets.image4,
    Assets.restaurantImage,
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Main image
            SizedBox(
              width: 400,
              height: 380,
              child: ClipRRect(
                child: Image.asset(
                  Assets.detailImage,
                  width: 375,
                  height: 346,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Heart icon
            const Positioned(
              top: 16,
              right: 16,
              child: SizedBox(
                width: 24,
                height: 24,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 24,
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 24,
                    ),
                  ],
                ),
              ),
            ),

            // Back arrow icon with gradient background
            Positioned(
              top: 16,
              left: 16,
              child: Container(
                width: 30,
                height: 30,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF6A82FB),
                      Color(0xFFFC5C7D),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromRGBO(0, 0, 0, 0.8),
                      ),
                    ),
                    SvgPicture.asset(
                      Assets.backArrow,
                      width: 12,
                      height: 7,
                    ),
                  ],
                ),
              ),
            ),

            // Images list below the main image
            Positioned(
              bottom: 100,
              left: 25,
              right: 16,
              child: SizedBox(
                height: 50,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imageList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: 50,
                      height: 50,
                      margin: const EdgeInsets.only(right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white,
                          width: 2,
                        ),
                        color: Colors.transparent,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: index == imageList.length - 1
                            ? const Center(
                          child: Text(
                            '5+',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                            : Image.asset(
                          imageList[index],
                          fit: BoxFit.cover,
                          opacity: const AlwaysStoppedAnimation(1.0),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Overlay layout below the main image with a white background
            Positioned(
              top: 300, // Adjust as needed to show where the overlay starts
              left: 0,
              right: 0,
              child: Container(
                height: 500,
                // Remove width and height to allow filling of space dynamically
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white, // White background
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0), // Padding for content
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Title with gradient
                      Text(
                        '30 % off',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          foreground: Paint()
                            ..shader = const LinearGradient(
                              colors: <Color>[
                                AppColor.buttonColor1,
                                AppColor.buttonColor2,
                              ],
                            ).createShader(Rect.fromLTWH(0, 0, 200, 70)),
                        ),
                      ),
                      const SizedBox(height: 16),
                      // Row for fire icon and sold text
                      Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.red,
                                  Colors.orange,
                                ],
                              ),
                            ),
                            child: const Icon(
                              Icons.local_fire_department,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Sold',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            '7350',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Row for rating and reviews
                      const Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 18,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '5.0',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 4),
                          Text(
                            '(7 reviews)',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
