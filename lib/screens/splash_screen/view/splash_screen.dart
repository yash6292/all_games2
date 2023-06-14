import 'dart:async';
import 'package:all_games2/screens/get_started/get_started.dart';
import 'package:all_games2/utils/config/config.dart';
import 'package:all_games2/utils/constant/string_constants.dart';
import 'package:all_games2/widgets/loadder.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String route = '/splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AdManager adManager = Get.put(AdManager());

  @override
  void initState() {
    init();
    super.initState();
  }

  Future init() async {
    await adManager.getAdData();
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Get.offAllNamed(GetStarted.route);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) => Scaffold(
        backgroundColor: colorWhite,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Container(
              height: orientation == Orientation.portrait ? 150.0 : 250.h,
              width: orientation == Orientation.portrait ? 150.0 : 250.h,
              decoration: const BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage(StringConstant.icon))),
            ),
            SizedBox(height: 20.h),
            orientation == Orientation.portrait
                ? Text(
                    textAlign: TextAlign.center,
                    "All Games\nPlay In One Game",
                    style: size18_M_medium(textColor: colorAppTheme)
                        .copyWith(fontWeight: FontWeight.w600),
                  )
                : Text(
                    textAlign: TextAlign.center,
                    "All Games Play In One Game",
                    style: size14_M_semibold(textColor: colorAppTheme)
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
            SizedBox(height: 100.h),
            const Spacer(),
            const Loadder(),
            SizedBox(height: 3.h),
            const Text(
              '    Loading ...',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
