import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nti_final_project/features/home/data/models/products_model.dart';

import '../../../../core/widgets/safe_network_image.dart';
import '../../../cart/data/cubits/cart_cubit.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel? product;

  const ProductDetailsScreen({super.key, this.product});

  @override
  Widget build(BuildContext context) {
    final currentProduct = product;

    return Scaffold(
      bottomNavigationBar: _AddToCartBar(product: currentProduct),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _AppHeader(product: currentProduct),
              _ProductTopImage(product: currentProduct),
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xffF4F4F6),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _TitleAndPrice(product: currentProduct),
                      const SizedBox(height: 16),
                      _RatingRow(product: currentProduct),
                      const SizedBox(height: 16),
                      const _ProductFeatures(),
                      const SizedBox(height: 16),
                      _InfoSection(
                        title: 'Color',
                        value: currentProduct?.color.isNotEmpty == true
                            ? currentProduct!.color
                            : 'Not specified',
                      ),
                      const SizedBox(height: 16),
                      _InfoSection(
                        title: 'Stock',
                        value: currentProduct == null
                            ? 'Not available'
                            : '${currentProduct.stock} items',
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Detailed description',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        currentProduct?.description.isNotEmpty == true
                            ? currentProduct!.description
                            : 'No description available for this product.',
                        style: const TextStyle(color: Colors.grey, height: 1.6),
                      ),
                      const SizedBox(height: 100),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppHeader extends StatelessWidget {
  final ProductModel? product;

  const _AppHeader({this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
              ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProductTopImage extends StatelessWidget {
  final ProductModel? product;

  const _ProductTopImage({this.product});

  @override
  Widget build(BuildContext context) {
    final imageUrl = product?.coverPictureUrl ?? '';

    return Card(
      margin: const EdgeInsets.all(16),
      clipBehavior: Clip.antiAlias,
      child: AspectRatio(
        aspectRatio: 16 / 10,
        child:SafeNetworkImage(
        url: imageUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        iconColor: Colors.indigo,
        iconSize: 60,
      ),
      ),
    );
  }

  Widget _fallback() {
    return Container(
      color: const Color(0xffF5F3FF),
      child: const Icon(
        Icons.image_not_supported_outlined,
        color: Colors.indigo,
        size: 60,
      ),
    );
  }
}

class _TitleAndPrice extends StatelessWidget {
  final ProductModel? product;

  const _TitleAndPrice({this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            product?.name ?? 'Product Details',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            maxLines: 2,
          ),
        ),
        const SizedBox(width: 12),
        Text(
          '\$${(product?.price ?? 0).toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 22,
            color: Colors.indigo,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class _RatingRow extends StatelessWidget {
  final ProductModel? product;

  const _RatingRow({this.product});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber),
        const SizedBox(width: 8),
        Text(
          '${(product?.rating ?? 0).toStringAsFixed(1)} (${product?.reviewsCount ?? 0} reviews)',
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}

class _ProductFeatures extends StatelessWidget {
  const _ProductFeatures();

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        _FeatureCard(icon: Icons.local_shipping, text: 'Fast Ship 24 Hours'),
        SizedBox(width: 16),
        _FeatureCard(icon: Icons.verified, text: 'Warranty Available'),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FeatureCard({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.indigo),
            const SizedBox(height: 8),
            Text(
              text,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoSection extends StatelessWidget {
  final String title;
  final String value;

  const _InfoSection({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.indigo),
          ),
          child: Text(
            value,
            style: const TextStyle(
              color: Colors.indigo,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

class _AddToCartBar extends StatelessWidget {
  final ProductModel? product;

  const _AddToCartBar({this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: product == null
                  ? null
                  : () {
                context.read<CartCubit>().addProduct(product!);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('${product!.name} added to cart'),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text(
                'Add to Cart',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}