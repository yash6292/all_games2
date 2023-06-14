import 'dart:async';
import 'package:all_games2/screens/category_page/category_cnt.dart';
import 'package:all_games2/screens/game_list_screen/game_list_page.dart';
import 'package:all_games2/screens/home_screen/controller/home_screen_controller.dart';
import 'package:all_games2/screens/no_internet_connection_screen/view/no_internet_screeen.dart';
import 'package:all_games2/screens/setting/setting.dart';
import 'package:all_games2/screens/splash_screen/view/splash_screen.dart';
import 'package:all_games2/utils/config/config.dart';
import 'package:all_games2/utils/constant/string_constants.dart';
import 'package:all_games2/widgets/banner_ad.dart';
import 'package:all_games2/widgets/loadder.dart';
import 'package:all_games2/widgets/native_ad.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CategoryPage extends StatefulWidget {
  static const String route = '/categoryPage';

  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  StreamSubscription? subscription;
  bool isDeviceConnected = false;
  bool isAlertSet = false;
  NativeAd? nativeAd;
  final categoryCnt = Get.put(CategoryCnt());
  final adManager = Get.put(AdManager());
  var homeScreenController = Get.put(HomeScreenController());

  @override
  void initState() {
    getConnectivity(context);
    Get.delete<AdManager>();
    adManager.showBannerAd();
    adManager.showMediumNativeAd();
    adManager.showSmallNativeAd();
    adManager.loadInterstitial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => WillPopScope(
        onWillPop: () async {
          adManager.showInterAd(flag: adResponseModel.adsData?.categoryBack);
          Get.back();
          return false;
        },
        child: homeScreenController.isNet.value
            ? NoInterNetScreen(onPressed: () async {
                Get.toNamed(SplashScreen.route);
              })
            : OrientationBuilder(builder: (context, orientation) {
                return Scaffold(
                  appBar: AppBar(
                    elevation: 0,
                    backgroundColor: colorWhite,
                    centerTitle: true,
                    leading: InkWell(
                      onTap: () {
                        adManager.showInterAd(
                            flag: adResponseModel.adsData?.categoryBack);
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back, color: colorAppTheme),
                    ),
                    title: const Text(StringConstant.allNewGames,
                        style: TextStyle(
                            color: colorAppTheme, fontWeight: FontWeight.bold)),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Get.delete<AdManager>();
                            adManager.showInterAd(
                                flag: adResponseModel.adsData?.settingIcon);

                            Get.to(const SettingScreen(),
                                transition: Transition.downToUp,
                                duration: const Duration(milliseconds: 600));
                          },
                          child: const Icon(Icons.settings,
                              color: colorAppTheme, size: 25))
                    ],
                  ),
                  bottomNavigationBar: BannerAds(),
                  body: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: orientation == Orientation.portrait
                                  ? 10
                                  : 15),
                          child: orientation == Orientation.portrait
                              ? const MediumNativeAd()
                              : const SmallNativeAd(),
                        ),
                        SizedBox(height: 15.h),
                        GridView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.symmetric(
                                horizontal: orientation == Orientation.portrait
                                    ? 0
                                    : 80.w),
                            itemCount: categoryCnt.categoryList.length,
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 15, crossAxisCount: 2),
                            itemBuilder: (context, index) => Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          orientation == Orientation.portrait
                                              ? 10
                                              : 15),
                                  child: InkWell(
                                    borderRadius: BorderRadius.circular(20),
                                    splashColor: colorAppTheme.withOpacity(0.5),
                                    onTap: () {
                                      Get.delete<AdManager>();
                                      adManager.showInterAd(
                                          flag: adResponseModel
                                              .adsData?.categoryMain);
                                      Get.to(
                                          () => Obx(
                                                () => homeScreenController
                                                        .isLoading.value
                                                    ? const Loadder()
                                                    : GameListPage(
                                                        title: index == 0
                                                            ? StringConstant
                                                                .mostPopularGames
                                                            : index == 1
                                                                ? StringConstant
                                                                    .actionGames
                                                                : index == 2
                                                                    ? StringConstant
                                                                        .adventureGames
                                                                    : index == 3
                                                                        ? StringConstant
                                                                            .puzzleGames
                                                                        : index ==
                                                                                4
                                                                            ? StringConstant
                                                                                .racingGames
                                                                            : index ==
                                                                                    5
                                                                                ? StringConstant
                                                                                    .d3Games
                                                                                : index ==
                                                                                        6
                                                                                    ? StringConstant
                                                                                        .sportsGames
                                                                                    : index ==
                                                                                            7
                                                                                        ? StringConstant
                                                                                            .multiPlayerGames
                                                                                        : index ==
                                                                                                8
                                                                                            ? StringConstant
                                                                                                .girlsDressUpGames
                                                                                            : index ==
                                                                                                    9
                                                                                                ? StringConstant
                                                                                                    .strategyGames
                                                                                                : "",
                                                        category: index == 0
                                                            ? homeScreenController
                                                                .homeScreenResponseModel
                                                                .value
                                                                .data
                                                                ?.category
                                                                ?.popular
                                                            : index == 1
                                                                ? homeScreenController
                                                                    .homeScreenResponseModel
                                                                    .value
                                                                    .data
                                                                    ?.category
                                                                    ?.action
                                                                : index == 2
                                                                    ? homeScreenController
                                                                        .homeScreenResponseModel
                                                                        .value
                                                                        .data
                                                                        ?.category
                                                                        ?.adventure
                                                                    : index == 3
                                                                        ? homeScreenController
                                                                            .homeScreenResponseModel
                                                                            .value
                                                                            .data
                                                                            ?.category
                                                                            ?.puzzle
                                                                        : index ==
                                                                                4
                                                                            ? homeScreenController.homeScreenResponseModel.value.data?.category?.racing
                                                                            : index == 5
                                                                                ? homeScreenController.homeScreenResponseModel.value.data?.category?.the3DGame
                                                                                : index == 6
                                                                                    ? homeScreenController.homeScreenResponseModel.value.data?.category?.sports
                                                                                    : index == 7
                                                                                        ? homeScreenController.homeScreenResponseModel.value.data?.category?.multiPlayer
                                                                                        : index == 8
                                                                                            ? homeScreenController.homeScreenResponseModel.value.data?.category?.girlsDreesUp
                                                                                            : index == 9
                                                                                                ? homeScreenController.homeScreenResponseModel.value.data?.category?.strategy
                                                                                                : []),
                                              ),
                                          duration:
                                              const Duration(milliseconds: 600),
                                          transition: Transition.leftToRight);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.only(
                                        left:
                                            orientation == Orientation.portrait
                                                ? 10.w
                                                : 6.w,
                                        right:
                                            orientation == Orientation.portrait
                                                ? 10.w
                                                : 6.w,
                                        top: orientation == Orientation.portrait
                                            ? 10.h
                                            : 20.h,
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey.shade300),
                                          borderRadius: BorderRadius.circular(
                                              orientation ==
                                                      Orientation.portrait
                                                  ? 20.r
                                                  : 28.r)),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      orientation ==
                                                              Orientation
                                                                  .portrait
                                                          ? 15.r
                                                          : 22.r),
                                              child: Stack(
                                                children: [
                                                  SizedBox(
                                                    height: orientation ==
                                                            Orientation.portrait
                                                        ? context.height / 5.6
                                                        : context.height / 2.3,
                                                    width: context.width / 2,
                                                    child: CachedNetworkImage(
                                                      imageUrl: categoryCnt
                                                              .categoryList[
                                                                  index]
                                                              .image ??
                                                          "",
                                                      fit: BoxFit.cover,
                                                      width: double.infinity,
                                                      placeholder: (context,
                                                              url) =>
                                                          Image.asset(
                                                              StringConstant
                                                                  .icon),
                                                    ),
                                                  ),
                                                ],
                                              )),
                                          SizedBox(height: 5.h),
                                          Text(
                                            categoryCnt
                                                .categoryList[index].title
                                                .toString(),
                                            overflow: TextOverflow.ellipsis,
                                            style: orientation ==
                                                    Orientation.portrait
                                                ? size14_M_semibold(
                                                    textColor: colorAppTheme)
                                                : size10_M_semibold(
                                                    textColor: colorAppTheme),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                        SizedBox(height: 15.h),
                        Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: orientation == Orientation.portrait
                                    ? 10
                                    : 15),
                            child: orientation == Orientation.portrait
                                ? const MediumNativeAd()
                                : const SmallNativeAd()),
                        SizedBox(height: 20.h),
                        // Padding(
                        //     padding: EdgeInsets.symmetric(
                        //         horizontal: orientation == Orientation.portrait
                        //             ? 10
                        //             : 15),
                        //     child: CustomNativeAd(
                        //         appUrl: adResponseModel
                        //             .customAdsData?.catPage?.appUrl,
                        //         appName: adResponseModel
                        //             .customAdsData?.catPage?.appName,
                        //         appSubTitle: adResponseModel
                        //             .customAdsData?.catPage?.subTitle,
                        //         imgUrl: adResponseModel
                        //             .customAdsData?.catPage?.imgUrl,
                        //         width: MediaQuery.of(context).size.width / 1.6,
                        //         height: 8.h)),
                        // SizedBox(height: 20.h)
                      ],
                    ),
                  ),
                );
              }),
      ),
    );
  }
}
