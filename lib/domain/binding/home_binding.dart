import 'package:get/get.dart';
import 'package:task_ui_challenge/data/repos/carsRepo/repoImpl/mock_repo_impl.dart';
import 'package:task_ui_challenge/data/services/mock/mack_data_service.dart';
import 'package:task_ui_challenge/domain/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut<HomeController>(()=>HomeController(dataSource: CarsRepoImplMock(carServiceMock: CarServiceMock())));
  }
}