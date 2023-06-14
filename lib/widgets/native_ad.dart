import 'package:all_games2/utils/ad_utils/ad_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class MediumNativeAd extends StatefulWidget {
  final bool? isSmallNative;

  const MediumNativeAd({Key? key, this.isSmallNative}) : super(key: key);

  @override
  State<MediumNativeAd> createState() => _MediumNativeAdState();
}

class _MediumNativeAdState extends State<MediumNativeAd> {
  final adsCnt = Get.put(AdManager());

  @override
  void initState() {
    // TODO: implement initState
    Get.delete<AdManager>();
    adsCnt.showMediumNativeAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => adsCnt.isMediumNativeAdLoad.value
        ? ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: Colors.black)),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 320, // minimum recommended width
                  minHeight: 320, // minimum recommended height
                  maxWidth: 400,
                  maxHeight: 350,
                ),
                child: AdWidget(
                  ad: adsCnt.nativeMediumAd!,
                ),
              ),
            ))
        : const SizedBox.shrink());
  }
}

class SmallNativeAd extends StatefulWidget {
  const SmallNativeAd({super.key});

  @override
  State<SmallNativeAd> createState() => _SmallNativeAdState();
}

class _SmallNativeAdState extends State<SmallNativeAd> {
  final adsCnt = Get.put(AdManager());

  @override
  void initState() {
    // TODO: implement initState
    Get.delete<AdManager>();
    adsCnt.showSmallNativeAd();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => adsCnt.isSmallNativeAdLoad.value
        ? ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: Colors.black)),
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minWidth: 320, // minimum recommended width
                  minHeight: 90, // minimum recommended height
                  maxWidth: 400,
                  maxHeight: 100,
                ),
                child: AdWidget(
                  ad: adsCnt.nativeSmallAd!,
                ),
              ),
            ))
        : const SizedBox.shrink());
  }
}
