import 'electricity_reading.dart';

class Tenant {
  int? id;  // Nullable to handle cases where the ID is not set (e.g., before saving to the database)
  String name;
  String floorName;
  String house;
  double electricityBillRate;
  double depositAmount;
  double houseRentAmount;
  List<ElectricityReading> electricityReadings;

  Tenant({
    this.id,
    required this.name,
    required this.floorName,
    required this.house,
    required this.electricityBillRate,
    required this.depositAmount,
    required this.houseRentAmount,
    required this.electricityReadings,
  });

  // Convert a Tenant object into a Map object
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'floorName': floorName,
      'house': house,
      'electricityBillRate': electricityBillRate,
      'depositAmount': depositAmount,
      'houseRentAmount': houseRentAmount,
    };
  }

  // Extract a Tenant object from a Map object
  factory Tenant.fromMap(Map<String, dynamic> map) {
    return Tenant(
      id: map['id'],
      name: map['name'],
      floorName: map['floorName'],
      house: map['house'],
      electricityBillRate: map['electricityBillRate'],
      depositAmount: map['depositAmount'],
      houseRentAmount: map['houseRentAmount'],
      electricityReadings: [],  // Fill this as needed when fetching readings
    );
  }
}
