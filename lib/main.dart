import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_final_project/core/styling/app_colors2.dart';
import 'package:nti_final_project/core/styling/app_theme.dart';
import 'package:nti_final_project/features/auth/view/screens/login_screen.dart';
import 'package:nti_final_project/features/auth/view/widgets/primary_button_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 884),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,

          theme: AppTheme.ligthTheme,
          home: LoginScreen(),
        );
      },
    );
  }
}
