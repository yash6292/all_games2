import 'package:all_games2/utils/ad_utils/ad_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAds extends StatefulWidget {
  BannerAds({Key? key}) : super(key: key);

  @override
  State<BannerAds> createState() => _BannerAdsState();
}

class _BannerAdsState extends State<BannerAds> {
  final adsCnt = Get.put(AdManager());

  @override
  void initState() {
    adsCnt.showBannerAd();
    Get.delete<AdManager>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => adsCnt.isAdLoad.value == true
          ? Container(
              color: Colors.transparent,
              alignment: Alignment.center,
              // decoration: BoxDecoration(color: Colors.transparent,borderRadius: BorderRadius.circular(5)),
              width: adsCnt.bannerAd?.size.width.toDouble(),
              height: adsCnt.bannerAd?.size.height.toDouble(),
              child: adsCnt.isNet.value
                  ? SizedBox.shrink()
                  : AdWidget(ad: adsCnt.bannerAd!),
            )
          : const SizedBox.shrink(),
    );
  }
}
