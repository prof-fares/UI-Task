import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_ui_challenge/app/helpers/extensions/padding_extension.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_colors.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_styles.dart';

class CarAvatar extends StatelessWidget {
  final String carName;
  final String imageUrl;
  const CarAvatar({super.key, required this.carName, required this.imageUrl});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 90.w,
      height: 112.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //  mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 74.w,
              height: 74.h,
              decoration: BoxDecoration(
               
                  color: AppColors.backgroundColor,
                  shape: BoxShape.circle,
                  border: Border.all(color:AppColors.myOrange,width: 1.w),
                
                  ),
            child:AspectRatio(
      aspectRatio: 1,
      child: ClipOval(
        child: CachedNetworkImage(
          imageUrl: imageUrl,
        //  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.cover, 
        ),
      ),
    ).paddingAll(5.w)
    ),
          Text(carName,style:AppStyles.normalBlackStyle(context) ,)
        ],
      ),
    );
  }
}