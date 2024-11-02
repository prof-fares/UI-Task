import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_ui_challenge/app/configurations/constant/app_strings.dart';
import 'package:task_ui_challenge/data/models/car_model.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_assets.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_styles.dart';
import 'package:task_ui_challenge/presentation/views/home/homeWidgets/car_detail_box.dart';

class CarCard extends StatelessWidget {
  final Car car;
  const CarCard({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Stack(
    //    clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
           color: Theme.of(context).cardColor,
                 //   borderRadius: BorderRadius.circular(12)
                    ),
                height: 45.h,
                child: Center(child: Text("${car.name} | ${car.mark} | ${car.category}",style: AppStyles.normalBlueStyle(context),)),
              ),
              CachedNetworkImage(
              
                imageUrl: car.imageUrl!,
       
                //  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),

                errorWidget: (context, url, error) => const Icon(Icons.error),
                fit: BoxFit.cover,
              ),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -2.h,
         //   width: MediaQuery.of(context).size.width*0.475,
              child: Row(
              //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
              Expanded(
                child: CarDetailBox(
                  label: AppStrings.priceText,
                  icon: AppAssets.priceIcon,
                  equalLabel: car.price.toString(),
                ),
              ),
               Expanded(
                 child: CarDetailBox(
                  label :AppStrings.yearText,
                  icon: AppAssets.yearIcon,
                  equalLabel: car.year.toString(),
                             ),
               ),
               Expanded(
                 child: CarDetailBox(
                  label: AppStrings.milText,
                  icon: AppAssets.milIcon,
                  equalLabel: car.mileage.toString(),
                             ),
               ),
               Expanded(
                 child: CarDetailBox(
                  label: AppStrings.guranteeText,
                  icon: AppAssets.guranteeIcon,
                  equalLabel: car.guarantee.toString(),
                             ),
               ),
                    
                          ],
                        ))
        ],
      ),
    );
  }
}
