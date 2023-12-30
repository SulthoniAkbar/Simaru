import 'package:simaru/models/riwayat%20ruangan/riwayat_model.dart';
import 'package:simaru/services/riwayat_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RiwayatProvider with ChangeNotifier {
  List<RiwayatModel> _notifs = [];
  List<RiwayatModel> get notif => _notifs;
  String _error;
  String get error => _error;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  set notif(List<RiwayatModel> notif) {
    _notifs = notif;
    notifyListeners();
  }

  Future<void> notifacation(String token) async {
    try {
      List<RiwayatModel> notif = await RiwayatService().notification(token);
      _notifs = notif;
      notifyListeners(); // Add this line to notify listeners about the data change
    } catch (e) {
      print(e);
    }
  }
}
