import 'package:all_games2/screens/setting/widget/common_row.dart';
import 'package:all_games2/utils/config/config.dart';
import 'package:all_games2/utils/constant/string_constants.dart';
import 'package:all_games2/widgets/banner_ad.dart';
import 'package:all_games2/widgets/lunch_url.dart';
import 'package:all_games2/widgets/native_ad.dart';
import 'package:share/share.dart';

class SettingScreen extends StatefulWidget {
  static const String route = '/settingScreen';

  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final adManager = Get.put(AdManager());

  @override
  void initState() {
    // TODO: implement initState
    Get.delete<AdManager>();
    adManager.showMediumNativeAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => WillPopScope(
        onWillPop: () async {
          adManager.showInterAd(flag: adResponseModel.adsData?.settingBack);
          Get.back();
          return false;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            title: const Text(StringConstant.setting,
                style: TextStyle(
                    color: colorAppTheme, fontWeight: FontWeight.bold)),
            backgroundColor: colorWhite,
            leading: InkWell(
              onTap: () {
                adManager.showInterAd(
                    flag: adResponseModel.adsData?.settingBack);
                Get.back();
              },
              child: const Icon(Icons.arrow_back, color: colorAppTheme),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.only(left: 20.w, bottom: 20.h, right: 20.w),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                // const MediumNativeAd(),
                CommonRow(
                  orientation: orientation,
                  title: StringConstant.privacyPolicy,
                  icon: Icons.security_rounded,
                  onTap: () => launchURL(url: StringConstant.webUrl),
                ),
                CommonRow(
                  orientation: orientation,
                  title: StringConstant.termsAndCondition,
                  icon: Icons.privacy_tip_sharp,
                  onTap: () => launchURL(url: StringConstant.webUrl),
                ),
                CommonRow(
                    orientation: orientation,
                    title: StringConstant.shareThisApp,
                    icon: Icons.share,
                    onTap: () => Share.share(StringConstant.shareThisAppText)),
                CommonRow(
                    orientation: orientation,
                    title: StringConstant.rateThisApp,
                    icon: Icons.star_rate_rounded,
                    onTap: () => launchURL(url: StringConstant.appUrl)),
                CommonRow(
                    orientation: orientation,
                    title: StringConstant.moreApps,
                    icon: Icons.apps,
                    onTap: () => launchURL(url: StringConstant.moreAppUrl)),
                CommonRow(
                    orientation: orientation,
                    title: StringConstant.currentVersion,
                    isVersion: true,
                    icon: Icons.help),
                SizedBox(height: 20.h),
                orientation == Orientation.portrait
                    ? const MediumNativeAd()
                    : const SmallNativeAd(),
                SizedBox(height: 20.h),
                // CustomNativeAd(
                //     appUrl: adResponseModel.customAdsData?.settingPage?.appUrl,
                //     appName:
                //         adResponseModel.customAdsData?.settingPage?.appName,
                //     appSubTitle:
                //         adResponseModel.customAdsData?.settingPage?.subTitle,
                //     imgUrl: adResponseModel.customAdsData?.settingPage?.imgUrl,
                //     width: MediaQuery.of(context).size.width / 1.6,
                //     height: 8.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
