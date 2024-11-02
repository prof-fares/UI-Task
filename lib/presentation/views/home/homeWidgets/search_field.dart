import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_ui_challenge/app/configurations/constant/app_strings.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_colors.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_styles.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 70.h,
        child: TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
              prefixIcon: Icon(
                size: 40.w,
                Icons.search,
                color: Theme.of(context).primaryColor,
              ),
              hintText: AppStrings.searchText,
              helperStyle: AppStyles.normalBlackStyle(context),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide:
                      const BorderSide(color: AppColors.myBlack, width: 0.8))),
        ));
  }
}
