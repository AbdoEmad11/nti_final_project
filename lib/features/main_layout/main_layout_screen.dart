import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/cart/data/cubits/cart_cubit.dart';
import 'package:nti_final_project/features/cart/view/screens/cart_screen.dart';
import 'package:nti_final_project/features/home/view/cubits/categories_cubit.dart';
import 'package:nti_final_project/features/home/view/cubits/offer_cubit.dart';
import 'package:nti_final_project/features/home/view/cubits/product_cubit.dart';
import 'package:nti_final_project/features/home/view/screens/home_screens.dart';
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

  List<Widget> get screens {
    return [
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => OffersCubit()),
          BlocProvider(create: (_) => CategoriesCubit()),
          BlocProvider(create: (_) => ProductsCubit()),
        ],
        child: const HomeScreen(),
      ),
      const CategoriesScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (_) => CartCubit(),
      child: Scaffold(
        body: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
        bottomNavigationBar: CustomBottomNavBar(
          currentIndex: currentIndex,
          onTap: onTabChanged,
        ),
      ),
    );
  }
}