import 'dart:async';

import 'package:all_games2/utils/config/config.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:lottie/lottie.dart';

class NoInterNetScreen extends StatelessWidget {
  static const String route = '/noInterNetScreen';

  final Function()? onPressed;
  const NoInterNetScreen({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      right: orientation == Orientation.portrait
                          ? MediaQuery.of(context).size.width / 3.5
                          : MediaQuery.of(context).size.width / 5.5),
                  child: Lottie.asset('assets/no_internet.json',
                      height: 250, width: 250, fit: BoxFit.cover),
                ),
                Text(
                  "NO INTERNET",
                  textAlign: TextAlign.center,
                  style: orientation == Orientation.portrait
                      ? size20_M_semibold(textColor: colorAppTheme)
                          .copyWith(fontWeight: FontWeight.bold)
                      : size14_M_semibold(textColor: colorAppTheme)
                          .copyWith(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text(
                  "You must be connected to the internet to complete this action",
                  textAlign: TextAlign.center,
                  style: orientation == Orientation.portrait
                      ? size18_M_medium(textColor: colorAppTheme)
                      : size12_M_bold(textColor: colorAppTheme)
                          .copyWith(fontWeight: FontWeight.w300),
                ),
                SizedBox(height: 50),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: colorBlack,
                        fixedSize: orientation == Orientation.portrait
                            ? Size(80, 0)
                            : Size(100, 30)),
                    onPressed: onPressed,
                    child: Text(
                      "Retry",
                      textAlign: TextAlign.center,
                    ))
              ],
            ),
          ),
        ),
      );
    });
  }
}
StreamSubscription? subscription;
bool isDeviceConnected = false;
bool isAlertSet = false;
final AdManager adManager = Get.put(AdManager());

getConnectivity(BuildContext context) =>
    subscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
        if (!isDeviceConnected && isAlertSet == false) {
          showDialogBox(context);
          adManager.isAlertSet.value = true;
        }
      },
    );

showDialogBox(BuildContext context) => showDialog(
    context: context,
    builder: (BuildContext context) => NoInterNetScreen(onPressed: () async {
          Navigator.pop(context, 'Cancel');
          adManager.isAlertSet.value = false;
          isDeviceConnected = await InternetConnectionChecker().hasConnection;
          if (!isDeviceConnected && isAlertSet == false) {
            showDialogBox(context);
            adManager.isAlertSet.value = true;
          }
        }));
