import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/product/data/models/categroy_cubit.dart';
import 'package:nti_final_project/features/product/data/models/categroy_state.dart';
import 'package:nti_final_project/features/product/view/widgets/widgets/big_category_card.dart';
import 'package:nti_final_project/features/product/view/widgets/widgets/section_title_widget.dart';
import 'package:nti_final_project/features/product/view/widgets/widgets/small_category_card.dart';
import 'package:nti_final_project/features/product/view/widgets/widgets/trending_card.dart';

import '../../../../core/widgets/app_bar_widget.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CategoryCubit>(context).getCategories();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LuxeAppBar(),
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
    
              // ✅ هنا بنعرض الداتا الجاية من الـ API
              BlocBuilder<CategoryCubit, CategoryState>(
                builder: (context, state) {
                  if (state is CategoryLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
    
                  if (state is CategoryError) {
                    return Center(
                      child: Column(
                        children: [
                          Text(
                            state.message,
                            style: const TextStyle(color: Colors.red),
                          ),
                          const SizedBox(height: 8),
                         
                        ],
                      ),
                    );
                  }
    
                  if (state is CategorySuccess) {
                    final categories = state.categories;
                    return Column(
                      children: [
                        // أول كاتيجوري BigCard
                        if (categories.isNotEmpty)
                          BigCategoryCard(
                            title: categories[0].name,
                            subtitle: "${categories.length} Items",
                            image: categories[0].coverPictureUrl,
                          ),
    
                        const SizedBox(height: 20),
    
                        // باقي الكاتيجوريز SmallCards (2 في كل صف)
                        ...List.generate(
                          ((categories.length - 1) / 2).ceil(),
                          (index) {
                            final first = categories[(index * 2) + 1];
                            final secondIndex = (index * 2) + 2;
                            final hasSecond = secondIndex < categories.length;
    
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: SmallCategoryCard(
                                      title: first.name,
                                      image: first.coverPictureUrl,
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  Expanded(
                                    child: hasSecond
                                        ? SmallCategoryCard(
                                            title: categories[secondIndex].name,
                                            image: categories[secondIndex].coverPictureUrl,
                                          )
                                        : const SizedBox(),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    );
                  }
    
                  return const SizedBox();
                },
              ),
    
              const SizedBox(height: 20),
              const SectionTitle(title: "Trending Now"),
              const SizedBox(height: 12),
              Row(
                children: const [
                  Expanded(
                    child: TrendingCard(
                      title: "Limited Offers",
                      icon: Icons.workspace_premium,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TrendingCard(
                      title: "Flash Sale",
                      icon: Icons.flash_on,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}