import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:task_ui_challenge/data/models/car_model.dart';
import 'package:task_ui_challenge/data/repos/carsRepo/cars_repo_interface.dart';
import 'package:task_ui_challenge/app/configurations/errors/failure_model.dart';
import 'package:task_ui_challenge/domain/controllers/home_controller.dart';
import 'home_controller_test.mocks.dart';

@GenerateMocks([CarsRepoInterface])

class TestHomeController extends HomeController {
  TestHomeController({required CarsRepoInterface dataSource}) : super(dataSource: dataSource);

  @override
  void showError(String message) {
    debugPrint(message); 
  }
}

void main() {
  late MockCarsRepoInterface mockCarsRepo;
  late TestHomeController homeController;
  late Car testCar;
  late CarsModel testCarsModel;

  setUp(() {
    mockCarsRepo = MockCarsRepoInterface();
    homeController = TestHomeController(dataSource: mockCarsRepo);
    testCar = Car(id: '1', name: 'Test Car');
    testCarsModel = CarsModel(cars: [testCar]);
  });

  group('HomeController Tests', () {
    test('Fetches initial data successfully', () async {
      when(mockCarsRepo.getAllCars(page: 1)).thenAnswer((_) async => Right(testCarsModel));
      await homeController.fetchData();
      expect(homeController.cars.isNotEmpty, true);
      verify(mockCarsRepo.getAllCars(page: 1)).called(1);
    });

    test('Fetches more data successfully', () async {
      when(mockCarsRepo.getAllCars(page: 2)).thenAnswer((_) async => Right(testCarsModel));
      homeController.currentPage = 1;
      await homeController.loadMoreData();
      expect(homeController.cars.isNotEmpty, true);
      verify(mockCarsRepo.getAllCars(page: 2)).called(1);
    });

    testWidgets('Handles error when fetching data fails', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Builder(
            builder: (context) {
              ScreenUtil.init(context, designSize: const Size(360, 690), minTextAdapt: true);
              when(mockCarsRepo.getAllCars(page: 1)).thenAnswer((_) async => Left(GeneralErrorModel(message: 'Error')));
              homeController.fetchData();
              return Container();
            },
          ),
        ),
      );

      expect(homeController.loader, false);
      expect(homeController.cars.isEmpty, true);
    });
  });
}
