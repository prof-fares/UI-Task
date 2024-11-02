import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:task_ui_challenge/app/configurations/constant/app_strings.dart';
import 'package:task_ui_challenge/app/configurations/enums/feature_availabilty.dart';
import 'package:task_ui_challenge/app/helpers/extensions/spacer_extension.dart';
import 'package:task_ui_challenge/data/models/cars_attributes.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_assets.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_colors.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_styles.dart';

class CarDetailsTable extends StatelessWidget {
  final CarAttributes attributes;

  const CarDetailsTable({super.key, required this.attributes});

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FlexColumnWidth(4),
        1: FlexColumnWidth(3),
      },
    
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        _buildTableRow(AppStrings.insideColor, attributes.exteriorColor ?? '', AppAssets.inColorIcon,context),
        _buildTableRow(AppStrings.outSideColor, attributes.interiorColor ?? '', AppAssets.outColorIcon,context),
        _buildTableRow(AppStrings.seatType, attributes.seatType ?? '', AppAssets.seatIcon,context),
        _buildTableRow(AppStrings.topView, attributes.hasSunroof == FeatureAvailability.available ? "✔" : "✘", AppAssets.topViewCarIcon,context),
        _buildTableRow(AppStrings.rearCamer, attributes.hasRearCamera == FeatureAvailability.available ? "✔" : "✘", AppAssets.backCameraIcon,context),
        _buildTableRow(AppStrings.sensor, attributes.sensors ?? '', AppAssets.carengineIcon,context),
        _buildTableRow(AppStrings.clynder2, attributes.cylinder.toString(), AppAssets.slinderIcon,context),
        _buildTableRow(AppStrings.gaershift, attributes.transmission ?? '', AppAssets.carGearShiftIcon,context),
      ],
    );
  }

  TableRow _buildTableRow(String label, String value, String iconPath,BuildContext context) {
    return TableRow(
      
      decoration: BoxDecoration( color: Theme.of(context).cardColor,border: Border.all(color: AppColors.backgroundColor)),
      children: [
        IconWithTextWidget(text: label, iconPath: iconPath),
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            value,
            textAlign: TextAlign.right,
            style: AppStyles.normalBlackStyle(context)
          ),
        ),
      ],
    );
  }
}

class IconWithTextWidget extends StatelessWidget {
  final String text;
  final String iconPath;

  const IconWithTextWidget({super.key, required this.text, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Row(
   // mainAxisAlignment: MainAxisAlignment.center,
      children: [
          SvgPicture.asset(
          iconPath,
          height: 20,
          width: 20,
        ),
        10.w.spacerWidth,
        Text(
          text,
               style: AppStyles.normalBlackStyle(context) ,
        ),
        const SizedBox(width: 6),
      
      ],
    ).paddingOnly(right: 10.w)
    ;
  }
}
