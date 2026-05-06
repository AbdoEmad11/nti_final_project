import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BigCategoryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const BigCategoryCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  bool get _isValidUrl {
    final uri = Uri.tryParse(image);
    return uri != null && uri.hasScheme && uri.host.isNotEmpty;
  }

  bool get _isSvg => image.toLowerCase().endsWith('.svg');

  Widget _buildImage() {
    if (!_isValidUrl) {
      return Container(
        color: Colors.indigo.shade100,
        child: const Center(
          child: Icon(
            Icons.image_not_supported_outlined,
            size: 48,
            color: Colors.indigo,
          ),
        ),
      );
    }

    if (_isSvg) {
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(35),
        child: SvgPicture.network(
          image,
          fit: BoxFit.contain,
          placeholderBuilder: (_) => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return Image.network(
      image,
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) {
        return Container(
          color: Colors.indigo.shade100,
          child: const Center(
            child: Icon(
              Icons.broken_image_outlined,
              size: 48,
              color: Colors.indigo,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: 200,
        width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _buildImage(),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(.65),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.white70),
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}