

import 'package:flutter/material.dart';
import 'package:nti_final_project/features/product/view/widgets/widgets/app_header.dart';
import 'package:nti_final_project/features/product/view/widgets/widgets/bottom_nav_bar.dart';
import 'package:nti_final_project/features/product/view/widgets/widgets/filter_sort_.dart';
import 'package:nti_final_project/features/product/view/widgets/widgets/product_card.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: AppHeader(),
              ),

              const SizedBox(height: 20),

              /// Title section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("PREMIUM TECH",
                        style: TextStyle(color: Colors.indigo)),
                    SizedBox(height: 8),
                    Text("Smartphones",
                        style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              const FilterSortBar(),
              const SizedBox(height: 20),

              /// Grid products
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: .72,
                  children: const [
                    ProductCard(
                      brand: "APPLE",
                      title: "iPhone 16",
                      price: 1199,
                      oldPrice: 1499,
                      discount: "-20%",
                      image: "assets/images/iphone16.png",
                      rating: 4.8,
                      reviews: 128,
                    ),
                    ProductCard(
                      brand: "SAMSUNG",
                      title: "Galaxy S24 Ultra",
                      price: 1299,
                      image: "assets/images/s24.png",
                      isNew: true,
                      rating: 4.7,
                      reviews: 89,
                    ),
                    ProductCard(
                      brand: "GOOGLE",
                      title: "Pixel 8 Pro",
                      price: 849,
                      oldPrice: 999,
                      discount: "-15%",
                      image: "assets/images/pixel8.png",
                      rating: 4.9,
                      reviews: 214,
                    ),
                    ProductCard(
                      brand: "NOTHING",
                      title: "Nothing Phone (4a) Pro ",
                      price: 599,
                      image: "assets/images/nothing.png",
                      rating: 4.6,
                      reviews: 56,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                ),
                child: const Text("View More Products"),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}