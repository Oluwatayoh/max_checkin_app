import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:max_checkin/models/vehicle_model';

class HomeViewModel with ChangeNotifier {
  List<Vehicle>? _vehicles;
  List<Vehicle> get vehicles => _vehicles!;

  List<Vehicle>? _checkedVehicles;
  List<Vehicle> get checkedVehicles => _checkedVehicles!;
  List<Vehicle>? _unCheckedVehicles;
  List<Vehicle> get unCheckedVehicles => _unCheckedVehicles!;

  Future<String> loadJsonData() async {
    return await rootBundle.loadString('assets/data.json');
  }

  getDataFormJSON() async {
    var jsonData = await loadJsonData();
    Iterable l = json.decode(jsonData);
    List<Vehicle> data = (json.decode(jsonData) as List)
        .map((e) => Vehicle.fromJson(e))
        .toList();
    _vehicles = data;
    _checkedVehicles = _vehicles?.where((v) => v.isCheckedIn == true).toList();
    _unCheckedVehicles =
        _vehicles?.where((v) => v.isCheckedIn == false).toList();
    notifyListeners();
  }

  HomeViewModel() {
    getDataFormJSON();
  }
}
