import 'package:all_games2/screens/setting/setting.dart';
import 'package:all_games2/utils/constant/colors.dart';
import 'package:all_games2/utils/constant/text_style.dart';
import 'package:all_games2/widgets/lunch_url.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNativeAd extends StatelessWidget {
  final String? appUrl;
  final String? imgUrl;
  final String? appName;
  final String? appSubTitle;
  final double? height;
  final double? width;

  const CustomNativeAd(
      {Key? key,
      this.height,
      this.width,
      this.imgUrl,
      this.appName,
      this.appSubTitle,
      this.appUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation) => InkWell(
              overlayColor: MaterialStatePropertyAll(Colors.transparent),
              onTap: () => launchURL(url: appUrl),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      width: MediaQuery.of(context).orientation ==
                              Orientation.landscape
                          ? 18
                          : 16,
                      color: colorOrange,
                      child: Center(
                        child: Text(
                          "Ad",
                          style: TextStyle(
                              color: colorWhite,
                              fontFamily: '',
                              fontSize: MediaQuery.of(context).orientation ==
                                      Orientation.landscape
                                  ? 14
                                  : 12),
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? 20.w
                              : 10.w,
                          top: MediaQuery.of(context).orientation ==
                                  Orientation.portrait
                              ? height ?? 20.h
                              : 35.h),
                      child: Row(
                        children: [
                          CachedNetworkImage(
                              filterQuality: FilterQuality.high,
                              height: 50,
                              width: 50,
                              imageUrl: imgUrl ??
                                  'https://play-lh.googleusercontent.com/euw3G79LO7SWEmJGJofmoE1FCcPB0pf1EoAyu_AGCZU9Nx9W1TL4Nk6fXRHdYyyfBw=w240-h480-rw',
                              fit: BoxFit.cover),
                          SizedBox(
                              width: MediaQuery.of(context).orientation ==
                                      Orientation.landscape
                                  ? 10.w
                                  : 17.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: width ??
                                    MediaQuery.of(context).size.width / 1.5,
                                child: Text(
                                  appName ?? "Test Ad : Flood-It!",
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize:
                                          MediaQuery.of(context).orientation ==
                                                  Orientation.portrait
                                              ? 17.sp
                                              : 8.sp,
                                      fontFamily: '',
                                      letterSpacing: 0),
                                ),
                              ),
                              MediaQuery.of(context).orientation ==
                                      Orientation.portrait
                                  ? SizedBox(
                                      width: width ??
                                          MediaQuery.of(context).size.width /
                                              1.5,
                                      child: Text(
                                        appSubTitle ??
                                            "Install Flood-It App for free! Free",
                                        overflow: TextOverflow.ellipsis,
                                        style: size14_M_regular(
                                                textColor: colorGrey)
                                            .copyWith(fontFamily: ''),
                                      ),
                                    )
                                  : Text(
                                      "Install Flood-It App for free! Free pouhdddd",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: colorGrey,
                                          fontSize: 6.sp,
                                          fontFamily: '')),
                            ],
                          ),
                        ],
                      )),
                ],
              ),
            ));
  }
}
