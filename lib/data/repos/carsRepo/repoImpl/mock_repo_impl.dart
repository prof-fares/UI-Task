import 'package:dartz/dartz.dart';
import 'package:task_ui_challenge/app/configurations/errors/failure_model.dart';
import 'package:task_ui_challenge/data/models/car_model.dart';
import 'package:task_ui_challenge/data/repos/carsRepo/cars_repo_interface.dart';
import 'package:task_ui_challenge/data/services/mock/mack_data_service.dart';

class CarsRepoImplMock extends CarsRepoInterface{
  final CarServiceMock _carServiceMock;
  CarsRepoImplMock({required CarServiceMock carServiceMock}) : _carServiceMock = carServiceMock;
  @override
  Future<Either<GeneralErrorModel, CarsModel>> getAllCars({required int page }) async{
     try {
       final response=await _carServiceMock.fetchAllCars(page: page);
   
       CarsModel carsData=CarsModel.fromJson(response);
       print(response);
       return Right(carsData); 

     } catch (e) {
      print("===========$e===============");
      GeneralErrorModel error = GeneralErrorModel(message:e.toString() );
       return Left(error);
     }
  }

  @override
  Future<Either<GeneralErrorModel, Car>> getCarbyId({required String carId}) async{
     try {
       final response=await _carServiceMock.fetchCarById(id: carId);
       Car carData=Car.fromJson(response);
       return Right(carData); 

     } catch (e) {
      GeneralErrorModel error = GeneralErrorModel(message:e.toString() );
       return Left(error);
     }
  }
}