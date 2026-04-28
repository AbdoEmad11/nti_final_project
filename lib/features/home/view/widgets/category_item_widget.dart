import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.icon,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 28,
          backgroundColor: widget.isSelected
              ? Color(0xffC7D2FE)
              : Colors.grey[200],
          child: IconButton(
            onPressed: widget.onTap,
            icon: Icon(widget.icon, color: Color(0xff4D41DF)),
          ),
        ),
        SizedBox(height: 5),
        TextButton(
          onPressed: widget.onTap,
          child: Text(
            widget.title,
            style: TextStyle(
              color: widget.isSelected ? Color(0xff4D41DF) : Color(0xff464555),
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
