import 'package:get/get.dart';
import 'package:task_ui_challenge/data/repos/carsRepo/repoImpl/mock_repo_impl.dart';
import 'package:task_ui_challenge/data/services/mock/mack_data_service.dart';
import 'package:task_ui_challenge/domain/controllers/car_detail_controller.dart';

class CarDetailBinding extends Bindings {
  @override
  void dependencies() {
  final args=Get.arguments as Map<String,dynamic>;
  final String carId=args["carId"];
     Get.lazyPut<CarDetailController>(()=>CarDetailController(carId: carId, dataSource: CarsRepoImplMock(carServiceMock: CarServiceMock())));        
   }
}