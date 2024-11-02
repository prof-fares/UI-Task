import 'package:dartz/dartz.dart';
import 'package:task_ui_challenge/app/configurations/errors/failure_model.dart';
import 'package:task_ui_challenge/data/models/car_model.dart';
import 'package:task_ui_challenge/data/repos/carsRepo/cars_repo_interface.dart';
import 'package:task_ui_challenge/domain/controllers/base_controller.dart';

class CarDetailController extends BaseController {
  final CarsRepoInterface dataSource;
  final String carId;
  late Car oneCar;

  CarDetailController({required this.carId, required this.dataSource});

  @override
  void initializeData() {
    super.initializeData();
    fetchData();
  }

  Future<void> fetchData() async {
    loader = true;
    update();

    final result = await Future.wait([
      dataSource.getCarbyId(carId: carId),
      dataSource.getAllCars(page: currentPage),
    ]);
final oneCarResult=result[0]as Either<GeneralErrorModel,Car>  ;
    final carsResult=result[1] as Either<GeneralErrorModel,CarsModel>;
    
    oneCarResult.fold(
      (error) => handleError("Failed to load car details"),
      (car) {
        oneCar = car ;
        loader = false;
        update();
      },
    );

  carsResult.fold(
      (error) => handleError("Failed to load cars"),
      (data) {
        cars.clear();
        cars.value = data.cars??[] ;
        update();
      },
    );
  }

  @override
  Future<void> loadMoreData() async {
    if (isFetching.value || !hasMoreData.value) return;

    isFetching.value = true;
    currentPage++;
    final result = await dataSource.getAllCars(page: currentPage);
    result.fold(
      (error) => handleError("Error loading more cars"),
      (data) {
        if (data.cars!.isEmpty) {
          hasMoreData.value = false;
        } else {
          cars.addAll(data.cars!);
        }
        isFetching.value = false;
      },
    );
  }
}
