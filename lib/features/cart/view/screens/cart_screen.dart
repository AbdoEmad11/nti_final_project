import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/app_constants.dart';
import '../../data/cubits/cart_cubit.dart';
import '../../data/cubits/cart_state.dart';
import '../widgets/cart_widgets/Cart_item_widget.dart';
import '../widgets/cart_widgets/empty_cart_widget.dart';
import '../widgets/cart_widgets/order_summary_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartCubit(),
      child: Scaffold(
        backgroundColor: AppColors.bgLight,
        appBar: AppBar(
          backgroundColor: AppColors.surfaceLight,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Icon(
                Icons.menu_rounded,
                color: AppColors.primary,
                size: 24.sp,
              ),
              SizedBox(width: 12.w),
              Text(
                AppConstants.appName,
                style: AppTextStyles.headlineSmall.copyWith(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search_rounded,
                color: AppColors.textPrimary,
                size: 24.sp,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            if (state is CartLoading) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            }

            if (state is CartEmpty) {
              return EmptyCartWidget(
                onBrowse: () {
                },
              );
            }

            if (state is CartLoaded) {
              return SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20.h),
                            Text(
                              'Your Cart',
                              style: AppTextStyles.displayLarge.copyWith(
                                fontSize: 28.sp,
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              '${state.items.length} items ready for checkout',
                              style: AppTextStyles.bodyMedium,
                            ),
                            SizedBox(height: 24.h),
                            ...state.items.map((item) => CartItemWidget(item: item)),
                            SizedBox(height: 24.h),
                            OrderSummaryWidget(summary: state.summary),
                            SizedBox(height: 100.h),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            if (state is CartError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline_rounded,
                      size: 48.sp,
                      color: AppColors.error,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      state.message,
                      style: AppTextStyles.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}