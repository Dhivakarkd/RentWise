import 'package:flutter/material.dart';
import '../data/models/tenant.dart';

class AddEditTenantScreen extends StatefulWidget {
  final Tenant? tenant;

  AddEditTenantScreen({this.tenant});

  @override
  _AddEditTenantScreenState createState() => _AddEditTenantScreenState();
}

class _AddEditTenantScreenState extends State<AddEditTenantScreen> {
  final _formKey = GlobalKey<FormState>();

  late String name;
  late String floorName;
  late String house;
  late double electricityBillRate;
  late double depositAmount;
  late double houseRentAmount;

  @override
  void initState() {
    super.initState();
    name = widget.tenant?.name ?? '';
    floorName = widget.tenant?.floorName ?? '';
    house = widget.tenant?.house ?? '';
    electricityBillRate = widget.tenant?.electricityBillRate ?? 0.0;
    depositAmount = widget.tenant?.depositAmount ?? 0.0;
    houseRentAmount = widget.tenant?.houseRentAmount ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.tenant == null ? 'Add Tenant' : 'Edit Tenant'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: name,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the tenant\'s name';
                  }
                  return null;
                },
                onSaved: (value) => name = value!,
              ),
              TextFormField(
                initialValue: floorName,
                decoration: InputDecoration(labelText: 'Floor Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the floor name';
                  }
                  return null;
                },
                onSaved: (value) => floorName = value!,
              ),
              TextFormField(
                initialValue: house,
                decoration: InputDecoration(labelText: 'House'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the house';
                  }
                  return null;
                },
                onSaved: (value) => house = value!,
              ),
              TextFormField(
                initialValue: electricityBillRate.toString(),
                decoration: InputDecoration(labelText: 'Electricity Bill Rate'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the electricity bill rate';
                  }
                  return null;
                },
                onSaved: (value) => electricityBillRate = double.parse(value!),
              ),
              TextFormField(
                initialValue: depositAmount.toString(),
                decoration: InputDecoration(labelText: 'Deposit Amount'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the deposit amount';
                  }
                  return null;
                },
                onSaved: (value) => depositAmount = double.parse(value!),
              ),
              TextFormField(
                initialValue: houseRentAmount.toString(),
                decoration: InputDecoration(labelText: 'House Rent Amount'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the house rent amount';
                  }
                  return null;
                },
                onSaved: (value) => houseRentAmount = double.parse(value!),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final tenant = Tenant(
                      name: name,
                      floorName: floorName,
                      house: house,
                      electricityBillRate: electricityBillRate,
                      depositAmount: depositAmount,
                      houseRentAmount: houseRentAmount,
                      electricityReadings: [],
                    );
                    Navigator.pop(context, tenant);
                  }
                },
                child: Text(widget.tenant == null ? 'Add Tenant' : 'Save Changes'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
