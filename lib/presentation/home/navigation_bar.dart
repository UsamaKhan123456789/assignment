import 'package:assignment/presentation/home/screens/categories_screen.dart';
import 'package:assignment/presentation/home/screens/home_screen.dart';
import 'package:assignment/presentation/home/screens/location_screen.dart';
import 'package:assignment/presentation/home/screens/profile_screen.dart';
import 'package:assignment/presentation/widgets/app_colors.dart';
import 'package:flutter/material.dart';

class NavigationAppBar extends StatefulWidget {
  const NavigationAppBar({super.key});

  @override
  State<NavigationAppBar> createState() => _NavigationAppBarState();
}

class _NavigationAppBarState extends State<NavigationAppBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const CategoriesScreen(),
    const LocationScreen(),
    const ProfileScreen(),
  ];

  final List<IconData> _icons = [
    Icons.home,
    Icons.grid_view_rounded,
    Icons.location_on,
    Icons.person,
  ];

  final List<String> _labels = ['Home', 'Category', 'Location', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: AppColor.navigationBarIconColor,
        type: BottomNavigationBarType.fixed,
        items: List.generate(_icons.length, (index) {
          return BottomNavigationBarItem(
            icon: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _currentIndex == index ? 110 : 50,
              height: 50,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: _currentIndex == index
                  ? BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [
                    AppColor.navigationBoxColor1,
                    AppColor.buttonColor1,
                    AppColor.buttonColor2
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              )
                  : null,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    _icons[index],
                    color: _currentIndex == index
                        ? Colors.white
                        : AppColor.navigationBarIconColor,
                  ),
                  if (_currentIndex == index)
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          _labels[index],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 10
                          ),
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ),
                ],
              ),
            ),
            label: '',
          );
        }),
      ),
    );
  }
}
