import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:task_ui_challenge/app/configurations/errors/failure_model.dart';
import 'package:task_ui_challenge/data/repos/carsRepo/repoImpl/mock_repo_impl.dart';
import 'package:task_ui_challenge/data/services/mock/mack_data_service.dart';
import 'mock_repo_test.mocks.dart';

@GenerateMocks([CarServiceMock])
void main() {
  late MockCarServiceMock mockCarService;
  late CarsRepoImplMock carsRepoImpl;

  setUp(() {
    mockCarService = MockCarServiceMock();
    carsRepoImpl = CarsRepoImplMock(carServiceMock: mockCarService);
  });

  group('CarsRepoImplMock Tests', () {
    test('getAllCars returns CarsModel on success', () async {
      final fakeResponse = {
        "cars": [
          {
            "id": '1',
            "name": "Test Car",
            "price": 10000,
            "imageUrl": "https://example.com/image.png",
            "year": 2020,
            "mileage": 15000,
          }
        ],
        "hasMore": true,
      };
      when(mockCarService.fetchAllCars(page: 1))
          .thenAnswer((_) async => fakeResponse);

      final result = await carsRepoImpl.getAllCars(page: 1);

      expect(result.isRight(), true);
      result.fold(
        (error) => fail("Expected Right but got Left"),
        (carsModel) {
          expect(carsModel.cars, isNotEmpty);
          expect(carsModel.cars!.first.name, "Test Car");
        },
      );
    });

    test('getAllCars returns GeneralErrorModel on failure', () async {
      when(mockCarService.fetchAllCars(page: 1))
          .thenThrow(Exception("Failed to fetch cars"));

      final result = await carsRepoImpl.getAllCars(page: 1);

      expect(result.isLeft(), true);
      result.fold(
        (error) {
          expect(error, isA<GeneralErrorModel>());
          expect(error.message, contains("Failed to fetch cars"));
        },
        (_) => fail("Expected Left but got Right"),
      );
    });

    test('getCarbyId returns Car on success', () async {
      final fakeCarResponse = {
        "id": '1',
        "name": "Test Car",
        "price": 10000,
        "imageUrl": "https://example.com/image.png",
        "year": 2020,
        "mileage": 15000,
      };
      when(mockCarService.fetchCarById(id: '1'))
          .thenAnswer((_) async => fakeCarResponse);

      final result = await carsRepoImpl.getCarbyId(carId: '1');

      expect(result.isRight(), true);
      result.fold(
        (error) => fail("Expected Right but got Left"),
        (car) {
          expect(car.name, "Test Car");
          expect(car.price, 10000);
        },
      );
    });

    test('getCarbyId returns GeneralErrorModel on failure', () async {
      when(mockCarService.fetchCarById(id: '1'))
          .thenThrow(Exception("Failed to fetch car details"));

      final result = await carsRepoImpl.getCarbyId(carId: '1');

      expect(result.isLeft(), true);
      result.fold(
        (error) {
          expect(error, isA<GeneralErrorModel>());
          expect(error.message, contains("Failed to fetch car details"));
        },
        (_) => fail("Expected Left but got Right"),
      );
    });
  });
}
