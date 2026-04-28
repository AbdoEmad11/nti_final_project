import 'package:flutter/material.dart';
import 'package:nti_final_project/features/cart/view/screens/cart_screen.dart';
import 'package:nti_final_project/features/home/view/screens/home_screen.dart';
import 'package:nti_final_project/features/product/view/screens/categories_screen.dart';
import 'package:nti_final_project/features/profile/view/screens/profile_screen.dart';
import 'widgets/custom_bottom_nav_bar.dart';

class MainLayoutScreen extends StatefulWidget {
  final int initialIndex;

  const MainLayoutScreen({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<MainLayoutScreen> createState() => _MainLayoutScreenState();
}

class _MainLayoutScreenState extends State<MainLayoutScreen> {
  late int currentIndex;

  final List<Widget> screens = const [
    HomeScreen(),
    CategoriesScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
  }

  void onTabChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: onTabChanged,
      ),
    );
  }
}