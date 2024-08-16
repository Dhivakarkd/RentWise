import 'electricityReading.dart';

class Tenant {
  final String name;
  final String floorName;
  final String house;
  final double electricityBillRate;
  final double depositAmount;
  final double houseRentAmount;
  List<ElectricityReading> electricityReadings;

  Tenant({
    required this.name,
    required this.floorName,
    required this.house,
    required this.electricityBillRate,
    required this.depositAmount,
    required this.houseRentAmount,
    this.electricityReadings = const [],
  });

  // Convert a Tenant object into a Map object for database storage
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'floorName': floorName,
      'house': house,
      'electricityBillRate': electricityBillRate,
      'depositAmount': depositAmount,
      'houseRentAmount': houseRentAmount,
      'electricityReadings': electricityReadings.map((e) => e.toMap()).toList(),
    };
  }

  // Convert a Map object into a Tenant object
  factory Tenant.fromMap(Map<String, dynamic> map) {
    return Tenant(
      name: map['name'],
      floorName: map['floorName'],
      house: map['house'],
      electricityBillRate: map['electricityBillRate'],
      depositAmount: map['depositAmount'],
      houseRentAmount: map['houseRentAmount'],
      electricityReadings: (map['electricityReadings'] as List)
          .map((e) => ElectricityReading.fromMap(e))
          .toList(),
    );
  }
}
