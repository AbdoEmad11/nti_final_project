import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashLoader extends StatelessWidget {
  final AnimationController loadCtrl;

  const SplashLoader({super.key, required this.loadCtrl});

  @override
  Widget build(BuildContext context) {
    final load = CurvedAnimation(
      parent: loadCtrl,
      curve: Curves.easeInOut,
    );

    return Positioned(
      bottom: 60.h,
      left: 48.w,
      right: 48.w,
      child: AnimatedBuilder(
        animation: load,
        builder: (_, __) => ClipRRect(
          borderRadius: BorderRadius.circular(4.r),
          child: LinearProgressIndicator(
            value: load.value,
            backgroundColor: Colors.white24,
            valueColor: const AlwaysStoppedAnimation(Colors.white),
            minHeight: 3.h,
          ),
        ),
      ),
    );
  }
}
