import 'package:task_ui_challenge/data/models/cars_attributes.dart';
import 'package:task_ui_challenge/data/models/user_model.dart';

class CarsModel {
  List<Car>? cars;

  CarsModel({this.cars});

  factory CarsModel.fromJson(Map<String, dynamic> json) {
    return CarsModel(
      cars: (json['cars'] as List).map((car) => Car.fromJson(car)).toList(),
    );
  }


}

class Car {
 final String? id;
 final String? name;
 final int? price;
 final String? imageUrl;
 final int? year;
 final int? mileage;
 final String?mark;
 final String? category;
 final int? guarantee;
 final User?user;
 bool? isLiked;
  final CarAttributes? attributes;
  

  Car(

      {this.guarantee,
      this.attributes, 
        this.mark,
        this.user, 
      this.category,
        this.id,
      this.name,
      this.price,
      this.imageUrl,
      this.year,
      this.mileage,
      this.isLiked
});

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      guarantee: json["Guarantee"]??-1,
      mark: json["mark"],
      category: json["category"]??"",
      id: json['id']??"",
      name: json['name']??"",
      price: json['price']??-1,
      imageUrl: json['imageUrl']??"",
      year: json['year']??-1,
      mileage: json['mileage']??-1,
      isLiked: json['isLiked']??false,
      user:json['user'] != null
          ? User.fromJson(json['user'])
          : null, 
        attributes: json['attributes'] != null
          ? CarAttributes.fromJson(json['attributes'])
          : null,



    );
  }

}


