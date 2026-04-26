import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
<<<<<<< Updated upstream

=======
import 'package:nti_final_project/core/styling/app_colors.dart';
import 'package:nti_final_project/core/styling/app_theme.dart';
import 'package:nti_final_project/features/auth/view/widgets/primary_button_widget.dart';
>>>>>>> Stashed changes

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
<<<<<<< Updated upstream
      builder: (context, child) {
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
=======
      designSize: const Size(390, 884),
      builder: (context, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme.ligthTheme,
          home: child,
        );
      },
      child: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: <Widget>[PrimaryButtonWidget(onPressed: () {})],
        ),
      ),
    );
  }
}
>>>>>>> Stashed changes
