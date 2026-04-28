import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'views/screens/easy_checkout_screen.dart';
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';

>>>>>>> 204d8d2d206bdcc3f30b88a0918bce538b28c350

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
<<<<<<< HEAD
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luxe Checkout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const EasyCheckoutScreen(),
=======
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
        );
      },
>>>>>>> 204d8d2d206bdcc3f30b88a0918bce538b28c350
    );
  }
}