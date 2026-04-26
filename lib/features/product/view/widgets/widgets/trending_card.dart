import 'package:flutter/material.dart';

class TrendingCard extends StatelessWidget {
  final String title;
  final IconData icon;

  const TrendingCard({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.indigo.withOpacity(.15),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.indigo),
          const SizedBox(height: 10),
          Text(title, style: const TextStyle(color: Colors.indigo)),
        ],
      ),
    );
  }
}