import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/core/widgets/app_bar_widget.dart';
import 'package:nti_final_project/features/product/view/cubit/categroy_cubit.dart';
import 'package:nti_final_project/features/product/view/cubit/categroy_state.dart';
import 'package:nti_final_project/features/product/view/widgets/widgets/big_category_card.dart';
import 'package:nti_final_project/features/product/view/widgets/widgets/section_title_widget.dart';
import 'package:nti_final_project/features/product/view/widgets/widgets/small_category_card.dart';
import 'package:nti_final_project/features/product/view/widgets/widgets/trending_card.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryCubit>(
      create: (_) => CategoryCubit()..getCategories(),
      child: const _CategoriesView(),
    );
  }
}

class _CategoriesView extends StatelessWidget {
  const _CategoriesView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LuxeAppBar(),
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            await context.read<CategoryCubit>().getCategories();
          },
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Explore",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Curated collections for your lifestyle",
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),

                BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return const SizedBox(
                        height: 300,
                        child: Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }

                    if (state is CategoryError) {
                      return SizedBox(
                        height: 300,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.error_outline,
                                color: Colors.red,
                                size: 40,
                              ),
                              const SizedBox(height: 12),
                              Text(
                                state.message,
                                textAlign: TextAlign.center,
                                style: const TextStyle(color: Colors.red),
                              ),
                              const SizedBox(height: 12),
                              ElevatedButton(
                                onPressed: () {
                                  context
                                      .read<CategoryCubit>()
                                      .getCategories();
                                },
                                child: const Text('Try Again'),
                              ),
                            ],
                          ),
                        ),
                      );
                    }

                    if (state is CategorySuccess) {
                      final categories = state.categories;

                      if (categories.isEmpty) {
                        return const SizedBox(
                          height: 300,
                          child: Center(
                            child: Text('No categories found'),
                          ),
                        );
                      }

                      return Column(
                        children: [
                          BigCategoryCard(
                            title: categories.first.name,
                            subtitle: "${categories.length} Items",
                            image: categories.first.coverPictureUrl,
                          ),

                          const SizedBox(height: 20),

                          ...List.generate(
                            ((categories.length - 1) / 2).ceil(),
                                (index) {
                              final firstIndex = (index * 2) + 1;
                              final secondIndex = (index * 2) + 2;

                              if (firstIndex >= categories.length) {
                                return const SizedBox.shrink();
                              }

                              final first = categories[firstIndex];
                              final hasSecond =
                                  secondIndex < categories.length;

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
                                        title:
                                        categories[secondIndex].name,
                                        image: categories[secondIndex]
                                            .coverPictureUrl,
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

                    return const SizedBox(
                      height: 300,
                      child: Center(
                        child: Text('Start loading categories'),
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),
                const SectionTitle(title: "Trending Now"),
                const SizedBox(height: 12),
                const Row(
                  children: [
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
      ),
    );
  }
}