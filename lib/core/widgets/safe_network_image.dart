import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

class SafeNetworkImage extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Widget? fallback;
  final Color backgroundColor;
  final Color iconColor;
  final double iconSize;

  const SafeNetworkImage({
    super.key,
    required this.url,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.fallback,
    this.backgroundColor = const Color(0xffF5F3FF),
    this.iconColor = const Color(0xff6055D8),
    this.iconSize = 40,
  });

  bool get _isSvg {
    final lower = url.toLowerCase();
    return lower.endsWith('.svg') || lower.contains('.svg');
  }

  @override
  Widget build(BuildContext context) {
    if (url.trim().isEmpty) {
      return _fallback();
    }

    if (_isSvg) {
      return FutureBuilder<String?>(
        future: _loadSvg(url),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _loader();
          }

          final svgString = snapshot.data;

          if (svgString == null || svgString.isEmpty) {
            return _fallback();
          }

          return SvgPicture.string(
            svgString,
            width: width,
            height: height,
            fit: fit,
            placeholderBuilder: (_) => _loader(),
          );
        },
      );
    }

    return Image.network(
      url,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (_, __, ___) => _fallback(),
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return _loader();
      },
    );
  }

  Future<String?> _loadSvg(String imageUrl) async {
    try {
      final response = await http.get(
        Uri.parse(imageUrl),
        headers: const {
          'Accept': 'image/svg+xml,image/*,*/*',
          'User-Agent': 'Mozilla/5.0',
        },
      );

      if (response.statusCode < 200 || response.statusCode >= 300) {
        return null;
      }

      final body = response.body.trim();

      // مهم جدًا: ساعات السيرفر بيرجع HTML بدل SVG
      if (!body.contains('<svg')) {
        return null;
      }

      return body;
    } catch (_) {
      return null;
    }
  }

  Widget _loader() {
    return Container(
      width: width,
      height: height,
      color: backgroundColor,
      child: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: Color(0xff6055D8),
        ),
      ),
    );
  }

  Widget _fallback() {
    return fallback ??
        Container(
          width: width,
          height: height,
          color: backgroundColor,
          child: Icon(
            Icons.image_not_supported_outlined,
            color: iconColor,
            size: iconSize,
          ),
        );
  }
}