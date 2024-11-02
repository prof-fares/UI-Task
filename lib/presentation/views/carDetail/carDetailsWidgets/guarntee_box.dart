import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_ui_challenge/app/helpers/extensions/padding_extension.dart';
import 'package:task_ui_challenge/app/helpers/extensions/spacer_extension.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_assets.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_colors.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_styles.dart';

class GuaranteeBox extends StatelessWidget{
  final String guarantee;

  const GuaranteeBox({super.key, required this.guarantee});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.myOrange,borderRadius: BorderRadius.all(Radius.circular(10))),
      child:Row(mainAxisSize: MainAxisSize.max,
        children: [
          
        SvgPicture.asset(AppAssets.guranteeIcon,color: AppColors.backgroundColor,height: 30.h,),
        10.spacerWidth,
        Text("مكفوله حتي $guarantee كم",style: AppStyles.boldWhiteStyle(context),)
      ],).paddingSymmetric(horizontal: 10.w,vertical: 5.h) ,
    );
  }
}