import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_ui_challenge/app/helpers/extensions/spacer_extension.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_colors.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_styles.dart';

class CustomButton extends StatelessWidget {
  final String?icon;
  final String name;
  final VoidCallback? action;
  final bool notSharp;

  const CustomButton({super.key, this.icon, required this.name,  this.action, this.notSharp =false});
  @override
  Widget build(BuildContext context) {
     return Container(width: 140.w,height: 45.h,decoration: BoxDecoration(color: notSharp?AppColors.backgroundColor:AppColors.mainColor,borderRadius:BorderRadius.circular(15),border: Border.all(color: notSharp?AppColors.mainColor:AppColors.backgroundColor)),child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
     //   mainAxisSize: MainAxisSize.max,
        children: [
        icon!=null? Row(
          children: [
            SvgPicture.asset(
                icon!,                                                                                                                
                width: 25.w,
                height: 35.h, 
                color:notSharp? AppColors.mainColor:AppColors.backgroundColor,
              ),
              5.w.spacerWidth
          ],
        ):const SizedBox(),
          Text(name,style: notSharp==true?AppStyles.normalBlueStyle(context):AppStyles.normalWhiteStyle(context),)
       ],),);
  }
}