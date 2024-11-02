import 'package:dartz/dartz.dart';
import 'package:task_ui_challenge/app/configurations/errors/failure_model.dart';
import 'package:task_ui_challenge/data/models/car_model.dart';

abstract class CarsRepoInterface {
  Future<Either<GeneralErrorModel,CarsModel>> getAllCars({required int page});
  Future<Either<GeneralErrorModel,Car>> getCarbyId({required String carId});

}