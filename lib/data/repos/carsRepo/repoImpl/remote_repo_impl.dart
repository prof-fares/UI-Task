import 'package:dartz/dartz.dart';
import 'package:task_ui_challenge/app/configurations/errors/failure_model.dart';
import 'package:task_ui_challenge/data/models/car_model.dart';
import 'package:task_ui_challenge/data/repos/carsRepo/cars_repo_interface.dart';

class CarsRepoImplRemote extends CarsRepoInterface{
  @override
  Future<Either<GeneralErrorModel, CarsModel>> getAllCars({required int page}) {
    // TODO: implement getAllCars
    throw UnimplementedError();
  }

  @override
  Future<Either<GeneralErrorModel, Car>> getCarbyId({required String carId}) {
    // TODO: implement getCarbyId
    throw UnimplementedError();
  }
}