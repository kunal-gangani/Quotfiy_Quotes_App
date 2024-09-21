import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quotes_app/routes/routes.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return ScreenUtilInit(
      designSize: Size(
        size.width,
        size.height,
      ),
      minTextAdapt: true,
      builder: (
        context,
        _,
      ) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: Routes().myRoutes,
        );
      },
    );
  }
}
