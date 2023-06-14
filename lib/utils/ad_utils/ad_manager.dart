import 'dart:convert';
import 'dart:developer';
import 'package:all_games2/service/ad_responce_model/ad_response_model.dart';
import 'package:all_games2/utils/config/config.dart';
import 'package:all_games2/utils/constant/string_constants.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:http/http.dart' as http;

AdsResponseModel adResponseModel = AdsResponseModel();
int addLimit = 0;

class AdManager extends GetxController {
  BannerAd? bannerAd;
  NativeAd? nativeSmallAd;
  NativeAd? nativeMediumAd;
  AppOpenAd? myAppOpenAd;
  InterstitialAd? interstitialAd;
  RewardedInterstitialAd? rewardedInterstitialAd;
  RxBool isSelect = false.obs;
  RxBool isAdLoad = false.obs;
  RxBool isMediumNativeAdLoad = false.obs;
  RxBool isSmallNativeAdLoad = false.obs;
  RxBool isNet = false.obs;
  RxBool isAlertSet = true.obs;
  AdsResponseModel adsResponseModel = AdsResponseModel();

  @override
  void onInit() {
    // TODO: implement onInit
    getAdData();
    loadInterstitial();
    showMediumNativeAd();
    showSmallNativeAd();
    showBannerAd();
    super.onInit();
  }

  Future<AdsResponseModel> getAdData() async {
    try {
      isNet.value = false;
      final response = await http.get(Uri.parse(StringConstant.adsUrl));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        adsResponseModel = AdsResponseModel.fromJson(data);
        addLimit = int.parse(adsResponseModel.adsData?.adsclicklimit ?? '');
        adResponseModel = adsResponseModel;
        return adsResponseModel;
      } else {
        print("Something went wrong");
      }
    } catch (e) {
      isNet.value = true;
      log("errrrrr ${e.toString()}");
    }
    return adsResponseModel;
  }

  void showAppOpen() {
    AppOpenAd.load(
        adUnitId: adResponseModel.adsData?.openAdId ?? '',
        request: const AdRequest(),
        adLoadCallback: AppOpenAdLoadCallback(onAdLoaded: (ad) {
          myAppOpenAd = ad;
          myAppOpenAd?.show();
        }, onAdFailedToLoad: (error) {
          return showAppOpen();
        }),
        orientation: AppOpenAd.orientationPortrait);
  }

  loadInterstitial() {
    InterstitialAd.load(
        adUnitId: "${adResponseModel.adsData?.interAdId}",
        request: const AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (ad) {
            interstitialAd = ad;
            interstitialAd?.fullScreenContentCallback =
                FullScreenContentCallback(
                    onAdFailedToShowFullScreenContent: ((ad, error) {
              ad.dispose();
              interstitialAd?.dispose();
              print(error.message);
            }), onAdDismissedFullScreenContent: (ad) {
              loadInterstitial();
            });
          },
          onAdFailedToLoad: (err) {
            print(err.message);
          },
        ));
  }

  void showSmallNativeAd() {
    nativeSmallAd = NativeAd(
        adUnitId: "${adResponseModel.adsData?.nativeAdId}",
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            isSmallNativeAdLoad.value = true;
          },
          onAdFailedToLoad: (ad, error) {
            isSmallNativeAdLoad.value = false;
            ad.dispose();
          },
        ),
        request: const AdRequest(),
        nativeTemplateStyle: NativeTemplateStyle(
            templateType: TemplateType.small,
            cornerRadius: 10,
            primaryTextStyle: NativeTemplateTextStyle(
                textColor: Colors.black,
                style: NativeTemplateFontStyle.bold,
                size: 16.0)))
      ..load();
  }

  void showMediumNativeAd() {
    nativeMediumAd = NativeAd(
        adUnitId: "${adResponseModel.adsData?.nativeAdId}",
        listener: NativeAdListener(
          onAdLoaded: (ad) {
            isMediumNativeAdLoad.value = true;
          },
          onAdFailedToLoad: (ad, error) {
            isMediumNativeAdLoad.value = false;
            ad.dispose();
          },
        ),
        request: const AdRequest(),
        nativeTemplateStyle: NativeTemplateStyle(
            templateType: TemplateType.medium,
            cornerRadius: 10,
            primaryTextStyle: NativeTemplateTextStyle(
                textColor: Colors.black,
                style: NativeTemplateFontStyle.bold,
                size: 16.0)))
      ..load();
  }

  void showBannerAd() {
    bannerAd = BannerAd(
      adUnitId: adResponseModel.adsData?.bannerAdId ?? '',
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          isAdLoad.value = true;
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
          showBannerAd();
          print("failed to load banner $err");
        },
      ),
    );
    bannerAd?.load();
  }

  void showInterAd({bool? flag}) {
    if (flag ?? true) {
      interstitialAd?.show();
    } else {
      loadInterstitial();
    }
  }
}
//open-	ca-app-pub-3940256099942544/3419835294
//banner-ca-app-pub-3940256099942544/6300978111
//inter-ca-app-pub-3940256099942544/1033173712
//native-ca-app-pub-3940256099942544/2247696110
