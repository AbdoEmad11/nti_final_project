import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/core/widgets/safe_network_image.dart';
import 'package:nti_final_project/features/cart/data/cubits/cart_cubit.dart';
import 'package:nti_final_project/features/home/data/models/products_model.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel? product;

  const ProductDetailsScreen({
    super.key,
    this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F3FF),
      body: SafeArea(
        child: Column(
          children: [
            _DetailsHeader(product: product),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    _ProductImage(product: product),
                    _DetailsContent(product: product),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _BottomCartBar(product: product),
    );
  }
}

class _DetailsHeader extends StatelessWidget {
  final ProductModel? product;

  const _DetailsHeader({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 10, 18, 8),
      child: Row(
        children: [
          _CircleIconButton(
            icon: Icons.arrow_back_ios_new_rounded,
            onTap: () => Navigator.pop(context),
          ),
          const Spacer(),
          const Text(
            'Product Details',
            style: TextStyle(
              color: Color(0xff1A1B22),
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Spacer(),
          _CircleIconButton(
            icon: Icons.favorite_border_rounded,
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Wishlist feature is coming soon'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleIconButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shape: const CircleBorder(),
      elevation: 0,
      child: InkWell(
        customBorder: const CircleBorder(),
        onTap: onTap,
        child: SizedBox(
          width: 44,
          height: 44,
          child: Icon(
            icon,
            size: 20,
            color: const Color(0xff1A1B22),
          ),
        ),
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  final ProductModel? product;

  const _ProductImage({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final imageUrl = product?.coverPictureUrl ?? '';

    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 12, 18, 18),
      child: Container(
        height: 330,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(32),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff4D41DF).withOpacity(0.10),
              blurRadius: 28,
              offset: const Offset(0, 14),
            ),
          ],
        ),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            SafeNetworkImage(
              url: imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
              iconSize: 60,
            ),
            Positioned(
              top: 16,
              left: 16,
              child: _StockBadge(product: product),
            ),
          ],
        ),
      ),
    );
  }
}

class _StockBadge extends StatelessWidget {
  final ProductModel? product;

  const _StockBadge({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final stock = product?.stock ?? 0;
    final inStock = stock > 0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
      decoration: BoxDecoration(
        color: inStock ? const Color(0xffDCFCE7) : const Color(0xffFEE2E2),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        inStock ? 'In Stock' : 'Out of Stock',
        style: TextStyle(
          color: inStock ? const Color(0xff16A34A) : const Color(0xffDC2626),
          fontSize: 12,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}

class _DetailsContent extends StatelessWidget {
  final ProductModel? product;

  const _DetailsContent({
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final name = product?.name ?? 'Product Details';
    final description = product?.description.isNotEmpty == true
        ? product!.description
        : 'No description available for this product.';
    final price = product?.price ?? 0;
    final rating = product?.rating ?? 0;
    final reviews = product?.reviewsCount ?? 0;
    final color = product?.color.isNotEmpty == true ? product!.color : 'Default';
    final stock = product?.stock ?? 0;
    final discount = product?.discountPercentage ?? 0;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(22, 26, 22, 130),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(36),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (discount > 0)
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
              decoration: BoxDecoration(
                color: const Color(0xffFFF1F2),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                '${discount.toStringAsFixed(0)}% OFF',
                style: const TextStyle(
                  color: Color(0xffE11D48),
                  fontSize: 12,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xff1A1B22),
                    fontSize: 26,
                    fontWeight: FontWeight.w900,
                    height: 1.1,
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Text(
                '\$${price.toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Color(0xff4D41DF),
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                decoration: BoxDecoration(
                  color: const Color(0xffFEF3C7),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Color(0xffF59E0B),
                      size: 18,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      rating.toStringAsFixed(1),
                      style: const TextStyle(
                        color: Color(0xff92400E),
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '$reviews reviews',
                style: const TextStyle(
                  color: Color(0xff6B7280),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: _InfoTile(
                  icon: Icons.color_lens_outlined,
                  title: 'Color',
                  value: color,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _InfoTile(
                  icon: Icons.inventory_2_outlined,
                  title: 'Stock',
                  value: '$stock items',
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Description',
            style: TextStyle(
              color: Color(0xff1A1B22),
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: const TextStyle(
              color: Color(0xff6B7280),
              fontSize: 15,
              height: 1.6,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 26),
          const Text(
            'Features',
            style: TextStyle(
              color: Color(0xff1A1B22),
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 14),
          const Row(
            children: [
              Expanded(
                child: _FeatureTile(
                  icon: Icons.local_shipping_outlined,
                  text: 'Fast Delivery',
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _FeatureTile(
                  icon: Icons.verified_user_outlined,
                  text: 'Quality Guarantee',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xffF5F3FF),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xff4D41DF),
            size: 22,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xff6B7280),
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Color(0xff1A1B22),
                    fontSize: 14,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FeatureTile({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xffFAFAFA),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: const Color(0xffE5E7EB),
        ),
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: const Color(0xff4D41DF),
            size: 26,
          ),
          const SizedBox(height: 8),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Color(0xff1A1B22),
              fontSize: 13,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}
class _BottomCartBar extends StatefulWidget {
  final ProductModel? product;

  const _BottomCartBar({
    required this.product,
  });

  @override
  State<_BottomCartBar> createState() => _BottomCartBarState();
}

class _BottomCartBarState extends State<_BottomCartBar> {
  bool isAdded = false;

  void _addToCart(BuildContext context) {
    final product = widget.product;

    if (product == null) return;

    context.read<CartCubit>().addProduct(product);

    setState(() {
      isAdded = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${product.name} added to cart'),
        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    // زي زرار الهوم: طالما المنتج موجود، يضيف للكارت
    final canAdd = product != null;

    return SafeArea(
      top: false,
      child: Container(
        padding: const EdgeInsets.fromLTRB(18, 12, 18, 14),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 24,
              offset: const Offset(0, -8),
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(
              width: 56,
              height: 56,
              child: ElevatedButton(
                onPressed: canAdd ? () => _addToCart(context) : null,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: isAdded
                      ? const Color(0xffDCFCE7)
                      : const Color(0xffF3F0FF),
                  disabledBackgroundColor: const Color(0xffF3F4F6),
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: Icon(
                  isAdded
                      ? Icons.check_rounded
                      : Icons.shopping_cart_outlined,
                  color: isAdded
                      ? const Color(0xff16A34A)
                      : const Color(0xff1A1B22),
                  size: 24,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: SizedBox(
                height: 56,
                child: ElevatedButton(
                  onPressed: canAdd ? () => _addToCart(context) : null,
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: isAdded
                        ? const Color(0xff16A34A)
                        : const Color(0xff4D41DF),
                    disabledBackgroundColor: Colors.grey.shade300,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        isAdded ? 'Added' : 'Add to Cart',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        isAdded
                            ? Icons.check_circle_outline_rounded
                            : Icons.arrow_forward_rounded,
                        color: Colors.white,
                        size: 22,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}