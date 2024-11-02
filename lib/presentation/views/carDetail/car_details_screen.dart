import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_ui_challenge/app/configurations/constant/app_strings.dart';
import 'package:task_ui_challenge/app/helpers/extensions/spacer_extension.dart';
import 'package:task_ui_challenge/domain/controllers/car_detail_controller.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_assets.dart';
import 'package:task_ui_challenge/presentation/resourceManger/commonWidgets/cars_grid_view.dart';
import 'package:task_ui_challenge/presentation/resourceManger/commonWidgets/custom_button.dart';
import 'package:task_ui_challenge/presentation/views/carDetail/carDetailsWidgets/custom_icon.dart';
import 'package:task_ui_challenge/presentation/views/carDetail/carDetailsWidgets/detail_content.dart';
import 'package:task_ui_challenge/presentation/views/carDetail/carDetailsWidgets/detail_discription.dart';
import 'package:task_ui_challenge/presentation/views/carDetail/carDetailsWidgets/detail_header.dart';
import 'package:task_ui_challenge/presentation/views/carDetail/carDetailsWidgets/detail_table.dart';
import 'package:task_ui_challenge/presentation/views/carDetail/carDetailsWidgets/guarntee_box.dart';
import 'package:task_ui_challenge/presentation/views/carDetail/carDetailsWidgets/publisher_tile.dart';

class CarDetailsScreen extends GetView<CarDetailController> {
  const CarDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body:GetBuilder<CarDetailController>(builder: (controller)=>controller.loader?const Center(child: CircularProgressIndicator(),):(controller.cars.isEmpty||controller.oneCar==null)?const Center(child: Text(AppStrings.errorText),): Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  DetailHeader(car: controller.oneCar),
                  90.spacerHight,
                  DetailDiscription(mark: controller.oneCar.mark, killo: controller.oneCar.mileage.toString()).paddingSymmetric(horizontal: 16.w),
                  16.spacerHight,
                  GuaranteeBox(guarantee:controller.oneCar.guarantee.toString() ).paddingSymmetric(horizontal:15.w),
                  16.spacerHight,
                  CarDetailsTable(attributes: controller.oneCar.attributes!).paddingOnly(right: 16.w),
                  16.spacerHight,
                  const DetailContent(content: "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة  التي يقرأها. ولذلك يتم استخدام طريقة لوريم إيبسوم..").paddingSymmetric(horizontal: 10.w),
                  16.spacerHight,
                  PublisherTile(user: controller.oneCar.user!).paddingSymmetric(horizontal: 16.w),
                  16.spacerHight,
                  const CarsGridView<CarDetailController>().paddingSymmetric(horizontal: 8.w)
        
        
                ],
              ),
            )),
            const SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(flex: 1,child: CustomIcon(icon: AppAssets.callIcon)),
                    Expanded(flex: 1,child: CustomIcon(icon: AppAssets.chatIcon)),
                    Expanded(flex: 2,child: CustomButton(name: AppStrings.location,icon: AppAssets.locatioIcon,)),
                    Expanded(flex: 2,
                      child: CustomButton(notSharp: true,
                        name: AppStrings.book,
                        icon: AppAssets.bookmarkIcon,
                      ),
                    ),
                  ],
                )).paddingSymmetric(horizontal: 8.w,vertical: 10.h)
          ],
        ),
)      ),
    );
  }
}
