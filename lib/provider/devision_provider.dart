import 'package:simaru/models/devision_model.dart';
import 'package:simaru/services/devision_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DevisionProvider with ChangeNotifier {
  List<DevisionModel> _devisi = [];
  DevisionModel _selectedDevision;
  String _error;
  String get error => _error;

  final bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<DevisionModel> get devisi => _devisi;
  DevisionModel get selectedDevision => _selectedDevision;

  set selectedDevision(DevisionModel devision) {
    _selectedDevision = devision;
    notifyListeners();
  }

  Future<void> devision(String token) async {
    try {
      List<DevisionModel> devisi = await DevisionService().devisi(token);
      _devisi = devisi;
      notifyListeners(); // Add this line to notify listeners about the data change
    } catch (e) {
      print(e);
    }
  }
}
