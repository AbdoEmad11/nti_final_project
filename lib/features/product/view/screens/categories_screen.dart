

import 'package:flutter/material.dart';
import 'package:nti_final_project/features/product/view/widgets/widgets/app_header.dart';
import 'package:nti_final_project/features/product/view/widgets/widgets/big_category_card.dart';
import 'package:nti_final_project/features/product/view/widgets/widgets/bottom_nav_bar.dart';
import 'package:nti_final_project/features/product/view/widgets/widgets/section_title_widget.dart';
import 'package:nti_final_project/features/product/view/widgets/widgets/small_category_card.dart';
import 'package:nti_final_project/features/product/view/widgets/widgets/trending_card.dart';

import '../../../../core/widgets/app_bar_widget.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LuxeAppBar(),
      // bottomNavigationBar: const CustomBottomNavBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Explore",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),

              const Text(
                "Curated collections for your lifestyle",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 20),

              const BigCategoryCard(
                title: "Electronics",
                subtitle: "2.4k Items",
                image: "assets/images/Gemini_Generated_Image_zbdr9jzbdr9jzbdr.png",
              ),

              const SizedBox(height: 20),

              Row(
                children: const [
                  Expanded(
                    child: SmallCategoryCard(
                      title: "Men's",
                      image: "assets/images/Gemini_Generated_Image_6xjph16xjph16xjp.png",
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: SmallCategoryCard(
                      title: "Women's",
                      image: "assets/images/Gemini_Generated_Image_k5of47k5of47k5of.png",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              Row(
                children: const [
                  Expanded(
                    child: SmallCategoryCard(
                      title: "Home",
                      image: "assets/images/Gemini_Generated_Image_5zjax15zjax15zja.png",
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: SmallCategoryCard(
                      title: "Beauty",
                      image: "assets/images/Gemini_Generated_Image_z7qmjyz7qmjyz7qm.png",
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              const BigCategoryCard(
                title: "Sports & Fitness",
                subtitle: "New Arrival",
                image: "assets/images/Gemini_Generated_Image_k1kgcnk1kgcnk1kg.png",
              ),

              const SizedBox(height: 20),

              const SectionTitle(title: "Trending Now"),

              const SizedBox(height: 12),

              Row(
                children: const [
                  Expanded(child: TrendingCard(title: "Limited Offers", icon: Icons.workspace_premium)),
                  SizedBox(width: 16),
                  Expanded(child: TrendingCard(title: "Flash Sale", icon: Icons.flash_on)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}