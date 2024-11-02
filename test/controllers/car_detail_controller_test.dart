import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:task_ui_challenge/data/models/car_model.dart';
import 'package:task_ui_challenge/data/repos/carsRepo/cars_repo_interface.dart';
import 'package:task_ui_challenge/domain/controllers/car_detail_controller.dart';
import 'package:task_ui_challenge/app/configurations/errors/failure_model.dart';
import 'car_detail_controller_test.mocks.dart';
class TestCarDetailController extends CarDetailController {
  TestCarDetailController({required String carId, required CarsRepoInterface dataSource})
      : super(carId: carId, dataSource: dataSource);

  @override
  void showError(String message) {
    debugPrint(message); 
  }
}



@GenerateMocks([CarsRepoInterface])
void main() {
  late MockCarsRepoInterface mockCarsRepo;
  late TestCarDetailController carDetailController;
  late Car testCar;

  setUp(() {
    mockCarsRepo = MockCarsRepoInterface();
    carDetailController = TestCarDetailController(carId: '1', dataSource: mockCarsRepo);
    testCar = Car(id: '1', name: 'Test Car');
  });






test('Sets hasMoreData to false when no more data is available', () async {
  // Arrange
  when(mockCarsRepo.getAllCars(page: 2)).thenAnswer((_) async => Right(CarsModel(cars: [])));
  carDetailController.currentPage = 1;

  // Act
  await carDetailController.loadMoreData();

  // Assert
  expect(carDetailController.hasMoreData.value, false);
});

test('Fetches car details successfully', () async {
  // Arrange
  when(mockCarsRepo.getCarbyId(carId: '1')).thenAnswer((_) async => Right(testCar));
  when(mockCarsRepo.getAllCars(page: 1)).thenAnswer((_) async => Right(CarsModel(cars: [testCar])));

  // Act
  await carDetailController.fetchData();

  // Assert
  expect(carDetailController.oneCar, testCar);
  expect(carDetailController.cars.isNotEmpty, true);
});

  testWidgets('Handles error when fetching car details fails', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Builder(
          builder: (context) {
            ScreenUtil.init(
              context,
              designSize: const Size(360, 690),
              minTextAdapt: true,
            );

            when(mockCarsRepo.getCarbyId(carId: '1')).thenAnswer((_) async => Left(GeneralErrorModel(message: 'Error')));
            when(mockCarsRepo.getAllCars(page: 1)).thenAnswer((_) async => Right(CarsModel(cars: [])));

            carDetailController.fetchData();

            return Container();
          },
        ),
      ),
    );

    await tester.pump();

    expect(carDetailController.cars.isEmpty, true);
  });
}
