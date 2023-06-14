import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:all_games2/screens/splash_screen/view/splash_screen.dart';

class RouteGenerater {
  List<GetPage> getAllRoute() {
    List<GetPage> pages = [
      getPageAnimationR2L(name: SplashScreen.route, page: const SplashScreen()),
    ];
    return pages;
  }

  GetPage getPageAnimationR2L({required String name, required Widget page}) {
    return GetPage(
      name: name,
      page: () => page,
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    );
  }
}
