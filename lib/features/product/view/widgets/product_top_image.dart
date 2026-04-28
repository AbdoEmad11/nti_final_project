import 'package:flutter/material.dart';

class ProductTopImage extends StatelessWidget {
  const ProductTopImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16),
      child: AspectRatio(
        aspectRatio: 16 / 9, // You can adjust this ratio
        child: Image.asset(
          'assets/images/Premium Headphones.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}