import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_colors.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_weights.dart';


void showCustomSnackBar({required String message,required bool isErr}) {
  Get.showSnackbar(
    GetSnackBar(
      backgroundColor:  AppColors.snackBarColor,
      message: message,  
      icon: Icon(isErr?Icons.error:Icons.check_circle, color:isErr? AppColors.errorColor:Colors.greenAccent),  
      snackPosition: SnackPosition.TOP,  
      borderRadius: 20,  
      margin: const EdgeInsets.all(15),  
      duration: const Duration(seconds: 3),  
      animationDuration: const Duration(milliseconds: 500),  
      isDismissible: true, 
      forwardAnimationCurve: Curves.easeOut,  
      reverseAnimationCurve: Curves.easeOut, 
      padding: const EdgeInsets.all(20), 
      dismissDirection: DismissDirection.horizontal, 
      mainButton: TextButton(
        onPressed: () {
          Get.back(); 
        },
        child:  Text('إغلاق', style: TextStyle(        fontWeight: AppWeights.w800,
        fontSize: 14.sp,
        color: AppColors.mainColor,)),
      ),
    ),
  );
}