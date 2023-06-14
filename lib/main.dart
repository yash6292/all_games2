import 'package:all_games2/utils/app_life_cycle.dart';
import 'package:all_games2/utils/constant/pages.dart';
import 'package:all_games2/utils/constant/routs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:all_games2/screens/splash_screen/view/splash_screen.dart';
import 'package:all_games2/utils/preferences/preference_manager.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'utils/constant/colors.dart';
import 'utils/constant/string_constants.dart';

//1865de6d-ee59-4461-a1cd-d0c7c95942a7
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);

  OneSignal.shared.setAppId("1865de6d-ee59-4461-a1cd-d0c7c95942a7");

  OneSignal.shared.promptUserForPushNotificationPermission().then((accepted) {
    print("Accepted permission: $accepted");
  });
  await initFunction();
  runApp(const MyApp());
}

Future initFunction() async {
  await AppPreference().initialAppPreference();
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppLifecycleReactor appLifecycleReactor = AppLifecycleReactor();

  @override
  void initState() {
    appLifecycleReactor.listenToAppStateChanges();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'ALEF REGULAR',
            scaffoldBackgroundColor: colorWhite,
            primarySwatch: Colors.brown),
        navigatorKey: navigatorKey,
        title: StringConstant.appName,
        initialRoute: SplashScreen.route,
        routes: routes,
        getPages: getPages,
      ),
    );
  }
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
