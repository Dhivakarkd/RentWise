import 'package:flutter/material.dart';
import '../data/models/tenant.dart';
import '../widgets/tenant_card.dart';
import 'tenant_details_screen.dart';

class DashboardScreen extends StatelessWidget {
  // Dummy data for tenants
  final List<Tenant> tenants = [
    Tenant(
      name: 'John Doe',
      floorName: '2nd Floor',
      house: 'A1',
      electricityBillRate: 10.5,
      depositAmount: 50000.0,
      houseRentAmount: 15000.0,
      electricityReadings: [],
    ),
    Tenant(
      name: 'Jane Smith',
      floorName: '3rd Floor',
      house: 'B2',
      electricityBillRate: 12.0,
      depositAmount: 45000.0,
      houseRentAmount: 16000.0,
      electricityReadings: [],
    ),
    // Add more dummy tenants here if needed
  ];

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
              // Navigate to tenant details screen when a card is tapped
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
    );
  }
}
