import 'package:all_games2/screens/home_screen/controller/home_screen_controller.dart';
import 'package:all_games2/screens/home_screen/home_page.dart';
import 'package:all_games2/screens/play_screen/view/play_screen.dart';
import 'package:all_games2/screens/splash_screen/view/splash_screen.dart';
import 'package:all_games2/service/home_screen_service/HomeScreenResponseModel.dart';
import 'package:all_games2/utils/config/config.dart';
import 'package:all_games2/utils/constant/string_constants.dart';
import 'package:all_games2/utils/preferences/preference_manager.dart';
import 'package:all_games2/utils/preferences/preferences_key.dart';
import 'package:all_games2/widgets/banner_ad.dart';
import 'package:all_games2/widgets/lunch_url.dart';
import 'package:all_games2/widgets/native_ad.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:all_games2/screens/no_internet_connection_screen/view/no_internet_screeen.dart';

class GameListPage extends StatefulWidget {
  static const String route = '/gameListPage';

  final String? title;
  final List<The3DGame>? category;
  final The3DGame? items;

  const GameListPage({Key? key, this.category, this.title, this.items})
      : super(key: key);

  @override
  State<GameListPage> createState() => _GameListPageState();
}

class _GameListPageState extends State<GameListPage> {
  final adManager = Get.put(AdManager());
  List<The3DGame> the3DGameList = <The3DGame>[];
  final homeScreenController = Get.put(HomeScreenController());

  @override
  void initState() {
    // TODO: implement initState
    getConnectivity(context);
    Get.delete<AdManager>();
    adManager.showBannerAd();
    adManager.showMediumNativeAd();
    adManager.showSmallNativeAd();
    adManager.loadInterstitial();
    init();
    homeScreenController.homeScreenResponseModel.value.data?.category?.action
        ?.shuffle();
    homeScreenController.homeScreenResponseModel.value.data?.category?.adventure
        ?.shuffle();
    homeScreenController.homeScreenResponseModel.value.data?.category?.racing
        ?.shuffle();
    homeScreenController
        .homeScreenResponseModel.value.data?.category?.multiPlayer
        ?.shuffle();
    homeScreenController
        .homeScreenResponseModel.value.data?.category?.girlsDreesUp
        ?.shuffle();
    homeScreenController.homeScreenResponseModel.value.data?.category?.sports
        ?.shuffle();
    homeScreenController.homeScreenResponseModel.value.data?.category?.strategy
        ?.shuffle();
    homeScreenController.homeScreenResponseModel.value.data?.category?.puzzle
        ?.shuffle();
    homeScreenController.homeScreenResponseModel.value.data?.category?.the3DGame
        ?.shuffle();
    homeScreenController.homeScreenResponseModel.value.data?.category?.allGames
        ?.shuffle();
    homeScreenController.homeScreenResponseModel.value.data?.category?.popular
        ?.shuffle();
    super.initState();
  }

