import 'package:all_games2/screens/game_list_screen/game_list_page.dart';
import 'package:all_games2/screens/home_screen/controller/home_screen_controller.dart';
import 'package:all_games2/service/home_screen_service/HomeScreenResponseModel.dart';
import 'package:all_games2/utils/config/config.dart';
import 'package:all_games2/utils/constant/string_constants.dart';
import 'package:all_games2/utils/preferences/preference_manager.dart';
import 'package:all_games2/utils/preferences/preferences_key.dart';
import 'package:all_games2/widgets/banner_ad.dart';
import 'package:all_games2/widgets/native_ad.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:share_plus/share_plus.dart';
import 'package:all_games2/screens/web_view_screen/view/web_view_screen.dart';

List<The3DGame> the3DGameList = <The3DGame>[];

final homeScreenController = Get.put(HomeScreenController());

class PlayScreen extends StatefulWidget {
  static const String route = '/playScreen';

  const PlayScreen({Key? key, this.category, this.items, this.title})
      : super(key: key);

  final List<The3DGame>? category;
  final The3DGame? items;
  final String? title;

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  bool isSelected = false;
  int index = 0;
  AdManager adManager = Get.put(AdManager());

  @override
  void initState() {
    // TODO: implement initState
    Get.delete<AdManager>();
    adManager.showMediumNativeAd();
    adManager.showBannerAd();
    adManager.loadInterstitial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      adManager.showInterAd(flag: adResponseModel.adsData?.playBack);
      Get.delete<AdManager>();
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context) => GameListPage(
                  category: widget.category,
                  items: widget.items,
                  title: widget.title)),
          ModalRoute.withName("/categoryPage"));
      return false;
    }, child: OrientationBuilder(builder: (context, orientation) {
      return Scaffold(
        backgroundColor: colorWhite,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            StringConstant.gameDetails,
            style: TextStyle(color: colorAppTheme, fontWeight: FontWeight.bold),
          ),
          backgroundColor: colorWhite,
          leading: InkWell(
            onTap: () {
              adManager.showInterAd(flag: adResponseModel.adsData?.playBack);
              Get.delete<AdManager>();
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GameListPage(
                          category: widget.category,
                          items: widget.items,
                          title: widget.title)),
                  ModalRoute.withName("/categoryPage"));
            },
            child: const Icon(Icons.arrow_back, color: colorAppTheme),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  adManager.showInterAd(
                      flag: adResponseModel.adsData?.shareApp);
                  Share.share(StringConstant.shareThisAppText);
                },
                child: const Icon(Icons.share, color: colorAppTheme, size: 25))
          ],
        ),
        bottomNavigationBar: BannerAds(),
        body: Padding(
          padding: EdgeInsets.only(bottom: 20.h, left: 15.w, right: 15.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: orientation == Orientation.portrait
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: orientation == Orientation.portrait
                      ? context.height / 2.3
                      : 250,
                  width: orientation == Orientation.portrait
                      ? double.infinity
                      : 250,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: CachedNetworkImage(
                          filterQuality: FilterQuality.high,
                          imageUrl: widget.items?.gameImage ?? '',
                          fit: BoxFit.cover)),
                ),
                SizedBox(height: 15.h),
                Text(widget.items?.gameName ?? '',
                    style: size20_M_semibold(textColor: colorBlack)
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 22)),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: orientation == Orientation.portrait
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/png/game.png', height: 25),
                    SizedBox(width: 10.w),
                    Text(widget.items?.players ?? '',
                        style: orientation == Orientation.portrait
                            ? size16_M_semibold(
                                textColor:
                                    const Color.fromARGB(255, 128, 110, 110))
                            : size10_M_semibold(
                                textColor:
                                    const Color.fromARGB(255, 128, 110, 110))),
                  ],
                ),
                SizedBox(height: 10.h),
                const MediumNativeAd(),
                SizedBox(height: 20.h),
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () async {
                    Get.delete<AdManager>();
                    adManager.showInterAd(
                        flag: adResponseModel.adsData?.playMain);
                    Get.toNamed(WebViewScreen.route,
                        arguments: widget.items?.gameLink ?? '');
                    recentPlayed(items: widget.items);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: orientation == Orientation.portrait
                        ? double.infinity
                        : 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: colorAppTheme,
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color.fromARGB(255, 226, 24, 149),
                            colorAppTheme,
                          ]),
                    ),
                    child: Text(StringConstant.playGame,
                        style: orientation == Orientation.portrait
                            ? size18_M_semiBold(textColor: colorWhite)
                            : size12_M_bold(textColor: colorWhite)),
                  ),
                ),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    Text(StringConstant.similarGames,
                        style: orientation == Orientation.portrait
                            ? size18_M_semiBold(textColor: colorAppTheme)
                            : size12_M_bold(textColor: colorAppTheme)),
                  ],
                ),
                SizedBox(height: 10.h),
                SizedBox(
                    height: 55,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: widget.category?.length,
                        itemBuilder: (context, index) {
                          return widget.items?.gameImage ==
                                      widget.category?[index].gameImage ||
                                  widget.category?[index].isAdd == true
                              ? const SizedBox.shrink()
                              : InkWell(
                                  overlayColor: const MaterialStatePropertyAll(
                                      Colors.transparent),
                                  onTap: () {
                                    Get.delete<AdManager>();
                                    adManager.showInterAd(
                                        flag: adResponseModel
                                            .adsData?.playSimilar);
                                    Get.to(
                                        PlayScreen2(
                                            title: widget.title,
                                            category: widget.category,
                                            items: widget.category?[index]),
                                        duration:
                                            const Duration(milliseconds: 600),
                                        transition: Transition.leftToRight);
                                  },
                                  child: Container(
                                    width: 55,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                widget.category?[index]
                                                        .gameImage ??
                                                    ""),
                                            fit: BoxFit.cover)),
                                  ));
                        }))
              ],
            ),
          ),
        ),
      );
    }));
  }
}

