import 'package:get/get.dart';
import 'package:task_ui_challenge/app/configurations/routes/app_router.dart';
import 'package:task_ui_challenge/domain/binding/car_detail_binding.dart';
import 'package:task_ui_challenge/domain/binding/home_binding.dart';
import 'package:task_ui_challenge/presentation/views/carDetail/car_details_screen.dart';
import 'package:task_ui_challenge/presentation/views/home/home_screen.dart';

class AppPages {
  static final List<GetPage> routes = [
    GetPage(name: AppRouter.homeScreen, page:()=>const HomeScreen() ,binding:HomeBinding() ),
    GetPage(name: AppRouter.carDetail, page:()=>CarDetailsScreen() ,binding:CarDetailBinding() )
  ];
}
