import 'package:flutter/material.dart';
import '../data/models/tenant.dart';

class TenantDetailsScreen extends StatelessWidget {
  final Tenant tenant;

  TenantDetailsScreen({required this.tenant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tenant.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Floor: ${tenant.floorName}', style: TextStyle(fontSize: 18)),
            Text('House: ${tenant.house}', style: TextStyle(fontSize: 18)),
            Text('Electricity Bill Rate: ₹${tenant.electricityBillRate}', style: TextStyle(fontSize: 18)),
            Text('Deposit Amount: ₹${tenant.depositAmount}', style: TextStyle(fontSize: 18)),
            Text('House Rent Amount: ₹${tenant.houseRentAmount}', style: TextStyle(fontSize: 18)),
            // You can add more details here
          ],
        ),
      ),
    );
  }
}