class PlayScreen2 extends StatefulWidget {
  static const String route = '/playScreen2';

  const PlayScreen2({Key? key, this.category, this.items, this.title})
      : super(key: key);

  final String? title;
  final List<The3DGame>? category;
  final The3DGame? items;

  @override
  State<PlayScreen2> createState() => _PlayScreen2State();
}

class _PlayScreen2State extends State<PlayScreen2> {
  bool isSelected = false;

  AdManager adManager = Get.put(AdManager());

  @override
  void initState() {
    // TODO: implement initState
    Get.delete<AdManager>();
    adManager.showMediumNativeAd();
    adManager.showBannerAd();
    adManager.loadInterstitial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () async {
      adManager.showInterAd(flag: adResponseModel.adsData?.play2Back);
      Get.delete<AdManager>();
      Get.back();
      return false;
    }, child: OrientationBuilder(builder: (context, orientation) {
      return Scaffold(
        backgroundColor: colorWhite,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: const Text(
            StringConstant.gameDetails,
            style: TextStyle(color: colorAppTheme, fontWeight: FontWeight.bold),
          ),
          backgroundColor: colorWhite,
          leading: InkWell(
            onTap: () {
              adManager.showInterAd(flag: adResponseModel.adsData?.play2Back);
              Get.delete<AdManager>();
              Get.back();
            },
            child: const Icon(Icons.arrow_back, color: colorAppTheme),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  adManager.showInterAd(
                      flag: adResponseModel.adsData?.shareApp);
                  Share.share(StringConstant.shareThisAppText);
                },
                child: const Icon(Icons.share, color: colorAppTheme, size: 25))
          ],
        ),
        bottomNavigationBar: BannerAds(),
        body: Padding(
          padding: EdgeInsets.only(bottom: 20.h, left: 15.w, right: 15.w),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: orientation == Orientation.portrait
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: orientation == Orientation.portrait
                      ? context.height / 2.3
                      : 250,
                  width: orientation == Orientation.portrait
                      ? double.infinity
                      : 250,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: CachedNetworkImage(
                          filterQuality: FilterQuality.high,
                          imageUrl: widget.items?.gameImage ?? '',
                          fit: BoxFit.cover)),
                ),
                SizedBox(height: 15.h),
                Text(widget.items?.gameName ?? '',
                    style: size20_M_semibold(textColor: colorBlack)
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 22)),
                SizedBox(height: 5.h),
                Row(
                  mainAxisAlignment: orientation == Orientation.portrait
                      ? MainAxisAlignment.start
                      : MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/png/game.png', height: 25),
                    SizedBox(width: 10.w),
                    Text(widget.items?.players ?? '',
                        style: orientation == Orientation.portrait
                            ? size16_M_semibold(
                                textColor:
                                    const Color.fromARGB(255, 128, 110, 110))
                            : size10_M_semibold(
                                textColor:
                                    const Color.fromARGB(255, 128, 110, 110))),
                  ],
                ),
                SizedBox(height: 10.h),
                const MediumNativeAd(),
                SizedBox(height: 20.h),
                InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () async {
                    Get.delete<AdManager>();
                    adManager.showInterAd(
                        flag: adResponseModel.adsData?.play2Main);
                    Get.toNamed(WebViewScreen.route,
                        arguments: widget.items?.gameLink ?? '');
                    recentPlayed(items: widget.items);
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 60,
                    width: orientation == Orientation.portrait
                        ? double.infinity
                        : 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: colorAppTheme,
                      gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Color.fromARGB(255, 226, 24, 149),
                            colorAppTheme,
                          ]),
                    ),
                    child: Text(StringConstant.playGame,
                        style: orientation == Orientation.portrait
                            ? size18_M_semiBold(textColor: colorWhite)
                            : size12_M_bold(textColor: colorWhite)),
                  ),
                ),
                SizedBox(height: 15.h),
                Row(
                  children: [
                    Text(StringConstant.similarGames,
                        style: orientation == Orientation.portrait
                            ? size18_M_semiBold(textColor: colorAppTheme)
                            : size12_M_bold(textColor: colorAppTheme)),
                  ],
                ),
                SizedBox(height: 10.h),
                SizedBox(
                    height: 55,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: widget.category?.length,
                        itemBuilder: (context, index) {
                          return widget.items?.gameImage ==
                                      widget.category?[index].gameImage ||
                                  widget.category?[index].isAdd == true
                              ? const SizedBox.shrink()
                              : InkWell(
                                  overlayColor: const MaterialStatePropertyAll(
                                      Colors.transparent),
                                  onTap: () {
                                    Get.delete<AdManager>();
                                    adManager.showInterAd(
                                        flag: adResponseModel
                                            .adsData?.play2Similar);
                                    // widget.category?.shuffle();
                                    Get.to(
                                        PlayScreen(
                                            title: widget.title,
                                            category: widget.category,
                                            items: widget.category?[index]),
                                        duration:
                                            const Duration(milliseconds: 600),
                                        transition: Transition.leftToRight);
                                    // widget.category?.shuffle();
                                  },
                                  child: Container(
                                    width: 55,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        image: DecorationImage(
                                            image: CachedNetworkImageProvider(
                                                widget.category?[index]
                                                        .gameImage ??
                                                    ""),
                                            fit: BoxFit.cover)),
                                  ));
                        }))
              ],
            ),
          ),
        ),
      );
    }));
  }
}

