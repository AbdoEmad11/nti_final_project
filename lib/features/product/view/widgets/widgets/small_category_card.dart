import 'package:flutter/material.dart';
import 'package:nti_final_project/core/widgets/safe_network_image.dart';

class SmallCategoryCard extends StatelessWidget {
  final String title;
  final String image;

  const SmallCategoryCard({
    super.key,
    required this.title,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 250,
        width: 160,
        child: Stack(
          fit: StackFit.expand,
          children: [
            SafeNetworkImage(
              url: image,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 250,
              iconSize: 36,
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(.55),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
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