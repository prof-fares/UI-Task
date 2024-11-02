import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_ui_challenge/app/configurations/constant/app_strings.dart';
import 'package:task_ui_challenge/app/helpers/extensions/spacer_extension.dart';
import 'package:task_ui_challenge/data/models/car_model.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_assets.dart';
import 'package:task_ui_challenge/presentation/views/carDetail/carDetailsWidgets/custom_icon.dart';
import 'package:task_ui_challenge/presentation/views/carDetail/carDetailsWidgets/detail_box.dart';

class DetailHeader extends StatelessWidget {
  final Car car;
  const DetailHeader({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height*0.25,width: double.infinity,
            child: CachedNetworkImage(
              imageUrl: car.imageUrl!,
            
              //  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
            
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
           Positioned(top: 10.h,
           right: 10.w,
            width: MediaQuery.of(context).size.width*0.9,
              child:  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const CustomIcon(icon: AppAssets.backIcon),
              Row(
                children: [
                  const CustomIcon(icon: AppAssets.shareIcon),
                  10.w.spacerWidth,
                  const CustomIcon(icon: AppAssets.favIcon)
                ],
              )
            ],
          )),
          Positioned(
              bottom: -90.h,
              width: MediaQuery.of(context).size.width ,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: DetailBox(
                      label: AppStrings.slinder,
                      icon: AppAssets.slinderIcon,
                      equalLabel: car.price.toString(),
                    ),
                  ),
                  Expanded(
                    child: DetailBox(
                      label: AppStrings.yearText,
                      icon: AppAssets.yearIcon,
                      equalLabel: car.year.toString(),
                    ),
                  ),
                  Expanded(
                    child: DetailBox(
                      label: AppStrings.milText,
                      icon: AppAssets.milIcon,
                      equalLabel: car.mileage.toString(),
                    ),
                  ),
                
                ],
              )),
        ],
      ),
    );
  }
}
