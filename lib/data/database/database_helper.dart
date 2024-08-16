import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/tenant.dart';
import '../models/electricity_reading.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'rental_management.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tenants(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        floorName TEXT,
        house TEXT,
        electricityBillRate REAL,
        depositAmount REAL,
        houseRentAmount REAL
      )
      ''');

    await db.execute('''
      CREATE TABLE electricity_readings(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        tenantId INTEGER,
        date TEXT,
        reading INTEGER,
        FOREIGN KEY (tenantId) REFERENCES tenants (id)
      )
      ''');
  }

  Future<int> insertTenant(Tenant tenant) async {
    final db = await database;
    int tenantId = await db.insert('tenants', tenant.toMap());
    // Insert electricity readings
    for (var reading in tenant.electricityReadings) {
      await insertElectricityReading(tenantId, reading);
    }
    return tenantId;
  }

  Future<void> insertElectricityReading(
      int tenantId, ElectricityReading reading) async {
    final db = await database;
    await db.insert(
      'electricity_readings',
      {
        'tenantId': tenantId,
        'date': reading.date.toIso8601String(),
        'reading': reading.reading,
      },
    );
  }

  Future<List<Tenant>> getTenants() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('tenants');

    List<Tenant> tenants = [];
    for (var map in maps) {
      final List<Map<String, dynamic>> readingMaps = await db.query(
        'electricity_readings',
        where: 'tenantId = ?',
        whereArgs: [map['id']],
      );

      List<ElectricityReading> readings = readingMaps.map((rm) {
        return ElectricityReading.fromMap(rm);
      }).toList();

      Tenant tenant = Tenant.fromMap(map);
      tenant.electricityReadings = readings;
      tenants.add(tenant);
    }

    return tenants;
  }

  Future<int> updateTenant(Tenant tenant) async {
    final db = await database;
    return await db.update(
      'tenants',
      tenant.toMap(),
      where: 'id = ?',
      whereArgs: [tenant.id],
    );
  }

  Future<void> deleteTenant(int id) async {
  final db = await database;
  await db.delete(
    'tenants',
    where: 'id = ?',
    whereArgs: [id],
  );
  await db.delete(
    'electricity_readings',
    where: 'tenantId = ?',
    whereArgs: [id],
  );
}

}
