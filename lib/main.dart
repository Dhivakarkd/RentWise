import 'package:flutter/material.dart';
import 'screens/dashboard_screen.dart';

void main() {
  runApp(RentWiseApp());
}

class RentWiseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RentWise',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DashboardScreen(),
    );
  }
}
