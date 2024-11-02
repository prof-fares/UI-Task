import 'package:flutter_test/flutter_test.dart';
import 'package:task_ui_challenge/app/configurations/enums/feature_availabilty.dart';
import 'package:task_ui_challenge/data/models/car_model.dart';

void main() {
  group('Car Model Tests', () {
    test('Car fromJson should parse correctly', () {
      final carJson = {
        "id": "1",
        "name": "Toyota",
        "mark": "Corolla",
        "price": 8700,
        "imageUrl": "https://example.com/car.jpg",
        "year": 2019,
        "category": "الفئة الرابعة",
        "Guarantee": 2024,
        "mileage": 70000,
        "user": {
          "name": "يوكن للسيارات المعتمدة",
          "icon": "https://example.com/user_icon.png"
        },
        "attributes": {
          "exteriorColor": "أبيض",
          "interiorColor": "بيج",
          "seatType": "مخمل",
          "hasSunroof": true,
          "hasRearCamera": false,
          "sensors": "أمامي - خلفي",
          "cylinder": 6,
          "transmission": "أوتوماتيك"
        }
      };

      final car = Car.fromJson(carJson);

      expect(car.id, "1");
      expect(car.name, "Toyota");
      expect(car.mark, "Corolla");
      expect(car.price, 8700);
      expect(car.imageUrl, "https://example.com/car.jpg");
      expect(car.year, 2019);
      expect(car.category, "الفئة الرابعة");
      expect(car.guarantee, 2024);
      expect(car.mileage, 70000);

      expect(car.user?.name, "يوكن للسيارات المعتمدة");
      expect(car.user?.icon, "https://example.com/user_icon.png");

      final attributes = car.attributes;
      expect(attributes?.exteriorColor, "أبيض");
      expect(attributes?.interiorColor, "بيج");
      expect(attributes?.seatType, "مخمل");
      expect(attributes?.hasSunroof, FeatureAvailability.available);
      expect(attributes?.hasRearCamera, FeatureAvailability.unavailable);
      expect(attributes?.sensors, "أمامي - خلفي");
      expect(attributes?.cylinder, 6);
      expect(attributes?.transmission, "أوتوماتيك");
    });

    test('CarsModel fromJson should parse list of cars correctly', () {
      final carsJson = {
        "cars": [
          {
            "id": "1",
            "name": "Toyota",
            "mark": "Corolla",
            "price": 8700,
            "imageUrl": "https://example.com/car1.jpg",
            "year": 2019,
            "category": "الفئة الرابعة",
            "Guarantee": 2024,
            "mileage": 70000
          },
          {
            "id": "2",
            "name": "Kia",
            "mark": "Sportage",
            "price": 12700,
            "imageUrl": "https://example.com/car2.jpg",
            "year": 2021,
            "category": "الفئة الخامسة",
            "Guarantee": 2023,
            "mileage": 30000
          },
        ]
      };

      final carsModel = CarsModel.fromJson(carsJson);

      expect(carsModel.cars?.length, 2);

      expect(carsModel.cars?[0].id, "1");
      expect(carsModel.cars?[0].name, "Toyota");
      expect(carsModel.cars?[0].mark, "Corolla");

      expect(carsModel.cars?[1].id, "2");
      expect(carsModel.cars?[1].name, "Kia");
      expect(carsModel.cars?[1].mark, "Sportage");
    });
  });
}
