import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_ui_challenge/app/helpers/extensions/padding_extension.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_colors.dart';

class CustomIcon extends StatelessWidget {
  final String icon;

  const CustomIcon({super.key, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.lightLabelColor, shape: BoxShape.circle),
      child: Center(
        child: SvgPicture.asset(
          icon,
          height: 30.h,
        ),
      ).paddingAll(10.w),
    );
  }
}
