import 'package:simaru/models/facilty_model.dart';

class DetailsFacilityModel {
  int id;
  int quantity;
  FacilityModel facility;

  DetailsFacilityModel({
    this.id,
    this.quantity,
    this.facility,
  });

  DetailsFacilityModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    facility = FacilityModel.fromJson(json['facility']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity': quantity,
      'facility': facility.toJson(),
    };
  }
}
