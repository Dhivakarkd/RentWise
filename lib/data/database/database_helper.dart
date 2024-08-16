import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/tenant.dart';
import '../models/electricity_reading.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();

  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('rentwise.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDB,
    );
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE tenants (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name TEXT NOT NULL,
      floorName TEXT NOT NULL,
      house TEXT NOT NULL,
      electricityBillRate REAL NOT NULL,
      depositAmount REAL NOT NULL,
      houseRentAmount REAL NOT NULL
    )
    ''');

    await db.execute('''
    CREATE TABLE electricity_readings (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      tenantId INTEGER NOT NULL,
      readingDate TEXT NOT NULL,
      readingValue REAL NOT NULL,
      FOREIGN KEY (tenantId) REFERENCES tenants (id)
    )
    ''');
  }

  // Insert a tenant
  Future<int> insertTenant(Tenant tenant) async {
    final db = await database;
    return await db.insert('tenants', tenant.toMap());
  }

  // Get all tenants
  Future<List<Tenant>> getAllTenants() async {
    final db = await database;
    final maps = await db.query('tenants');
    return maps.map((map) => Tenant.fromMap(map)).toList();
  }

  // Get a single tenant by ID
  Future<Tenant?> getTenant(int id) async {
    final db = await database;
    final maps = await db.query(
      'tenants',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return Tenant.fromMap(maps.first);
    }
    return null;
  }

  // Update a tenant
  Future<int> updateTenant(Tenant tenant) async {
    final db = await database;
    return await db.update(
      'tenants',
      tenant.toMap(),
      where: 'id = ?',
      whereArgs: [tenant.id],
    );
  }

  // Delete a tenant
  Future<int> deleteTenant(int id) async {
    final db = await database;
    // Also delete associated electricity readings
    await db.delete(
      'electricity_readings',
      where: 'tenantId = ?',
      whereArgs: [id],
    );
    return await db.delete(
      'tenants',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Insert an electricity reading
  Future<int> insertElectricityReading(ElectricityReading reading) async {
    final db = await database;
    return await db.insert('electricity_readings', reading.toMap());
  }

  // Get all electricity readings for a tenant
  Future<List<ElectricityReading>> getElectricityReadings(int tenantId) async {
    final db = await database;
    final maps = await db.query(
      'electricity_readings',
      where: 'tenantId = ?',
      whereArgs: [tenantId],
    );
    return maps.map((map) => ElectricityReading.fromMap(map)).toList();
  }
}
