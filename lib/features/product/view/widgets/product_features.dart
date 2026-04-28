import 'package:flutter/material.dart';

class ProductFeatures extends StatelessWidget {
  const ProductFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        _FeatureCard(
          icon: Icons.local_shipping,
          text: 'Fast Ship 24 Hours',
        ),
        SizedBox(width: 16),
        _FeatureCard(
          icon: Icons.verified,
          text: 'Warranty 2 Years',
        ),
      ],
    );
  }
}

class _FeatureCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const _FeatureCard({
    required this.icon,
    required this.text,
  });

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