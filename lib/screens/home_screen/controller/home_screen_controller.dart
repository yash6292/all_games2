import 'dart:async';
import 'dart:convert';
import 'package:all_games2/screens/category_page/category.dart';
import 'package:all_games2/screens/game_list_screen/game_list_page.dart';
import 'package:all_games2/utils/ad_utils/ad_manager.dart';
import 'package:all_games2/utils/constant/string_constants.dart';
import 'package:all_games2/widgets/loadder.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:all_games2/service/home_screen_service/HomeScreenResponseModel.dart';

final AdManager adManager = Get.put(AdManager());
var homeScreenController = Get.put(HomeScreenController());

class HomeScreenController extends GetxController {
  Rx<HomeScreenResponseModel> homeScreenResponseModel =
      HomeScreenResponseModel().obs;
  RxList<The3DGame> recentPlayedList = <The3DGame>[].obs;
  RxBool isLoading = true.obs;
  RxBool isNet = false.obs;

  @override
  void onInit() {
    super.onInit();
    getHomeScreenData();
  }

  Future<void> getHomeScreenData() async {
    try {
      isNet.value = false;
      isLoading.value = true;
      http.Response response = await http.get(Uri.parse(StringConstant.apiUrl));
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        homeScreenResponseModel.value =
            HomeScreenResponseModel.fromJson(result);
        isLoading.value = false;
      }
    } catch (e) {
      print('err $e');
      isNet.value = true;
      isLoading.value = false;
    } finally {
      isLoading.value = false;
    }

    homeScreenResponseModel.value.data?.category?.action?.shuffle();
    homeScreenResponseModel.value.data?.category?.adventure?.shuffle();
    homeScreenResponseModel.value.data?.category?.racing?.shuffle();
    homeScreenResponseModel.value.data?.category?.multiPlayer?.shuffle();
    homeScreenResponseModel.value.data?.category?.girlsDreesUp?.shuffle();
    homeScreenResponseModel.value.data?.category?.sports?.shuffle();
    homeScreenResponseModel.value.data?.category?.strategy?.shuffle();
    homeScreenResponseModel.value.data?.category?.puzzle?.shuffle();
    homeScreenResponseModel.value.data?.category?.the3DGame?.shuffle();
    homeScreenResponseModel.value.data?.category?.allGames?.shuffle();
    homeScreenResponseModel.value.data?.category?.popular?.shuffle();
    // for (int i = 0;
    //     i < homeScreenResponseModel.value.data!.category!.allGames!.length;
    //     i++) {
    //   homeScreenResponseModel.value.data!.category!.allGames!.insert(
    //       i * 3,
    //       The3DGame(
    //           gameImage: '',
    //           gameLink: '',
    //           gameName: '',
    //           id: '',
    //           isNative: true));
    // }
    isLoading.value = false;
  }

  List<HomePageModel> pageList = <HomePageModel>[
    HomePageModel(
        iconColor: Colors.brown,
        icon: Icons.category_sharp,
        gradientColor: [
          const Color.fromARGB(255, 77, 57, 2),
          const Color.fromARGB(255, 211, 151, 20)
        ],
        onTap: () {
          Get.delete<AdManager>();
          adManager.showInterAd(flag: adResponseModel.adsData?.homeMain);
          Get.toNamed(CategoryPage.route);
        },
        title: StringConstant.categoryPage),
    HomePageModel(
        iconColor: const Color.fromARGB(255, 122, 22, 39),
        gradientColor: [
          const Color.fromARGB(255, 124, 7, 26),
          const Color.fromARGB(255, 239, 68, 134)
        ],
        icon: Icons.hdr_auto_outlined,
        onTap: () {
          Get.delete<AdManager>();
          adManager.showInterAd(flag: adResponseModel.adsData?.homeMain);
          Get.to(Obx(
            () => homeScreenController.isLoading.value
                ? const Loadder()
                : GameListPage(
                    category: homeScreenController
                        .homeScreenResponseModel.value.data?.category?.allGames,
                    title: StringConstant.allGamesPage),
          ));
        },
        title: StringConstant.allGamesPage),
  ];
}

class HomePageModel {
  String? title;
  IconData? icon;
  Color? iconColor;
  Color? backgroundColor;
  List<Color> gradientColor;
  void Function()? onTap;

  HomePageModel(
      {this.iconColor,
      this.icon,
      this.title,
      this.backgroundColor,
      this.onTap,
      required this.gradientColor});
}
