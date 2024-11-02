import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_ui_challenge/app/configurations/constant/app_strings.dart';
import 'package:task_ui_challenge/app/configurations/routes/app_router.dart';
import 'package:task_ui_challenge/app/helpers/extensions/on_tap_extension.dart';
import 'package:task_ui_challenge/app/helpers/extensions/spacer_extension.dart';
import 'package:task_ui_challenge/domain/controllers/home_controller.dart';
import 'package:task_ui_challenge/presentation/resourceManger/commonWidgets/custom_button.dart';
import 'package:task_ui_challenge/presentation/views/home/homeWidgets/car_avatar.dart';
import 'package:task_ui_challenge/presentation/views/home/homeWidgets/carousel_widget.dart';
import 'package:task_ui_challenge/presentation/resourceManger/commonWidgets/cars_grid_view.dart';
import 'package:task_ui_challenge/presentation/views/home/homeWidgets/final_image.dart';
import 'package:task_ui_challenge/presentation/views/home/homeWidgets/home_app_bar.dart';
import 'package:task_ui_challenge/presentation/views/home/homeWidgets/search_field.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        appBar: const HomeAppBar(),
        body: GetBuilder<HomeController>(builder: (controller) {
          return controller.loader
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 100,
                          child: ListView.builder(
                              key: const PageStorageKey("avatarCarListView"),
                              itemCount: controller.cars.length,
                              scrollDirection: Axis.horizontal,
                              //       itemExtent: 10.w,
                              padding: EdgeInsets.symmetric(horizontal: 10.w),
                              itemBuilder: (context, i) => CarAvatar(
                                  carName: controller.cars[i].name!,
                                  imageUrl: controller.cars[i].imageUrl!).onTap((){
                                    Get.toNamed(AppRouter.carDetail,
                                    arguments: {"carId":controller.cars[i].id});
                                  })
                                  )),
                      const CarouselWidget(),
                      const SearchField().paddingSymmetric(horizontal: 16.w),
                      15.sp.spacerHight,
                 const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(child: CustomButton(name: AppStrings.asian, )),
                          Expanded(
                            child: CustomButton(
                                name: AppStrings.european, ),
                          ),
                          Expanded(child: CustomButton(name: AppStrings.amircan,)),
                        ],
                      ).paddingSymmetric(horizontal: 12.w),
                      20.sp.spacerHight,
                     const CarsGridView<HomeController>(),
                      15.sp.spacerHight,
                      const FinalImage()
                    ],
                  ).paddingSymmetric(vertical: 16.w),
                );
        }),
      ),
    );
  }
}
