import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:nti_final_project/core/styling/app_theme.dart';
import 'package:nti_final_project/features/product/view/screens/categories_screen.dart';
import 'core/utils/app_routs.dart';
import 'features/product/view/cubit/categroy_cubit.dart';

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
          home: BlocProvider(
            create: (context) => CategoryCubit(),
            child: CategoriesScreen(),
          ),
          debugShowCheckedModeBanner: false,
          theme: AppTheme.ligthTheme,
          initialRoute: AppRoutes.splash,
          onGenerateRoute: AppRoutes.onGenerateRoute,
        );
      },
    );
  }
}
