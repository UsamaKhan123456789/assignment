import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_svg/svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:assignment/presentation/widgets/discount_card.dart';
import 'package:assignment/presentation/widgets/upcoming_deal_card.dart';
import 'package:assignment/constants/app_textstyle.dart';
import '../../../constants/assets.dart';
import '../../../constants/strings.dart';
import '../../widgets/app_colors.dart';
import '../../widgets/custom_circle_avatar.dart';
import '../../widgets/custom_small_cards.dart';
import '../../widgets/searchbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCountry = 'UAE';
  int _currentIndex = 0;

  final List<String> countries = ['UAE', 'Canada', 'UK', 'Germany', 'France'];
  final List<String> carouselImages = [
    Assets.carouselImage,
    Assets.carouselImage,
    Assets.carouselImage,
  ];

  final List<Map<String, dynamic>> categories = [
    {
      "label": "Dining",
      "image": Assets.category1,
      "backgroundColor": AppColor.homeColor2
    },
    {
      "label": "Salon/Spa",
      "image": Assets.category2,
      "backgroundColor": AppColor.filterColor1
    },
    {
      "label": "Entertainment",
      "image": Assets.category3,
      "backgroundColor": AppColor.filterColor2
    },
    {
      "label": "Cleaning",
      "image": Assets.category4,
      "backgroundColor": AppColor.filterColor3
    },
  ];

  final List<String> discountValues = [
    'Up to 10%',
    'Up to 20%',
    'Up to 30%',
    'Up to 40%',
    'Up to 50%',
    'Up to 60%',
  ];

  final List<String> cardImages = [
    Assets.card1,
    Assets.card2,
    Assets.card3,
    Assets.card4,
    Assets.card5,
    Assets.card6,
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 292,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColor.homeColor1, AppColor.homeColor2],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: selectedCountry,
                                icon: const SizedBox.shrink(),
                                dropdownColor: Colors.white,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    selectedCountry = newValue!;
                                  });
                                },
                                selectedItemBuilder: (BuildContext context) {
                                  return countries.map<Widget>((
                                      String country) {
                                    return Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(country, style: const TextStyle(
                                            color: Colors.black)),
                                        const SizedBox(width: 2),
                                        SvgPicture.asset(
                                          Assets.dropArrow,
                                          width: 8.44,
                                          height: 4.98,
                                        ),
                                      ],
                                    );
                                  }).toList();
                                },
                                items: countries.map<DropdownMenuItem<String>>((
                                    String country) {
                                  return DropdownMenuItem<String>(
                                    value: country,
                                    child: Text(country, style: const TextStyle(
                                        color: Colors.black)),
                                  );
                                }).toList(),
                              ),
                            ),
                            Image.asset(
                              Assets.appLogo,
                              width: 80,
                              height: 80,
                            ),
                            Stack(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.shopping_cart,
                                      color: AppColor.cartColor),
                                  onPressed: () {},
                                ),
                                Positioned(
                                  right: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(2),
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    constraints: const BoxConstraints(
                                      minWidth: 20,
                                      minHeight: 20,
                                    ),
                                    child: const Text(
                                      '03',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(0),
                                child: CustomSearchBar(
                                  hintText: "Search...",
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    AppColor.buttonColor1,
                                    AppColor.buttonColor2
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  Assets.filter,
                                  width: 24,
                                  height: 24,
                                ),
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
          Positioned(
            top: 175,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
                border: Border.all(
                  color: const Color.fromRGBO(228, 230, 237, 1),
                  width: 1,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        Strings.filterByCategory,
                        style: AppTextStyle.headingText,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categories.length,
                        itemBuilder: (context, index) {
                          final category = categories[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: CustomCircleAvatar(
                              backgroundColor: category['backgroundColor'] ?? AppColor.homeColor2,
                              imagePath: category['image']!,
                              labelText: category['label']!,
                            ),
                          );
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Divider(),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        Strings.filterByDiscount,
                        style: AppTextStyle.headingText,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 40,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: discountValues.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: DiscountCard(
                              discountText: discountValues[index],
                            ),
                          );
                        },
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Divider(),
                    ),
                    const Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        Strings.upcomingDeal,
                        style: AppTextStyle.headingText,
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          DateTime date = DateTime.now().add(Duration(days: index));
                          String day = DateFormat('dd').format(date);
                          String month = DateFormat('MMM').format(date);
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: UpcomingDealCard(
                              date: day,
                              month: month,
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 30,),
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 150,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                      ),
                      items: carouselImages.map((image) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Stack(
                              children: [
                                // The image as background
                                Container(
                                  width: 345,
                                  height: 150,
                                  margin: const EdgeInsets.symmetric(horizontal: 5),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      Assets.carouselImage, // Your image asset
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                  ),
                                ),
                                // The gradient overlay with transparency
                                Container(
                                  width: 345,
                                  height: 150,
                                  margin: const EdgeInsets.symmetric(horizontal: 5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(
                                      colors: [
                                        Color(0xFFE47C7B).withOpacity(0.6), // Soft red with transparency
                                        Color(0xFF000000).withOpacity(0.5), // Black with transparency
                                      ],
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                    ),
                                  ),
                                ),
                                // Text and other elements on top of the gradient
                                Positioned(
                                  top: 15,
                                  right: 10,
                                  child: Text(
                                    Strings.onlyAed,
                                    style: AppTextStyle.headingText.copyWith(
                                      fontSize: 20,
                                      color: AppColor.white,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 70,
                                  left: 35,
                                  child: Container(
                                    width: 74,
                                    height: 21,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      color: Colors.white.withOpacity(0.8),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        '30% Off',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const Positioned(
                                  bottom: 45,
                                  left: 35,
                                  child: Text(
                                    Strings.dinner,
                                    style: AppTextStyle.carouselText,
                                  ),
                                ),
                                const Positioned(
                                  bottom: 10,
                                  left: 35,
                                  child: Text(
                                    Strings.zheng,
                                    style: AppTextStyle.carouselText2,
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }).toList(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: carouselImages.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => setState(() {
                            _currentIndex = entry.key;
                          }),
                          child: Container(
                            width: _currentIndex == entry.key ? 18.0 : 7.0,
                            height: 7.0,
                            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _currentIndex == entry.key ? AppColor.homeColor2 : Colors.grey,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const SizedBox(height: 10,),
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        Strings.dealOfTheDay,
                        style: AppTextStyle.headingText,
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Restaurant Card
                          Container(
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
                          const SizedBox(height: 10),
                          // Restaurant Name
                          const Text(
                            'The Great Restaurant',
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          // Description text
                          const Text(
                            'Delicious meals and dining experience',
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
                                'Downtown, New York',
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
                                '4.9',
                                style: TextStyle(fontSize: 14),
                              ),
                              SizedBox(width: 5),
                              Icon(Icons.star, size: 12, color: AppColor.starColor),
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
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        Strings.ourPartners,
                        style: AppTextStyle.headingText,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                          childAspectRatio: 1.8,
                        ),
                        itemCount: cardImages.length,
                        itemBuilder: (context, index) {
                          return CustomCard(
                            imagePath: cardImages[index],
                          );
                        },
                      ),
                    )



                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