recentPlayed({final The3DGame? items}) async {
  try {
    if (homeScreenController.recentPlayedList.isEmpty) {
      try {
        the3DGameList
            .removeWhere((element) => element.gameName == items?.gameName);
        the3DGameList.add(The3DGame(
            id: items?.id,
            gameName: items?.gameName,
            gameImage: items?.gameImage,
            gameLink: items?.gameLink,
            players: items?.players));
        final String encodedData = The3DGame.encode(the3DGameList);
        await AppPreference()
            .setString(PreferencesKey.recentPlayed, encodedData);
        // log('encodedData ${encodedData}');
      } catch (e) {
        print("err${e.toString()}");
      }
    } else {
      final String games =
          await AppPreference().getString(PreferencesKey.recentPlayed);

      if (games.isNotEmpty) {
        the3DGameList = The3DGame.decode(games);
      }
      the3DGameList
          .removeWhere((element) => element.gameName == items?.gameName);
      the3DGameList.add(The3DGame(
          id: items?.id,
          gameName: items?.gameName,
          gameImage: items?.gameImage,
          gameLink: items?.gameLink,
          players: items?.players));

      // log("${the3DGameList.length}", name: "list of data");
    }
    final String encodedData = The3DGame.encode(the3DGameList);
    await AppPreference().setString(PreferencesKey.recentPlayed, encodedData);
  } catch (e) {
    print("errr${e.toString()}");
  }
}
