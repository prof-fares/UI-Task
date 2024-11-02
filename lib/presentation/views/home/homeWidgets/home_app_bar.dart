import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_ui_challenge/app/helpers/extensions/on_tap_extension.dart';

import 'package:task_ui_challenge/presentation/resourceManger/app_assets.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_colors.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_styles.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.mainColor,
      leading: SvgPicture.asset(
        AppAssets.homeMenu,
          
        height: 35.h,
      ).paddingOnly(right: 10.w),
      
      leadingWidth: 35.w,
      
      actions: [
       
          Icon(Get.isDarkMode ? Icons.dark_mode : Icons.light_mode).onTap((){    Get.changeThemeMode(
      Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);}),
       Stack(
                     clipBehavior: Clip.none, 
          children: [
            SvgPicture.asset(
              AppAssets.homeNotifaction,
                // width: 20.w,
              height: 35.h,
            ),
                      Positioned(width: 20.w,bottom:20.h ,left: 15.w,child: Container(decoration: BoxDecoration(shape: BoxShape.circle,color: AppColors.myOrange,border: Border.all(color: AppColors.backgroundColor)),child: Center(child: Text("2",style: AppStyles.normalWhiteStyle(context),)),))

          ],
        ).paddingOnly(left: 15.w,right: 15.w),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(70.h); 
}
