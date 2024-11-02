import 'package:task_ui_challenge/app/configurations/enums/feature_availabilty.dart';

class CarAttributes {
  final String? exteriorColor;
  final String? interiorColor;
  final String? seatType;
  final FeatureAvailability? hasSunroof;
  final FeatureAvailability? hasRearCamera;
  final String? sensors;
  final int? cylinder;
  final String? transmission;

  CarAttributes({
     this.exteriorColor,
     this.interiorColor,
     this.seatType,
     this.hasSunroof,
     this.hasRearCamera,
     this.sensors,
     this.cylinder,
     this.transmission,
  });

  static FeatureAvailability _availabilityFromBool(bool? value) {
    return value == true ? FeatureAvailability.available : FeatureAvailability.unavailable;
  }

  factory CarAttributes.fromJson(Map<String, dynamic> json) {
    return CarAttributes(
      exteriorColor: json['exteriorColor'] ?? '',
      interiorColor: json['interiorColor'] ?? '',
      seatType: json['seatType'] ?? '',
      hasSunroof: _availabilityFromBool(json['hasSunroof']),
      hasRearCamera: _availabilityFromBool(json['hasRearCamera']),
      sensors: json['sensors'] ?? '',
      cylinder: json['cylinder'] ?? -1,
      transmission: json['transmission'] ?? '',
    );
  }
}