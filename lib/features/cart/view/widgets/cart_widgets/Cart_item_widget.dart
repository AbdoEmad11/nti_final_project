import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_final_project/features/cart/view/widgets/cart_widgets/qty_button_widget.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../data/cubits/cart_cubit.dart';
import '../../../data/models/cart_model.dart';

class CartItemWidget extends StatelessWidget {
  final CartItemModel item;

  const CartItemWidget({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: AppColors.surfaceLight,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ─── Product Image ───────────────────
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: CachedNetworkImage(
              imageUrl: item.imageUrl,
              width: 80.w,
              height: 80.h,
              fit: BoxFit.cover,
              placeholder: (_, __) => Container(
                color: AppColors.primaryLight,
                child: const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.primary,
                  ),
                ),
              ),
              errorWidget: (_, __, ___) => Container(
                color: AppColors.primaryLight,
                child: Icon(
                  Icons.image_not_supported_rounded,
                  color: AppColors.primary,
                  size: 24.sp,
                ),
              ),
            ),
          ),
          SizedBox(width: 12.w),

          // ─── Product Info ────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        item.name,
                        style: AppTextStyles.titleLarge,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    // Delete Button
                    GestureDetector(
                      onTap: () => context.read<CartCubit>().removeItem(item.id),
                      child: Container(
                        padding: EdgeInsets.all(4.r),
                        decoration: BoxDecoration(
                          color: AppColors.error.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                        child: Icon(
                          Icons.delete_rounded,
                          color: AppColors.error,
                          size: 16.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.h),
                Text(
                  item.variant,
                  style: AppTextStyles.bodySmall,
                ),
                SizedBox(height: 12.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Price
                    Text(
                      '\$${item.price.toStringAsFixed(2)}',
                      style: AppTextStyles.price,
                    ),
                    // Quantity Controls
                    QtyButtonWidget(
                      quantity: item.quantity,
                      onIncrement: () => context.read<CartCubit>().incrementQuantity(item.id),
                      onDecrement: () => context.read<CartCubit>().decrementQuantity(item.id),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}