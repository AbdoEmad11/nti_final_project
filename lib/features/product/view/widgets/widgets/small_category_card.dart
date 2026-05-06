import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SmallCategoryCard extends StatelessWidget {
  final String title;
  final String image;

  const SmallCategoryCard({
    super.key,
    required this.title,
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
            size: 36,
            color: Colors.indigo,
          ),
        ),
      );
    }

    if (_isSvg) {
      return Container(
        color: Colors.white,
        padding: const EdgeInsets.all(25),
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
              size: 36,
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
            _buildImage(),
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