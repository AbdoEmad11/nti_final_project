import 'dart:async';
import 'package:nti_final_project/features/home/view/cubits/categories_cubit.dart';
import 'package:nti_final_project/features/home/view/cubits/categories_state.dart';
import 'package:nti_final_project/features/home/view/cubits/offer_cubit.dart';
import 'package:nti_final_project/features/home/view/cubits/offer_state.dart';
import 'package:nti_final_project/features/home/view/cubits/product_cubit.dart';
import 'package:nti_final_project/features/home/view/cubits/product_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/context_theme_extension.dart';
import '../../../../core/widgets/app_bar_widget.dart';
import '../../../../core/widgets/safe_network_image.dart';
import '../widgets/product_item_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  final List<IconData> icons = [
    Icons.devices,
    Icons.checkroom,
    Icons.home,
    Icons.spa,
  ];

  int offerIndex = 0;
  Timer? offerTimer;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<OffersCubit>(context).getOffers();
    BlocProvider.of<CategoriesCubit>(context).getCategories();
    BlocProvider.of<ProductsCubit>(context).getProducts();
  }

  @override
  void dispose() {
    offerTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: const LuxeAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<OffersCubit, OffersStates>(
                builder: (context, state) {
                  if (state is OffersIsLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is OffersFailerState) {
                    return Text("Error is : ${state.messageError}");
                  } else if (state is OffersSuccessState) {
                    if (state.offers.isNotEmpty && offerTimer == null) {
                      offerTimer = Timer.periodic(Duration(seconds: 3), (_) {
                        setState(() {
                          offerIndex = (offerIndex + 1) % state.offers.length;
                        });
                      });
                    }

                    return ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Stack(
                        children: [
                          SafeNetworkImage(
                            url: state.offers.isNotEmpty ? state.offers[offerIndex].coverUrl : '',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 200,
                          ),
                          Container(
                            width: double.infinity,
                            height: 200,
                            padding: EdgeInsets.all(22),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.25),
                            ),
                            child: Column(
                              spacing: 15,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "NEW COLLECTION",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),
                                ),

                                Text(
                                  "Elevate Your Style",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),

                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff4D41DF),
                                  ),
                                  child: Text(
                                    "Shop Now",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(
                      fontSize: 18,
                      color: context.appTheme.textPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See all",
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff4D41DF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              SizedBox(
                height: 120,
                child: BlocBuilder<CategoriesCubit, CategoriesStates>(
                  builder: (context, state) {
                    if (state is CategoriesIsLoadingState) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is CategoriesFailerState) {
                      return Text("Error is : ${state.messageError}");
                    } else if (state is CategoriesSuccessState) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: state.categories.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(9),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: ClipOval(
                                    child: SafeNetworkImage(
                                      url: state.categories[index].coverPictureUrl,
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                      iconSize: 28,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  state.categories[index].name,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: context.appTheme.textPrimary,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return SizedBox();
                    }
                  },
                ),
              ),

              SizedBox(height: 25),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Popular Products",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: context.appTheme.textPrimary,
                    ),
                  ),
                  SvgPicture.asset("assets/icons/Background.svg"),
                ],
              ),
              SizedBox(height: 15),

              BlocBuilder<ProductsCubit, ProductsStates>(
                builder: (context, state) {
                  if (state is ProductsIsLoadingState) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is ProductsFailerState) {
                    return Text("Error is : ${state.messageError}");
                  } else if (state is ProductsSuccessState) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: state.products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .7,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return ProductItem(product: state.products[index]);
                      },
                    );
                  } else {
                    return SizedBox();
                  }
                },
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(25),
      //       topRight: Radius.circular(25),
      //     ),
      //     boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
      //   ),
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(20),
      //       topRight: Radius.circular(20),
      //     ),
      //     child: BottomNavigationBar(
      //       backgroundColor: Colors.white,
      //       selectedItemColor: Color(0xff4F46E5),
      //       unselectedItemColor: Color(0xff94A3B8),
      //       type: BottomNavigationBarType.fixed,
      //       items: [
      //         BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.grid_view),
      //           label: "Categories",
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.shopping_cart),
      //           label: "Cart",
      //         ),
      //         BottomNavigationBarItem(
      //           icon: Icon(Icons.person),
      //           label: "Profile",
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
