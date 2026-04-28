import 'package:flutter/material.dart';

import '../widgets/add_to_cart_bar.dart';
import '../widgets/app_header.dart';
import '../widgets/color_selector_details.dart';
import '../widgets/product_features.dart';
import '../widgets/product_top_image.dart';
import '../widgets/size_selector_details.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const AddToCartBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AppHeader
              const AppHeader(),
              // Product image
              const ProductTopImage(),
              // Product details card
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
                      // Title + Price
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'Premium Headphones',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 2,
                            ),
                          ),
                          Text(
                            '\$299',
                            style: TextStyle(
                              fontSize: 24,
                              color: Colors.indigo,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Rating
                      const Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.red,
                          ),
                          SizedBox(width: 8),
                          Text(
                            '4.8 (120 reviews)',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      // Features
                      const ProductFeatures(),
                      const SizedBox(height: 16),
                      // Color
                      const ColorSelectorDetails(),
                      const SizedBox(height: 16),
                      // Size
                      const SizeSelectorDetails(),
                      const SizedBox(height: 16),
                      // Description
                      const Text(
                        'Detailed description',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'This premium headphones offer exceptional sound quality with noise cancellation technology. Designed for comfort during long listening sessions, featuring adjustable headbands and plush ear cushions. Compatible with all devices via Bluetooth 5.0 and includes a built-in microphone for crystal-clear calls.',
                        style: TextStyle(
                          color: Colors.grey,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 100), // spacing for bottom bar
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