import 'package:flutter/material.dart';
import '../data/models/tenant.dart';

class TenantCard extends StatelessWidget {
  final Tenant tenant;
  final VoidCallback onTap;

  TenantCard({required this.tenant, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        title: Text(tenant.name),
        subtitle: Text('${tenant.floorName} - ${tenant.house}'),
        trailing: Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }
}
