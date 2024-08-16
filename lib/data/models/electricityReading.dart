class ElectricityReading {
  final DateTime date;
  final int reading;

  ElectricityReading({
    required this.date,
    required this.reading,
  });

  // Convert an ElectricityReading object into a Map object for database storage
  Map<String, dynamic> toMap() {
    return {
      'date': date.toIso8601String(),
      'reading': reading,
    };
  }

  // Convert a Map object into an ElectricityReading object
  factory ElectricityReading.fromMap(Map<String, dynamic> map) {
    return ElectricityReading(
      date: DateTime.parse(map['date']),
      reading: map['reading'],
    );
  }
}
