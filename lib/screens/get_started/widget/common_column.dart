import 'package:all_games2/screens/home_screen/home_page.dart';
import 'package:all_games2/utils/config/config.dart';
import 'package:all_games2/utils/constant/string_constants.dart';
import 'package:upgrader/upgrader.dart';

class CommonColumn extends StatelessWidget {
  final Orientation? orientation;
  final Widget widget;

  CommonColumn({Key? key, this.orientation, required this.widget})
      : super(key: key);

  final adManager = Get.put(AdManager());

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
        upgrader: Upgrader(
            dialogStyle: UpgradeDialogStyle.material, showIgnore: false),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                  horizontal: orientation == Orientation.portrait ? 25 : 30),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: const DecorationImage(
                      image: AssetImage("assets/png/get_started.png"),
                      fit: BoxFit.cover)),
              height: orientation == Orientation.portrait ? 300 : 250,
              width: orientation != Orientation.portrait ? 250 : 300,
            ),
            widget,
            Text(
              StringConstant.welcomeTo,
              textAlign: TextAlign.center,
              style: orientation == Orientation.portrait
                  ? size20_M_semibold(textColor: colorBlack)
                  : size14_M_semibold(textColor: colorBlack),
            ),
            widget,
            Text(
              StringConstant.subTitle,
              textAlign: TextAlign.center,
              style: orientation == Orientation.portrait
                  ? size18_M_medium(
                      textColor: const Color.fromARGB(255, 131, 122, 122))
                  : size12_M_bold(
                      textColor: const Color.fromARGB(255, 131, 122, 122)),
            ),
            SizedBox(height: 10.h),
            const Icon(Icons.keyboard_double_arrow_down,
                size: 40, color: Colors.grey),
            widget,
            InkWell(
                overlayColor:
                    const MaterialStatePropertyAll(Colors.transparent),
                onTap: () {
                  adManager.showInterAd(
                      flag: adResponseModel.adsData?.getStarted);
                  Get.toNamed(HomePage.route);
                  Get.delete<AdManager>();
                },
                child: Container(
                  height: 45,
                  margin: EdgeInsets.symmetric(horizontal: 25.0.w),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.r),
                    gradient: const LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Color.fromARGB(255, 199, 20, 118),
                          colorAppTheme
                        ]),
                  ),
                  child: Center(
                    child: Text(
                      StringConstant.getStarted,
                      style: orientation == Orientation.portrait
                          ? size16_M_semibold()
                          : size12_M_bold(),
                    ),
                  ),
                )),
            SizedBox(height: 10.h),
          ],
        ));
  }
}
