import 'package:flutter/material.dart';
import 'package:quotes_app/views/DetailPage/detail_page.dart';
import 'package:quotes_app/views/HomePage/home_page.dart';
import 'package:quotes_app/views/SplashScreen/splash_screen.dart';

class Routes {
  static String splashScreen = '/';
  static String homePage = 'home_page';
  static String detailPage = 'detail_page';

  Map<String, WidgetBuilder> myRoutes = {
    splashScreen: (context) => const SplashScreen(),
    homePage: (context) => const HomePage(),
    detailPage: (context) => const DetailPage(),
  };
}
