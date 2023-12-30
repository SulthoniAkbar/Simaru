import 'package:simaru/models/facilty_model.dart';

class FacilitiesModel {
  int id;
  int quantity;
  FacilityModel facility;

  FacilitiesModel({
    this.id,
    this.quantity,
    this.facility,
  });

  FacilitiesModel.fromJson(Map<String, dynamic> json) {
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
