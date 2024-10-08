import 'package:assignment/constants/app_textstyle.dart';
import 'package:assignment/presentation/widgets/review_rating_widget.dart';
import 'package:assignment/presentation/widgets/review_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../../constants/assets.dart';
import '../../../../constants/strings.dart';
import '../../../widgets/app_colors.dart';
import '../../../widgets/time_slot_card.dart'; // Assuming TimeSeatWidget is defined here
import 'dart:math';

class DealsDetailScreen extends StatefulWidget {
  const DealsDetailScreen({super.key});

  @override
  State<DealsDetailScreen> createState() => _DealsDetailScreenState();
}

class _DealsDetailScreenState extends State<DealsDetailScreen> {
  int itemCount = 1;
  String? selectedLocation = 'Palm Jumeirah';
  DateTime? selectedDate;
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

        // Overlay layout with a white background
        Stack(
          children: [
          Positioned(
          top: 300,
          left: 0,
          right: 0,
          child: Container(
            height: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  // Title with gradient
                  Text(
                  '30 % off',
                  style: TextStyle(
                    fontSize: 30,
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
                const SizedBox(width: 16),
                // Row for fire icon and sold text
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(Assets.fire),
                    const SizedBox(width: 8),
                    const Text(
                      'Sold:',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColor.hintColor,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '564',
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      '5.0',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.hintColor,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      Icons.star,
                      color: AppColor.primaryColor,
                      size: 18,
                    ),
                    SizedBox(width: 4),
                    Text(
                      '(7 reviews)',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColor.hintColor,
                      ),
                    ),
                  ],
                ),
                Text(
                  Strings.restaurantName,
                  style: AppTextStyle.headingText.copyWith(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.location_on_outlined, color: AppColor.hintColor),
                    Text(
                      Strings.address,
                      style: AppTextStyle.hintStyle,
                    ),
                  ],
                ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 407,
                        width: 345,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColor.containerBg,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  Strings.chooseLocation,
                                  style: AppTextStyle.hintStyle,
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  width: 318,
                                  height: 55,
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: AppColor.dateFieldBorderColor),
                                    color: Colors.white.withOpacity(1),
                                  ),
                                  child: DropdownButton<String>(
                                    value: selectedLocation,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    isExpanded: true,
                                    underline: Container(),
                                    items: <String>[
                                      'Palm Jumeirah',
                                      'Burj Khalifa',
                                      'Dubai Mall',
                                      'Jumeirah Beach',
                                      'Dubai Marina',
                                      'Dubai Creek',
                                    ].map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value, style: AppTextStyle.hintStyle),
                                      );
                                    }).toList(),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedLocation = newValue;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(height: 20),
                                const Text(
                                  'Select Date',
                                  style: AppTextStyle.hintStyle,
                                ),
                                const SizedBox(height: 10),
                                GestureDetector(
                                  onTap: () async {
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: selectedDate ?? DateTime.now(),
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2101),
                                    );

                                    if (pickedDate != null && pickedDate != selectedDate) {
                                      setState(() {
                                        selectedDate = pickedDate;
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: 318,
                                    height: 44,
                                    padding: const EdgeInsets.symmetric(horizontal: 20),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: AppColor.dateFieldBorderColor),
                                      color: Colors.white.withOpacity(1),
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          selectedDate != null
                                              ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                                              : 'Select a date',
                                          style: TextStyle(
                                            color: selectedDate != null ? AppColor.hintColor : AppColor.hintColor,
                                          ),
                                        ),
                                        const Icon(Icons.calendar_month, color: AppColor.hintColor),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 10),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    Strings.chooseTimeSlot,
                                    style: AppTextStyle.headingText,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SizedBox(
                                  height: 80, // Set height for the ListView
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 10, // Number of time slots
                                    itemBuilder: (context, index) {
                                      // Generate random time and seats
                                      return Padding(
                                        padding: const EdgeInsets.only(right: 8.0),
                                        child: TimeSeatWidget(
                                          time: _generateRandomTime(),
                                          seats: _generateRandomSeats(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 10,),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    Strings.reservationFee,
                                    style: AppTextStyle.hintStyle,
                                  ),
                                ),
                                Positioned(
                                  top: 847, // Position it as needed
                                  left: 0,
                                  right: 0,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${itemCount * 10} AED', // Display the updated price based on item count
                                        style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                if (itemCount > 1) {
                                                  itemCount--;
                                                }
                                              });
                                            },
                                            child: Container(
                                              width: 39.11,
                                              height: 39.11,
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Colors.black), // Border color
                                                color: AppColor.containerBg,
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  '-',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 39.11,
                                            height: 39.11,
                                            decoration: const BoxDecoration(
                                              color: Colors.transparent, // Transparent background
                                            ),
                                            child: Center(
                                              child: Text(
                                                '$itemCount', // Display the current count
                                                style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                ),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                itemCount++;
                                              });
                                            },
                                            child: Container(
                                              width: 39.11,
                                              height: 39.11,
                                              decoration: BoxDecoration(
                                                border: Border.all(color: Colors.black), // Border color
                                                color: AppColor.containerBg,
                                                shape: BoxShape.circle,
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  '+',
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween, // Adjust alignment as needed
                      children: [
                        Text(
                          Strings.share,
                          style: AppTextStyle.dontHaveAnAccount.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(Assets.fb),
                            const SizedBox(width: 2,),
                            SvgPicture.asset(Assets.twitter),
                            const SizedBox(width: 2,),
                            SvgPicture.asset(Assets.whatsapp),
                            const SizedBox(width: 2,),
                            SvgPicture.asset(Assets.copy),

                          ],
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        Strings.description,
                        style: AppTextStyle.headingText.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        Strings.highlights,
                        style: AppTextStyle.headingText,
                      ),
                    ),
                    const Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        Strings.highlightsParagraph,
                        style: AppTextStyle.hintStyle,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        Strings.aboutTheseDeals,
                        style: AppTextStyle.headingText,
                      ),
                    ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: Strings.typesOfCuisine,
                          style: TextStyle(fontWeight: FontWeight.bold),

                        ),
                        TextSpan(text: ' international\n', style: AppTextStyle.hintStyle),
                        TextSpan(text: 'Multiple starters, mains, and desserts.\n', style: AppTextStyle.hintStyle),
                        TextSpan(text: 'Free flowing soft drink or two house beverages. Valid 7 days a week.' , style: AppTextStyle.hintStyle),
                      ],
                    ),
                  ),
                ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
                   const SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        Strings.termsConditions,
                        style: AppTextStyle.headingText.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        Strings.finePrint,
                        style: AppTextStyle.headingText,
                      ),
                    ),
                    const Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Text(
                        Strings.finePrintText,style: AppTextStyle.hintStyle, textAlign: TextAlign.justify,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        Strings.validDaysAndHours,
                        style: AppTextStyle.headingText,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        Strings.validDaysAndHoursText,
                        style: AppTextStyle.hintStyle,
                        textAlign: TextAlign.justify,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        Strings.storeDetails,
                        style: AppTextStyle.headingText.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        Strings.tjFood,
                        style: AppTextStyle.headingText,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.location_on_outlined, color: AppColor.hintColor),
                        Text(
                          Strings.address,
                          style: AppTextStyle.hintStyle,
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        Strings.number,
                        style: AppTextStyle.headingText,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(Strings.reviews,
                        style: AppTextStyle.headingText.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w500
                        ),),

                        Container(
                          width: 110,
                          height: 30,
                          padding: const EdgeInsets.symmetric(vertical: 2, horizontal:4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: const LinearGradient(
                              colors: [
                                AppColor.buttonColor1,
                                AppColor.buttonColor2,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              Strings.writeReview,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    const ReviewRatingWidget(),
                    const SizedBox(height: 10,),
                    const ReviewWidget(
                        name: "Courtney Henry",
                        rating: 5,
                        timeAgo: "2 mins ago",
                        reviewText: "Consequat velit qui adipisicing sunt do rependerit ad laborum tempor ullamco exercitation. Ullamco tempor adipisicing et voluptate duis sit esse aliqua",
                        avatarAssetPath: Assets.person1,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
                    const ReviewWidget(
                      name: "Courtney Henry",
                      rating: 5,
                      timeAgo: "2 mins ago",
                      reviewText: "Consequat velit qui adipisicing sunt do rependerit ad laborum tempor ullamco exercitation. Ullamco tempor adipisicing et voluptate duis sit esse aliqua",
                      avatarAssetPath: Assets.person1,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
                    const ReviewWidget(
                      name: "Courtney Henry",
                      rating: 5,
                      timeAgo: "2 mins ago",
                      reviewText: "Consequat velit qui adipisicing sunt do rependerit ad laborum tempor ullamco exercitation. Ullamco tempor adipisicing et voluptate duis sit esse aliqua",
                      avatarAssetPath: Assets.person1,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        Strings.suggestedDeals,
                        style: AppTextStyle.headingText.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Restaurant Card
                          GestureDetector(
                            onTap: (){
                              // Get.to(() => const DealsDetailScreen());
                            },
                            child: Container(
                              width: 265,
                              height: 150,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 5,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: Stack(
                                children: [
                                  // Image in the card
                                  Container(
                                    width: double.infinity,
                                    height: 150,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10),
                                      ),
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/restaurant.png'), // Replace with actual image
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const Positioned(
                                    top: 5,
                                    right: 5,
                                    child: Icon(
                                      Icons.favorite_border,
                                      color: Colors.white,
                                      size: 24,
                                    ),
                                  ),
                                  // Small container on top-left
                                  Positioned(
                                    top: 5,
                                    left: 5,
                                    child: Container(
                                      width: 77,
                                      height: 30,
                                      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10), // Adjusted padding
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.5),
                                        borderRadius: BorderRadius.circular(100),
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 1,
                                        ),
                                      ),
                                      child: const Center(
                                        child: FittedBox( // FittedBox helps fit the text into the container
                                          child: Text(
                                            '30 % off',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12, // Adjusted font size to fit within the container
                                              fontWeight: FontWeight.bold, // Optionally make it bold for better readability
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 10),
                          // Restaurant Name
                          const Text(
                            'Ristorante – Niko Romito',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          // Description text
                          const Text(
                            'Dine and enjoy a 20% Discount',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Padding(
                            padding: const EdgeInsets.only(left: 15, top: 10, right: 15), // Adjust the left and right padding to match the card's width
                            child: const Divider(
                              color: Color(0xFFECECEC),
                              thickness: 1, // 1px height as per your CSS
                            ),
                          ),
                          const Row(
                            children: const [
                              Icon(Icons.location_on, size: 16, color: AppColor.hintColor),
                              SizedBox(width: 5),
                              Text(
                                'Ristorante L’Olivo at Al Mah... +5 more',
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            children: const [
                              Text(
                                '5.0',
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(width: 5),
                              Icon(Icons.star, size: 12, color: AppColor.starColor),
                              SizedBox(width: 5),
                              Text(
                                '(7 reviews)',
                                style: TextStyle(fontSize: 14),
                              ),
                              Spacer(), // This pushes the 'Sold: 7350' text to the right
                              Text(
                                'Sold: 7350',
                                style: TextStyle(fontSize: 14),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Stack(
                          children: [
                            Container(
                              width: 165,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(
                                  colors: [
                                    AppColor.buttonColor1,
                                    AppColor.buttonColor2,
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                            ),
                            Container(
                              width: 165,
                              height: 50,
                              padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:  BorderRadius.circular(10),
                                border: Border.all(
                                  color: AppColor.buttonColor1
                                )
                              ),
                              child: const Center(
                                child: Text(
                                  'Left Button',
                                  style:  TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),

                        Container(
                          width: 165,
                          height: 50,
                          padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              colors: [
                               AppColor.buttonColor1,
                               AppColor.buttonColor2,
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              'Right Button',
                              style:  TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 50,)












                  ],
                            ),
                      ),
            ),
      ),
    ),
    ]
    ),

    // Images list below the main image
            Positioned(
                    bottom: 500,
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
                    ],
                    ),
                    ),
                    );
  }

  String _generateRandomTime() {
    final random = Random();
    int hour = random.nextInt(12) + 1; // 1 to 12
    String period = random.nextBool() ? 'AM' : 'PM'; // Random AM/PM
    return '$hour:00 $period'; // Format as '1:00 PM'
  }

  int _generateRandomSeats() {
    final random = Random();
    return random.nextInt(100) + 1; // Random seats between 1 and 100
  }
}
