import 'package:flutter/material.dart';

class ColorSelectorDetails extends StatelessWidget {
  const ColorSelectorDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Color',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            _ColorOption(color: Colors.black),
            SizedBox(width: 16),
            _ColorOption(color: Colors.white),
            SizedBox(width: 16),
            _ColorOption(color: Colors.blue),
          ],
        ),
      ],
    );
  }
}

class _ColorOption extends StatelessWidget {
  final Color color;

  const _ColorOption({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.grey.shade300),
      ),
    );
  }
}