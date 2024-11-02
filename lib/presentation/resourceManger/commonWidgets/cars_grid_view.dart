import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_ui_challenge/app/configurations/routes/app_router.dart';
import 'package:task_ui_challenge/app/helpers/extensions/on_tap_extension.dart';
import 'package:task_ui_challenge/domain/controllers/base_controller.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_colors.dart';
import 'package:task_ui_challenge/presentation/views/home/homeWidgets/car_card.dart';

class CarsGridView<T extends BaseController> extends GetView<T> {
  
  const CarsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
                        double screenhight = MediaQuery.of(context).size.height;
                        int crossAxisCount =
                            (constraints.maxWidth / 200).floor();
                        return SizedBox(
                          height: screenhight * 0.4,
                          child: Obx(() {
                            return GridView.builder(
                                controller: controller.scrollController,
                                key: const PageStorageKey("gridCarView"),
                                  // Add 1 extra item to the count for the loading indicator
                                itemCount: controller.cars.length +1,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: crossAxisCount>1?crossAxisCount:2,
                                  mainAxisSpacing: 8.0 ,
                                  crossAxisSpacing: 1.0,
                                  childAspectRatio: 1.0,
                                ),
                                itemBuilder: (context, i) =>
                                    // As long as the item is not the last item in the list, build your widget normally
        i < controller.cars.length 
          ?  CarCard(car: controller.cars[i]).onTap((){
                                    Get.toNamed(AppRouter.carDetail,
                                    arguments: {"carId":controller.cars[i].id});
                                  }): Obx(() {
              // If it's the last item, check if more data is available
              return controller.hasMoreData.value
                ? const GridTile(
                  child: Align(
                      // Show a loading spinner if there is more data to load
                        alignment: Alignment.centerLeft,
                      child: CircularProgressIndicator(
                        color: AppColors.mainColor,
                      ),
                    ),
                )
                : const SizedBox(); // Show nothing if no more data
            }));
                          }),
                        ).paddingSymmetric(horizontal: 10.w);
                      });
  }
}