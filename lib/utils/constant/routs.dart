import 'package:all_games2/screens/category_page/category.dart';
import 'package:all_games2/screens/game_list_screen/game_list_page.dart';
import 'package:all_games2/screens/get_started/get_started.dart';
import 'package:all_games2/screens/home_screen/home_page.dart';
import 'package:all_games2/screens/no_internet_connection_screen/view/no_internet_screeen.dart';
import 'package:all_games2/screens/play_screen/view/play_screen.dart';
import 'package:all_games2/screens/setting/setting.dart';
import 'package:all_games2/screens/splash_screen/view/splash_screen.dart';
import 'package:all_games2/screens/web_view_screen/view/web_view_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.route: (context) => const SplashScreen(),
  CategoryPage.route: (context) => const CategoryPage(),
  HomePage.route: (context) => const HomePage(),
  GameListPage.route: (context) => const GameListPage(),
  GetStarted.route: (context) => const GetStarted(),
  NoInterNetScreen.route: (context) => const NoInterNetScreen(),
  PlayScreen.route: (context) => const PlayScreen(),
  PlayScreen2.route: (context) => const PlayScreen2(),
  SettingScreen.route: (context) => const SettingScreen(),
  WebViewScreen.route: (context) => const WebViewScreen(),
};
