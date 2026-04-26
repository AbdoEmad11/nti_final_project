import 'package:flutter/material.dart';

class ProductFormField extends StatelessWidget {
  final String label;
  final String? placeholder;
  final IconData icon;
  final TextInputType keyboardType;
  final int maxLines;
  final Function(String) onChanged;
  final String? value;

  const ProductFormField({
    Key? key,
    required this.label,
    this.placeholder,
    required this.icon,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    required this.onChanged,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF333333),
            ),
          ),
        ),
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              child: Center(
                child: Icon(icon, color: const Color(0xFFA0A0A0), size: 20),
              ),
            ),
            Expanded(
              child: TextField(
                onChanged: onChanged,
                keyboardType: keyboardType,
                maxLines: maxLines,
                controller: TextEditingController(text: value ?? ''),
                decoration: InputDecoration(
                  hintText: placeholder,
                  hintStyle: const TextStyle(
                    color: Color(0xFFA0A0A0),
                    fontSize: 14,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(8),
                      bottomRight: Radius.circular(8),
                    ),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: const Color(0xFFF5F5F5),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
