import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_ui_challenge/app/helpers/extensions/spacer_extension.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_styles.dart';

class DetailBox extends StatelessWidget {
  final String label;
  final String equalLabel;
  final String icon;

  const DetailBox(
      {super.key,
      required this.label,
      required this.icon,
      required this.equalLabel});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(5.r)),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          5.h.spacerHight,
          SvgPicture.asset(
            height: 40.h,
            icon,
          ),
          FittedBox(
              child: Text(
            label,
            style: AppStyles.normalBlueStyle(context),
          )),
          Text(
            equalLabel,
            style: AppStyles.boldBlueStyle(context),
          )
        ],
      ),
    );
  }
}
