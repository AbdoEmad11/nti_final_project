import 'package:flutter/material.dart';

class SizeSelectorDetails extends StatelessWidget {
  const SizeSelectorDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Select Size',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            _SizeOption(text: 'Standard', selected: true),
            SizedBox(width: 16),
            _SizeOption(text: 'Compact', selected: false),
          ],
        ),
      ],
    );
  }
}

class _SizeOption extends StatelessWidget {
  final String text;
  final bool selected;

  const _SizeOption({
    required this.text,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: selected ? Colors.indigo : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.indigo),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: selected ? Colors.white : Colors.indigo,
        ),
      ),
    );
  }
}