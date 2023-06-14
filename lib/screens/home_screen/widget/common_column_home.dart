import 'package:all_games2/screens/home_screen/controller/home_screen_controller.dart';
import 'package:all_games2/utils/config/config.dart';
import 'package:all_games2/widgets/custom_native_ad.dart';
import 'package:all_games2/widgets/native_ad.dart';

class CommonColumnHome extends StatelessWidget {
  final Orientation? orientation;
  final Widget widget;
  final MainAxisAlignment? mainAxisAlignment;

  CommonColumnHome(
      {Key? key,
      this.orientation,
      this.mainAxisAlignment,
      required this.widget})
      : super(key: key);

  final cnt = Get.put(HomeScreenController());
  final adManager = Get.put(AdManager());

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        orientation == Orientation.portrait
            ? const MediumNativeAd()
            : const SmallNativeAd(),
        SizedBox(height: 10.h),
        ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          primary: false,
          itemCount: cnt.pageList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: orientation == Orientation.portrait ? 20.h : 40.h),
              child: InkWell(
                borderRadius: BorderRadius.circular(20.r),
                onTap: cnt.pageList[index].onTap,
                child: Container(
                  height: orientation == Orientation.portrait ? 75.h : 120.h,
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.r),
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: cnt.pageList[index].gradientColor)),
                  child: Row(
                    children: [
                      SizedBox(width: 20.w),
                      Icon(cnt.pageList[index].icon,
                          color: cnt.pageList[index].iconColor,
                          size: orientation == Orientation.portrait ? 39 : 35),
                      SizedBox(width: 20.w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${cnt.pageList[index].title}",
                            style: orientation == Orientation.portrait
                                ? size16_M_bold(
                                    textColor: colorBlack.withOpacity(0.8))
                                : size10_M_semibold(
                                    textColor: colorBlack.withOpacity(0.8)),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        widget,
        //  Spacer(),
        // CustomNativeAd(
        //     appUrl: adResponseModel.customAdsData?.homePage?.appUrl,
        //     appName: adResponseModel.customAdsData?.homePage?.appName,
        //     appSubTitle: adResponseModel.customAdsData?.homePage?.subTitle,
        //     imgUrl: adResponseModel.customAdsData?.homePage?.imgUrl),
        SizedBox(height: 25.h),
      ],
    );
  }
}
