import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:all_games2/utils/ad_utils/ad_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatefulWidget {
  static const String route = '/webViewScreen';

  const WebViewScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  String? webUrl = Get.arguments;
  final _key = UniqueKey();
  AdManager adManager = Get.put(AdManager());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        adManager.showAppOpen();
        Get.back();
        return false;
      },
      child: Scaffold(
        body: SafeArea(
            child: WebView(
                key: _key,
                initialUrl: webUrl,
                javascriptMode: JavascriptMode.unrestricted)),
      ),
    );
  }
}
