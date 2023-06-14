import 'package:all_games2/screens/category_page/category.dart';
import 'package:all_games2/screens/game_list_screen/game_list_page.dart';
import 'package:all_games2/screens/get_started/get_started.dart';
import 'package:all_games2/screens/home_screen/home_page.dart';
import 'package:all_games2/screens/no_internet_connection_screen/view/no_internet_screeen.dart';
import 'package:all_games2/screens/play_screen/view/play_screen.dart';
import 'package:all_games2/screens/setting/setting.dart';
import 'package:all_games2/screens/splash_screen/view/splash_screen.dart';
import 'package:all_games2/screens/web_view_screen/view/web_view_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

final List<GetPage> getPages = [
  getPageAnimationR2L(name: SplashScreen.route, page: const SplashScreen()),
  getPageAnimationR2L(name: CategoryPage.route, page: const CategoryPage()),
  getPageAnimationR2L(name: GameListPage.route, page: const GameListPage()),
  getPageAnimationR2L(name: HomePage.route, page: const HomePage()),
  getPageAnimationR2L(name: GetStarted.route, page: const GetStarted()),
  getPageAnimationR2L(
      name: NoInterNetScreen.route, page: const NoInterNetScreen()),
  getPageAnimationR2L(name: PlayScreen.route, page: const PlayScreen()),
  getPageAnimationR2L(name: PlayScreen2.route, page: const PlayScreen2()),
  getPageAnimationR2L(name: SettingScreen.route, page: const SettingScreen()),
  getPageAnimationR2L(name: WebViewScreen.route, page: const WebViewScreen()),
];

GetPage getPageAnimationR2L({required String name, required Widget page}) {
  return GetPage(
    name: name,
    page: () => page,
    transition: Transition.leftToRight,
    transitionDuration: const Duration(milliseconds: 600),
  );
}
