import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

TextStyle size16_M_medium({
  Color? textColor,
  double? letterSpacing = 0.0,
}) =>
    TextStyle(
        color: textColor ?? colorWhite,
        fontSize: 16.sp,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w500);

TextStyle size16_M_semibold({
  Color? textColor,
  double? letterSpacing = 0.0,
}) =>
    TextStyle(
        color: textColor ?? colorWhite,
        fontSize: 16.sp,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w600);

TextStyle size14_M_regular(
        {Color? textColor, double? letterSpacing = 0.0, double? height}) =>
    TextStyle(
        color: textColor ?? colorWhite,
        fontSize: 14.sp,
        letterSpacing: letterSpacing,
        height: height,
        fontWeight: FontWeight.w400);

TextStyle size16_M_bold({Color? textColor, double? letterSpacing}) => TextStyle(
      color: textColor ?? colorWhite,
      fontSize: 16.sp,
      letterSpacing: letterSpacing ?? 0.0,
      fontWeight: FontWeight.w700,
    );

TextStyle size14_M_light({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorWhite,
        fontSize: 14.sp,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w300);

TextStyle size14_M_semibold(
        {Color? textColor, double? letterSpacing = 0.0, double? height}) =>
    TextStyle(
        color: textColor ?? colorWhite,
        fontSize: 14.sp,
        height: height,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w600);

TextStyle size13_M_regular(
        {Color? textColor, double? letterSpacing = 0.0, double? height}) =>
    TextStyle(
        color: textColor ?? colorWhite,
        letterSpacing: letterSpacing,
        height: height,
        fontWeight: FontWeight.w400,
        fontSize: 13.sp);

TextStyle size12_M_bold(
        {Color? textColor, double? letterSpacing = 0.0, double? height}) =>
    TextStyle(
        color: textColor ?? colorWhite,
        fontSize: 12.sp,
        fontWeight: FontWeight.w700);

TextStyle size24_M_medium({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorWhite,
        fontSize: 24.sp,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w500);

TextStyle size10_M_semibold({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorWhite,
        fontSize: 10.sp,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w600);

TextStyle size11_M_bold({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorWhite,
        fontSize: 11.sp,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w700);

TextStyle size18_M_medium({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorWhite,
        fontSize: 18.sp,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w500);

TextStyle size18_M_semiBold({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorWhite,
        fontSize: 18.sp,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w600);

TextStyle size15_M_bold({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorWhite,
        fontSize: 15.sp,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w700);

TextStyle size25_M_bold({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorWhite,
        fontSize: 25.sp,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.bold);

TextStyle size20_M_semibold({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorWhite,
        fontSize: 20.sp,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w600);

TextStyle size30_M_medium({Color? textColor, double? letterSpacing = 0.0}) =>
    TextStyle(
        color: textColor ?? colorWhite,
        fontSize: 30.sp,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.w500);
