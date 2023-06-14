import 'package:all_games2/screens/get_started/widget/common_column.dart';
import 'package:all_games2/utils/config/config.dart';
import 'package:all_games2/utils/constant/string_constants.dart';
import 'package:all_games2/widgets/banner_ad.dart';
import 'package:all_games2/widgets/exit_dialog.dart';

class GetStarted extends StatefulWidget {
  static const String route = '/get_started';

  const GetStarted({Key? key}) : super(key: key);

  @override
  _GetStartedState createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  AdManager adManager = Get.put(AdManager());

  @override
  void initState() {
    adManager.showAppOpen();
    adManager.showBannerAd();
    adManager.loadInterstitial();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => Scaffold(
          appBar: AppBar(
            backgroundColor: colorWhite,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Text(StringConstant.appName,
                style: orientation == Orientation.portrait
                    ? const TextStyle(
                        color: colorAppTheme, fontWeight: FontWeight.bold)
                    : size14_M_semibold(textColor: colorBlack)),
          ),
          bottomNavigationBar: BannerAds(),
          body: orientation == Orientation.portrait
              ? CommonColumn(orientation: orientation, widget: const Spacer())
              : SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: CommonColumn(
                      orientation: orientation,
                      widget: SizedBox(height: 20.h)))),
    );
  }
}
