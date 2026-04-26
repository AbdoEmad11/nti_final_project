import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:flutter_screenutil/flutter_screenutil.dart';

=======
import 'views/add_product_screen.dart';
>>>>>>> d77d8c1 (first commit)

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
<<<<<<< HEAD
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
=======
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Add Product App',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: const AddProductScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
>>>>>>> d77d8c1 (first commit)
