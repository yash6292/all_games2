class AdsResponseModel {
  String? status;
  AdsData? adsData;
  CustomAdsData? customAdsData;

  AdsResponseModel({this.status, this.adsData, this.customAdsData});

  AdsResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    adsData = json['data'] != null ? AdsData.fromJson(json['data']) : null;
    customAdsData = json['ads_data'] != null
        ? CustomAdsData.fromJson(json['ads_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> adsData = <String, dynamic>{};
    adsData['status'] = status;
    if (this.adsData != null) {
      adsData['adsData'] = this.adsData!.toJson();
    }
    if (customAdsData != null) {
      adsData['ads_data'] = customAdsData!.toJson();
    }
    return adsData;
  }
}

class AdsData {
  String? adsclicklimit;
  String? gameTitle;
  String? gameUrl;
  String? gameVersion;
  String? openAdId;
  String? interAdId;
  String? nativeAdId;
  String? bannerAdId;
  bool? getStarted;
  bool? homeMain;
  bool? homeBack;
  bool? categoryBack;
  bool? settingIcon;
  bool? categoryMain;
  bool? play2Back;
  bool? rateUs;
  bool? gameListMain;
  bool? gameListBack;
  bool? recentPlay;
  bool? playBack;
  bool? shareApp;
  bool? playMain;
  bool? play2Main;
  bool? playSimilar;
  bool? play2Similar;
  bool? settingBack;

  AdsData(
      {this.adsclicklimit,
      this.gameTitle,
      this.gameUrl,
      this.gameVersion,
      this.openAdId,
      this.interAdId,
      this.nativeAdId,
      this.bannerAdId,
      this.getStarted,
      this.homeMain,
      this.homeBack,
      this.categoryBack,
      this.settingIcon,
      this.categoryMain,
      this.play2Back,
      this.rateUs,
      this.gameListMain,
      this.gameListBack,
      this.recentPlay,
      this.playBack,
      this.shareApp,
      this.play2Main,
      this.play2Similar,
      this.settingBack});

  AdsData.fromJson(Map<String, dynamic> json) {
    adsclicklimit = json['adsclicklimit'];
    gameTitle = json['game_title'];
    gameUrl = json['game_url'];
    gameVersion = json['game_version'];
    openAdId = json['open_ad_id'];
    interAdId = json['inter_ad_id'];
    nativeAdId = json['native_ad_id'];
    bannerAdId = json['banner_ad_id'];
    getStarted = json['getStarted'];
    homeMain = json['homeMain'];
    homeBack = json['homeBack'];
    categoryMain = json['categoryMain'];
    categoryBack = json['categoryBack'];
    settingIcon = json['settingIcon'];
    settingBack = json['settingBack'];
    rateUs = json['rateUs'];
    gameListMain = json['gameListMain'];
    gameListBack = json['gameListBack'];
    recentPlay = json['recentPlay'];
    shareApp = json['shareApp'];
    playMain = json['playMain'];
    playBack = json['playBack'];
    playSimilar = json['playSimilar'];
    play2Main = json['play2Main'];
    play2Back = json['play2Back'];
    play2Similar = json['play2Similar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> adsData = <String, dynamic>{};
    adsData['adsclicklimit'] = adsclicklimit;
    adsData['game_title'] = gameTitle;
    adsData['game_url'] = gameUrl;
    adsData['game_version'] = gameVersion;
    adsData['open_ad_id'] = openAdId;
    adsData['inter_ad_id'] = interAdId;
    adsData['native_ad_id'] = nativeAdId;
    adsData['banner_ad_id'] = bannerAdId;
    adsData['getStarted'] = getStarted;
    adsData['homeMain'] = homeMain;
    adsData['homeBack'] = homeBack;
    adsData['categoryMain'] = categoryMain;
    adsData['categoryBack'] = categoryBack;
    adsData['settingIcon'] = settingIcon;
    adsData['settingBack'] = settingBack;
    adsData['play2Back'] = play2Back;
    adsData['rateUs'] = rateUs;
    adsData['gameListMain'] = gameListMain;
    adsData['gameListBack'] = gameListBack;
    adsData['recentPlay'] = recentPlay;
    adsData['playBack'] = playBack;
    adsData['shareApp'] = shareApp;
    adsData['playMain'] = playMain;
    adsData['play2Main'] = play2Main;
    adsData['playSimilar'] = playSimilar;
    adsData['play2Similar'] = play2Similar;
    return adsData;
  }
}

class CustomAdsData {
  CommonDetails? homePage;
  CommonDetails? catPage;
  CommonDetails? gamePage;
  CommonDetails? settingPage;

  CustomAdsData({this.homePage, this.catPage, this.gamePage, this.settingPage});

  CustomAdsData.fromJson(Map<String, dynamic> json) {
    homePage = json['home_page'] != null
        ? CommonDetails.fromJson(json['home_page'])
        : null;
    catPage = json['cat_page'] != null
        ? CommonDetails.fromJson(json['cat_page'])
        : null;
    gamePage = json['game_page'] != null
        ? CommonDetails.fromJson(json['game_page'])
        : null;
    settingPage = json['setting_page'] != null
        ? CommonDetails.fromJson(json['setting_page'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> adsData = <String, dynamic>{};
    if (homePage != null) {
      adsData['home_page'] = homePage!.toJson();
    }
    if (catPage != null) {
      adsData['cat_page'] = catPage!.toJson();
    }
    if (gamePage != null) {
      adsData['game_page'] = gamePage!.toJson();
    }
    if (settingPage != null) {
      adsData['setting_page'] = settingPage!.toJson();
    }
    return adsData;
  }
}

class CommonDetails {
  String? appUrl;
  String? imgUrl;
  String? appName;
  String? subTitle;

  CommonDetails({this.appUrl, this.imgUrl, this.appName, this.subTitle});

  CommonDetails.fromJson(Map<String, dynamic> json) {
    appUrl = json['app_url'];
    imgUrl = json['img_url'];
    appName = json['app_name'];
    subTitle = json['sub_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> adsData = <String, dynamic>{};
    adsData['app_url'] = appUrl;
    adsData['img_url'] = imgUrl;
    adsData['app_name'] = appName;
    adsData['sub_title'] = subTitle;
    return adsData;
  }
}
