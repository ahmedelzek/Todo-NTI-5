import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';

abstract class TextStyleManger {
  static TextStyle bodySmallLightText() {
    return TextStyle(
      color: AppColors.grey,
      fontSize: 12.sp,
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle bodyMediumText() {
    return TextStyle(
      color: AppColors.black,
      fontSize: 14.sp,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle bodyMediumLightText() {
    return TextStyle(
      color: AppColors.grey,
      fontSize: 14.sp,
      fontWeight: FontWeight.w300,
    );
  }
  static TextStyle bodyMediumBoldText() {
    return TextStyle(
      color: AppColors.black,
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle bodyLargeText() {
    return TextStyle(
      color: AppColors.black,
      fontSize: 16.sp,
      fontWeight: FontWeight.w300,
    );
  }
  static TextStyle bodyLargeLightText() {
    return TextStyle(
      color: AppColors.grey,
      fontSize: 16.sp,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle buttonTextStyle() {
    return TextStyle(
      color: AppColors.transparentGreen,
      fontSize: 19.sp,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle smallTitleText() {
    return TextStyle(
      color: AppColors.black,
      fontSize: 19.sp,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle largeTitleText() {
    return TextStyle(
      color: AppColors.black,
      fontSize: 24.sp,
      fontWeight: FontWeight.w400,
    );
  }
}
