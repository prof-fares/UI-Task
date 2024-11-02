import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_ui_challenge/domain/controllers/home_controller.dart';

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return SizedBox(
          height: 200.h,
          child: PageView.builder(
            controller: controller.pageController,
            itemCount: controller.carouselItems.length,
            
            itemBuilder: (context, index) {
              return RepaintBoundary( 
                child: AnimatedBuilder(
                  animation: controller.pageController,
                  builder: (context, child) {
                    double value = 1.0;
                    if (controller.pageController.position.haveDimensions) {
                      value = controller.pageController.page! - index;
                      value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
                    }
                    return Transform(
                      transform: Matrix4.identity()
                        ..scale(value.w, value.h)
                        ..rotateZ((1 - value) * 0.1),
                      alignment: Alignment.center,
                      child: Container(
                  //      margin:  EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          image: DecorationImage(
                            image: AssetImage(controller.carouselItems[index]),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
            onPageChanged: (int page) {
              controller.onPageChanged(page);
            },
          ),
        );
      },
    );
  }
}
