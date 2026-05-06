import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:nti_final_project/core/theme/context_theme_extension.dart';

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
    final fallbackBackground = backgroundColor == const Color(0xffF5F3FF)
        ? context.appTheme.softPrimary
        : backgroundColor;
    final fallbackIcon =
        iconColor == const Color(0xff6055D8) ? context.appTheme.primary : iconColor;

    if (url.trim().isEmpty) {
      return _fallback(fallbackBackground, fallbackIcon);
    }

    if (_isSvg) {
      return FutureBuilder<String?>(
        future: _loadSvg(url),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _loader(fallbackBackground, fallbackIcon);
          }

          final svgString = snapshot.data;

          if (svgString == null || svgString.isEmpty) {
            return _fallback(fallbackBackground, fallbackIcon);
          }

          return SvgPicture.string(
            svgString,
            width: width,
            height: height,
            fit: fit,
            placeholderBuilder: (_) => _loader(fallbackBackground, fallbackIcon),
          );
        },
      );
    }

    return Image.network(
      url,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (_, __, ___) => _fallback(fallbackBackground, fallbackIcon),
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return _loader(fallbackBackground, fallbackIcon);
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

  Widget _loader(Color fallbackBackground, Color fallbackIcon) {
    return Container(
      width: width,
      height: height,
      color: fallbackBackground,
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
          color: fallbackIcon,
        ),
      ),
    );
  }

  Widget _fallback(Color fallbackBackground, Color fallbackIcon) {
    return fallback ??
        Container(
          width: width,
          height: height,
          color: fallbackBackground,
          child: Icon(
            Icons.image_not_supported_outlined,
            color: fallbackIcon,
            size: iconSize,
          ),
        );
  }
}