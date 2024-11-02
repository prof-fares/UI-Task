import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_colors.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_sizes.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_weights.dart';

class AppStyles {
  static TextStyle normalBlackStyle(BuildContext context) => TextStyle(
        fontWeight: AppWeights.w500,
        fontSize: AppSizes.s12.sp,
        color: Theme.of(context).textTheme.bodyLarge?.color ?? AppColors.myBlack,
      );

  static TextStyle boldBlackStyle(BuildContext context) => TextStyle(
        fontWeight: AppWeights.w800,
        fontSize: AppSizes.s14.sp,
        color: Theme.of(context).textTheme.bodyLarge?.color ?? AppColors.myBlack,
      );

  static TextStyle bigBoldBlackStyle(BuildContext context) => TextStyle(
        fontWeight: AppWeights.w800,
        fontSize: AppSizes.s18.sp,
        color: Theme.of(context).textTheme.bodyLarge?.color ?? AppColors.myBlack,
      );

  static TextStyle normalBlueStyle(BuildContext context) => TextStyle(
        fontWeight: AppWeights.w500,
        fontSize: AppSizes.s12.sp,
        color: Theme.of(context).primaryColor,
      );

  static TextStyle semiBoldBlueStyle(BuildContext context) => TextStyle(
        fontWeight: AppWeights.w800,
        fontSize: AppSizes.s10.sp,
        color: Theme.of(context).primaryColor,
      );

  static TextStyle boldBlueStyle(BuildContext context) => TextStyle(
        fontWeight: AppWeights.w800,
        fontSize: AppSizes.s14.sp,
        color: Theme.of(context).primaryColor,
      );

  static TextStyle normalWhiteStyle(BuildContext context) => TextStyle(
        fontWeight: AppWeights.w400,
        fontSize: AppSizes.s12.sp,
        color: Theme.of(context).scaffoldBackgroundColor,
      );

  static TextStyle boldWhiteStyle(BuildContext context) => TextStyle(
        fontWeight: AppWeights.w500,
        fontSize: AppSizes.s16.sp,
        color: Theme.of(context).scaffoldBackgroundColor,
      );
}
