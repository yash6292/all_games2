import 'package:all_games2/screens/get_started/get_started.dart';
import 'package:all_games2/screens/home_screen/controller/home_screen_controller.dart';
import 'package:all_games2/screens/home_screen/widget/common_column_home.dart';
import 'package:all_games2/screens/no_internet_connection_screen/view/no_internet_screeen.dart';
import 'package:all_games2/screens/splash_screen/view/splash_screen.dart';
import 'package:all_games2/utils/config/config.dart';
import 'package:all_games2/utils/constant/string_constants.dart';
import 'package:all_games2/widgets/banner_ad.dart';
import 'package:all_games2/widgets/exit_dialog.dart';

class HomePage extends StatefulWidget {
  static const String route = '/homePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final cnt = Get.put(HomeScreenController());
  final adManager = Get.put(AdManager());

  void initState() {
    // TODO: implement initState
    Get.delete<AdManager>();
    adManager.showMediumNativeAd();
    adManager.showSmallNativeAd();
    adManager.showBannerAd();
    adManager.loadInterstitial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => adManager.isNet.value
        ? NoInterNetScreen(onPressed: () async {
            Get.toNamed(SplashScreen.route);
          })
        : OrientationBuilder(
            builder: (context, orientation) => WillPopScope(
                  onWillPop: () async {
                    await showExitPopup(context);
                    return false;
                  },
                  child: Scaffold(
                    appBar: AppBar(
                      backgroundColor: colorWhite,
                      elevation: 0,
                      automaticallyImplyLeading: false,
                      title: const Text(StringConstant.homePage,
                          style: TextStyle(
                              color: colorAppTheme,
                              fontWeight: FontWeight.bold)),
                    ),
                    bottomNavigationBar: BannerAds(),
                    body: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: orientation == Orientation.portrait
                          ? SingleChildScrollView(
                              child: CommonColumnHome(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  widget: const SizedBox.shrink(),
                                  orientation: orientation),
                            )
                          : SingleChildScrollView(
                              child: CommonColumnHome(
                                  widget: SizedBox(height: 10.h),
                                  orientation: orientation)),
                    ),
                  ),
                )));
  }
}
