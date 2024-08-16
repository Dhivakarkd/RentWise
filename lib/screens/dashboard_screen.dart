import 'package:flutter/material.dart';
import '../data/models/tenant.dart';
import '../widgets/tenant_card.dart';
import 'tenant_details_screen.dart';
import 'add_edit_tenant_screen.dart';
import '../data/database/database_helper.dart';  // Import the DatabaseHelper

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final DatabaseHelper dbHelper = DatabaseHelper.instance;
  List<Tenant> tenants = [];

  @override
  void initState() {
    super.initState();
    _loadTenants();
  }

  // Load tenants from the database
  void _loadTenants() async {
    final data = await dbHelper.getAllTenants();
    setState(() {
      tenants = data;
    });
  }

  // Add a new tenant and reload the list
  void _addTenant(Tenant tenant) async {
    await dbHelper.insertTenant(tenant);
    _loadTenants();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RentWise Dashboard'),
      ),
      body: ListView.builder(
        itemCount: tenants.length,
        itemBuilder: (context, index) {
          return TenantCard(
            tenant: tenants[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TenantDetailsScreen(tenant: tenants[index]),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTenant = await Navigator.push<Tenant>(
            context,
            MaterialPageRoute(
              builder: (context) => AddEditTenantScreen(),
            ),
          );
          if (newTenant != null) {
            _addTenant(newTenant);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
