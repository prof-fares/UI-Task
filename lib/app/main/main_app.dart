import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:task_ui_challenge/app/configurations/routes/app_pages.dart';
import 'package:task_ui_challenge/app/configurations/routes/app_router.dart';
import 'package:task_ui_challenge/presentation/resourceManger/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
            designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      child: GetMaterialApp(
   //     showPerformanceOverlay: true,
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
      //  useInheritedMediaQuery: true,
        locale: const Locale("ar"),
builder: DevicePreview.appBuilder,
        debugShowCheckedModeBanner: false,
       getPages: AppPages.routes,
       initialRoute: AppRouter.homeScreen,
      ),
    );
  }
}