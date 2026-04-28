// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../../core/theme/app_colors.dart';
// import '../../../../core/theme/app_text_styles.dart';
// import '../../../../core/widgets/app_button.dart';
// import '../cubit/cart_cubit.dart';
// import '../cubit/cart_state.dart';
//
// class CartScreen extends StatefulWidget {
//   const CartScreen({super.key});
//
//   @override
//   State<CartScreen> createState() => _CartScreenState();
// }
//
// class _CartScreenState extends State<CartScreen> {
//   @override
//   void initState() {
//     super.initState();
//     context.read<CartCubit>().loadCart();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => CartCubit()..loadCart(),
//       child: Scaffold(
//         backgroundColor: Theme.of(context).scaffoldBackgroundColor,
//         appBar: AppBar(
//           title: Text('My Cart', style: AppTextStyles.headlineMedium),
//           centerTitle: true,
//           automaticallyImplyLeading: false,
//         ),
//         body: BlocBuilder<CartCubit, CartState>(
//           builder: (context, state) {
//             if (state is CartLoading) {
//               return const Center(
//                 child: CircularProgressIndicator(color: AppColors.primary),
//               );
//             }
//
//             if (state is CartError) {
//               return Center(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Icon(Icons.error_outline_rounded,
//                         size: 48.sp, color: AppColors.error),
//                     SizedBox(height: 12.h),
//                     Text(state.message, style: AppTextStyles.bodyMedium),
//                     SizedBox(height: 16.h),
//                     TextButton(
//                       onPressed: () => context.read<CartCubit>().loadCart(),
//                       child: const Text('Retry'),
//                     ),
//                   ],
//                 ),
//               );
//             }
//
//             if (state is CartSuccess) {
//               if (state.items.isEmpty) {
//                 return _EmptyCart();
//               }
//
//               return Column(
//                 children: [
//                   // ─── Cart Items List ───────────────────
//                   Expanded(
//                     child: ListView.separated(
//                       padding: EdgeInsets.all(20.r),
//                       itemCount: state.items.length,
//                       separatorBuilder: (_, __) => SizedBox(height: 12.h),
//                       itemBuilder: (_, i) => _CartItem(
//                         item: state.items[i],
//                         onIncrement: () =>
//                             context.read<CartCubit>().incrementQuantity(i),
//                         onDecrement: () =>
//                             context.read<CartCubit>().decrementQuantity(i),
//                         onRemove: () => context
//                             .read<CartCubit>()
//                             .removeFromCart(state.items[i].id),
//                       ),
//                     ),
//                   ),
//
//                   // ─── Order Summary ─────────────────────
//                   Container(
//                     padding: EdgeInsets.all(20.r),
//                     decoration: BoxDecoration(
//                       color: Theme.of(context).cardTheme.color,
//                       borderRadius:
//                       BorderRadius.vertical(top: Radius.circular(24.r)),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.08),
//                           blurRadius: 16,
//                           offset: const Offset(0, -4),
//                         ),
//                       ],
//                     ),
//                     child: Column(
//                       children: [
//                         _SummaryRow(
//                             label: 'Subtotal',
//                             value: '\
//                             $$
//                             {state.total.toStringAsFixed(2)}',
//                         ),
//                         SizedBox(height: 8.h),
//                         _SummaryRow(label: 'Shipping', value: 'Free'),
//                         SizedBox(height: 8.h),
//                         const Divider(),
//                         SizedBox(height: 8.h),
//                         _SummaryRow(
//                           label: 'Total',
//                           value: '\
//                           $$
//                           {state.total.toStringAsFixed(2)}',
//                           isTotal: true,
//                         ),
//                         SizedBox(height: 16.h),
//                         AppButton(
//                           label: 'Proceed to Checkout',
//                           icon: Icon(Icons.arrow_forward_rounded,
//                               color: Colors.white, size: 18.sp),
//                           onTap: () {},
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               );
//             }
//
//             return const SizedBox.shrink();
//           },
//         ),
//       ),
//     );
//   }
// }
//
// // ─── Cart Item Widget ───────────────────────────────────────────────────────────
// class _CartItem extends StatelessWidget {
//   final CartItemModel item;
//   final VoidCallback onIncrement;
//   final VoidCallback onDecrement;
//   final VoidCallback onRemove;
//
//   const _CartItem({
//     required this.item,
//     required this.onIncrement,
//     required this.onDecrement,
//     required this.onRemove,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(12.r),
//       decoration: BoxDecoration(
//         color: Theme.of(context).cardTheme.color,
//         borderRadius: BorderRadius.circular(16.r),
//         boxShadow: [
//           BoxShadow(
//             color: AppColors.primary.withOpacity(0.06),
//             blurRadius: 12,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           // Image
//           ClipRRect(
//             borderRadius: BorderRadius.circular(12.r),
//             child: CachedNetworkImage(
//               imageUrl: item.imageUrl,
//               width: 80.w,
//               height: 80.h,
//               fit: BoxFit.cover,
//               placeholder: (_, __) =>
//                   Container(color: AppColors.primaryLight),
//               errorWidget: (_, __, ___) => Container(
//                 color: AppColors.primaryLight,
//                 child: const Icon(Icons.image_not_supported_rounded,
//                     color: AppColors.primary),
//               ),
//             ),
//           ),
//           SizedBox(width: 12.w),
//
//           // Info
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//               Text(
//               item.productName,
//               style: AppTextStyles.titleMedium,
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//             SizedBox(height: 4.h),
//             Text(
//                 '\
//                 $$
//                 {item.price.toStringAsFixed(2)}',
//             style: AppTextStyles.price.copyWith(fontSize: 14.sp),
//           ),
//           SizedBox(height: 8.h),
//
//           // Quantity Controls
//           Row(
//             children: [
//               _QtyButton(
//                 icon: Icons.remove_rounded,
//                 onTap: onDecrement,
//               ),
//               SizedBox(width: 12.w),
//               Text(
//                 '${item.quantity}',
//                 style: AppTextStyles.titleMedium,
//               ),
//               SizedBox(width: 12.w),
//               _QtyButton(
//                 icon: Icons.add_rounded,
//                 onTap: onIncrement,
//               ),
//             ],
//           ),
//         ],
//       ),
//     ),
//
//     // Remove Button
//     Column(
//     children: [
//     GestureDetector(
//     onTap: onRemove,
//     child: Icon(
//     Icons.delete_outline_rounded,
//     color: AppColors.error,
//     size: 22.sp,
//     ),
//     ),
//     SizedBox(height: 32.h),
//     Text(
//     '\
//     $$
//     {item.subtotal.toStringAsFixed(2)}',
//     style: AppTextStyles.titleMedium.copyWith(
//     color: AppColors.primary,
//     ),
//     ),
//     ],
//     ),
//     ],
//     ),
//     );
//   }
// }
//
// // ─── Quantity Button ────────────────────────────────────────────────────────────
// class _QtyButton extends StatelessWidget {
//   final IconData icon;
//   final VoidCallback onTap;
//
//   const _QtyButton({required this.icon, required this.onTap});
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         width: 28.w,
//         height: 28.h,
//         decoration: BoxDecoration(
//           color: AppColors.primaryLight,
//           borderRadius: BorderRadius.circular(8.r),
//         ),
//         child: Icon(icon, size: 16.sp, color: AppColors.primary),
//       ),
//     );
//   }
// }
//
// // ─── Summary Row ────────────────────────────────────────────────────────────────
// class _SummaryRow extends StatelessWidget {
//   final String label;
//   final String value;
//   final bool isTotal;
//
//   const _SummaryRow({
//     required this.label,
//     required this.value,
//     this.isTotal = false,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           label,
//           style: isTotal ? AppTextStyles.titleLarge : AppTextStyles.bodyMedium,
//         ),
//         Text(
//           value,
//           style: isTotal
//               ? AppTextStyles.titleLarge.copyWith(color: AppColors.primary)
//               : AppTextStyles.titleMedium,
//         ),
//       ],
//     );
//   }
// }
//
// // ─── Empty Cart ─────────────────────────────────────────────────────────────────
// class _EmptyCart extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Container(
//             width: 120.w,
//             height: 120.w,
//             decoration: BoxDecoration(
//               color: AppColors.primaryLight,
//               shape: BoxShape.circle,
//             ),
//             child: Icon(
//               Icons.shopping_cart_outlined,
//               size: 56.sp,
//               color: AppColors.primary,
//             ),
//           ),
//           SizedBox(height: 24.h),
//           Text('Your Cart is Empty', style: AppTextStyles.headlineSmall),
//           SizedBox(height: 8.h),
//           Text(
//             'Add items to your cart to get started',
//             style: AppTextStyles.bodyMedium,
//           ),
//         ],
//       ),
//     );
//   }
// }