  init() async {
    final String games =
    await AppPreference().getString(PreferencesKey.recentPlayed);

    if (games.isNotEmpty) {
      homeScreenController.recentPlayedList.value = The3DGame.decode(games);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() =>
        WillPopScope(
            onWillPop: () async {
              Get.delete<AdManager>();
              adManager.showInterAd(
                  flag: adResponseModel.adsData?.gameListBack);
              if (widget.title != StringConstant.allGamesPage) {
                Get.back();
              } else {
                Get.toNamed(HomePage.route);
              }
              return false;
            },
            child: homeScreenController.isNet.value
                ? NoInterNetScreen(onPressed: () async {
              Get.toNamed(SplashScreen.route);
            })
                : OrientationBuilder(builder: (context, orientation) {
              return Obx(() =>
                  Scaffold(
                      appBar: AppBar(
                        elevation: 0,
                        backgroundColor: Colors.white,
                        centerTitle: true,
                        leading: InkWell(
                          onTap: () {
                            Get.delete<AdManager>();
                            adManager.showInterAd(
                                flag: adResponseModel.adsData?.gameListBack);
                            if (widget.title != StringConstant.allGamesPage) {
                              Get.back();
                            } else {
                              Get.toNamed(HomePage.route);
                            }
                          },
                          child:
                          const Icon(Icons.arrow_back, color: colorAppTheme),
                        ),
                        title: Text(
                          "${widget.title}",
                          style: const TextStyle(
                              color: colorAppTheme,
                              fontWeight: FontWeight.bold),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                adManager.showInterAd(
                                    flag: adResponseModel.adsData?.rateUs);
                                launchURL(url: StringConstant.appUrl);
                              },
                              child: const Icon(Icons.star,
                                  color: colorAppTheme, size: 25))
                        ],
                      ),
                      bottomNavigationBar: BannerAds(),
                      body: Padding(
                          padding: EdgeInsets.only(
                              bottom: 10.h, right: 10.w, left: 10.w),
                          child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SmallNativeAd(),
                                    SizedBox(height: 10.h),
                                    homeScreenController.recentPlayedList
                                        .isEmpty
                                        ? const SizedBox.shrink()
                                        : Row(
                                      children: [
                                        Text(StringConstant.recentlyPlayed,
                                            style: orientation ==
                                                Orientation.portrait
                                                ? size18_M_semiBold(
                                                textColor:
                                                colorAppTheme)
                                                : size12_M_bold(
                                                textColor:
                                                colorAppTheme)),
                                      ],
                                    ),
                                    homeScreenController.recentPlayedList
                                        .isEmpty
                                        ? const SizedBox.shrink()
                                        : SizedBox(height: 10.h),
                                    homeScreenController.recentPlayedList
                                        .isEmpty
                                        ? const SizedBox.shrink()
                                        : SizedBox(
                                        height: 55,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount: homeScreenController
                                                .recentPlayedList.length,
                                            itemBuilder: (context, index) {
                                              return InkWell(
                                                  overlayColor:
                                                  const MaterialStatePropertyAll(
                                                      Colors.transparent),
                                                  onTap: () {
                                                    Get.delete<AdManager>();
                                                    adManager.showInterAd(
                                                        flag: adResponseModel
                                                            .adsData
                                                            ?.recentPlay);
                                                    Get.to(
                                                        PlayScreen(
                                                            title:
                                                            widget.title,
                                                            category: widget
                                                                .category,
                                                            items: homeScreenController
                                                                .recentPlayedList[
                                                            index]),
                                                        duration:
                                                        const Duration(
                                                            milliseconds:
                                                            600),
                                                        transition: Transition
                                                            .leftToRight);
                                                  },
                                                  child: Container(
                                                    width: 55,
                                                    margin: EdgeInsets.only(
                                                        right: 10.w),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            10.r),
                                                        image: DecorationImage(
                                                            image: CachedNetworkImageProvider(
                                                                homeScreenController
                                                                    .recentPlayedList[
                                                                index]
                                                                    .gameImage ??
                                                                    ""),
                                                            fit: BoxFit
                                                                .cover)),
                                                  ));
                                            })),
                                    homeScreenController.recentPlayedList
                                        .isEmpty
                                        ? const SizedBox.shrink()
                                        : SizedBox(height: 20.h),
                                    GridView.builder(
                                        shrinkWrap: true,
                                        itemCount: widget.category?.length,
                                        physics: const BouncingScrollPhysics(),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: orientation ==
                                                Orientation.portrait
                                                ? 0
                                                : 80.w),
                                        gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 25,
                                            childAspectRatio: orientation ==
                                                Orientation.portrait
                                                ? 1.4 / 2
                                                : 3.5 / 5),
                                        itemBuilder: (context, index) =>
                                            Column(
                                                crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                      overlayColor:
                                                      const MaterialStatePropertyAll(
                                                          Colors.transparent),
                                                      onTap: () {
                                                        Get.delete<AdManager>();
                                                        adManager.showInterAd(
                                                            flag: widget
                                                                .category?[
                                                            index]
                                                                .isAdd ??
                                                                false
                                                                ? false
                                                                : adResponseModel
                                                                .adsData
                                                                ?.gameListMain);
                                                        widget.category?[index]
                                                            .isAdd ??
                                                            false
                                                            ? launchURL(
                                                            url: widget
                                                                .category?[index]
                                                                .gameLink)
                                                            : Get.to(
                                                            PlayScreen(
                                                                title: widget
                                                                    .title,
                                                                category: widget
                                                                    .category,
                                                                items: widget
                                                                    .category?[
                                                                index]),
                                                            duration:
                                                            const Duration(
                                                                milliseconds:
                                                                600),
                                                            transition: Transition
                                                                .leftToRight);
                                                        widget.category
                                                            ?.shuffle();
                                                      },
                                                      child: Stack(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius: BorderRadius
                                                                .circular(
                                                                orientation ==
                                                                    Orientation
                                                                        .portrait
                                                                    ? 12.r
                                                                    : 20.r),
                                                            child: SizedBox(
                                                              height: orientation ==
                                                                  Orientation
                                                                      .portrait
                                                                  ? context
                                                                  .width /
                                                                  2
                                                                  : context
                                                                  .height /
                                                                  1.9,
                                                              width:
                                                              context.width /
                                                                  2,
                                                              child:
                                                              CachedNetworkImage(
                                                                imageUrl: widget
                                                                    .category?[
                                                                index]
                                                                    .gameImage ??
                                                                    "",
                                                                fit: BoxFit
                                                                    .cover,
                                                                width: double
                                                                    .infinity,
                                                                placeholder: (
                                                                    context,
                                                                    url) =>
                                                                    Image.asset(
                                                                        StringConstant
                                                                            .icon,
                                                                        fit: BoxFit
                                                                            .cover),
                                                              ),
                                                            ),
                                                          ),
                                                          widget
                                                              .category?[index]
                                                              .isAdd ??
                                                              false
                                                              ? SizedBox(
                                                            height: orientation ==
                                                                Orientation
                                                                    .portrait
                                                                ? context
                                                                .width /
                                                                2
                                                                : context
                                                                .height /
                                                                1.9,
                                                            child: Column(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                  Alignment
                                                                      .topRight,
                                                                  child: Container(
                                                                      height: 30,
                                                                      width: 30,
                                                                      decoration: BoxDecoration(
                                                                          color: colorWhite,
                                                                          borderRadius: BorderRadius
                                                                              .only(
                                                                              topRight: Radius
                                                                                  .circular(
                                                                                  orientation ==
                                                                                      Orientation
                                                                                          .portrait
                                                                                      ? 12
                                                                                      .r
                                                                                      : 20
                                                                                      .r),
                                                                              bottomLeft: Radius
                                                                                  .circular(
                                                                                  orientation ==
                                                                                      Orientation
                                                                                          .portrait
                                                                                      ? 12
                                                                                      .r
                                                                                      : 20
                                                                                      .r))),
                                                                      child: const Center(
                                                                          child: Text(
                                                                            StringConstant
                                                                                .ad,
                                                                            style:
                                                                            TextStyle(
                                                                                color: colorAppTheme,
                                                                                fontWeight: FontWeight
                                                                                    .bold),
                                                                          ))),
                                                                ),
                                                                const Spacer(),
                                                                Container(
                                                                    height:
                                                                    40,
                                                                    width: MediaQuery
                                                                        .of(
                                                                        context)
                                                                        .size
                                                                        .width,
                                                                    decoration: BoxDecoration(
                                                                        color:
                                                                        colorGreen,
                                                                        borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                            bottomRight: Radius
                                                                                .circular(
                                                                                orientation ==
                                                                                    Orientation
                                                                                        .portrait
                                                                                    ? 12
                                                                                    .r
                                                                                    : 20
                                                                                    .r),
                                                                            bottomLeft: Radius
                                                                                .circular(
                                                                                orientation ==
                                                                                    Orientation
                                                                                        .portrait
                                                                                    ? 12
                                                                                    .r
                                                                                    : 20
                                                                                    .r))),
                                                                    child: Center(
                                                                      child:
                                                                      Text(
                                                                        StringConstant
                                                                            .install,
                                                                        style:
                                                                        size18_M_semiBold(
                                                                            textColor: colorWhite),
                                                                      ),
                                                                    )),
                                                              ],
                                                            ),
                                                          )
                                                              : const SizedBox
                                                              .shrink(),
                                                        ],
                                                      )),
                                                  SizedBox(height: 5.h),
                                                  Text(
                                                    widget.category?[index]
                                                        .gameName ??
                                                        '',
                                                    overflow:
                                                    TextOverflow.ellipsis,
                                                    style: orientation ==
                                                        Orientation.portrait
                                                        ? size14_M_semibold(
                                                        textColor:
                                                        colorAppTheme)
                                                        : size10_M_semibold(
                                                        textColor:
                                                        colorAppTheme),
                                                  ),
                                                ])),
                                    // CustomNativeAd(
                                    //     appUrl: adResponseModel
                                    //         .customAdsData?.gamePage?.appUrl,
                                    //     appName: adResponseModel
                                    //         .customAdsData?.gamePage?.appName,
                                    //     appSubTitle: adResponseModel
                                    //         .customAdsData?.gamePage?.subTitle,
                                    //     imgUrl: adResponseModel
                                    //         .customAdsData?.gamePage?.imgUrl,
                                    //     width: MediaQuery
                                    //         .of(context)
                                    //         .size
                                    //         .width /
                                    //         1.6,
                                    //     height: 8.h),
                                    const MediumNativeAd(),
                                    SizedBox(height: 20.h)
                                  ])))));
            })));
  }
}
