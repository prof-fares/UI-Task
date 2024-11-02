import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_ui_challenge/data/models/user_model.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_colors.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_styles.dart';

class PublisherTile extends StatelessWidget {
  final User user;

  const PublisherTile({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return ListTile(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),tileColor: AppColors.lightLabelColor,
      leading: CircleAvatar(backgroundColor: AppColors.backgroundColor,child: Image.network(user.icon!).paddingAll(5.w),radius: 20,),
      title: Text(user.name!,style: AppStyles.semiBoldBlueStyle(context),),
      trailing: Text("كل السيارات",style: AppStyles.semiBoldBlueStyle(context),),

    );
  }
}