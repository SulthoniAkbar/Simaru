import 'package:simaru/models/booking_model.dart';
import 'package:simaru/models/facilities_model.dart';
import 'package:simaru/models/facilty_model.dart';

class ScheduleModel {
  int id;
  String name;
  String floor;
  String capacity;
  String image;
  List<FacilitiesModel> facilities;
  List<BookingModel> bookings;

  ScheduleModel({
    this.id,
    this.name,
    this.floor,
    this.capacity,
    this.image,
    this.bookings,
    this.facilities,
  });

  ScheduleModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    floor = json['floor'];
    image = json['image'];
    capacity = json['capacity'];
    if (json['room_facilities'] != null) {
      facilities = List<FacilitiesModel>.from(json['room_facilities']
          .map((roomfacility) => FacilitiesModel.fromJson(roomfacility)));
    }

    if (json['bookings'] != null) {
      bookings = List<BookingModel>.from(
          json['bookings'].map((booking) => BookingModel.fromJson(booking)));
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['floor'] = this.floor;
    data['image'] = this.image;
    data['capacity'] = this.capacity;
    if (this.facilities != null) {
      data['room_facilities'] =
          this.facilities.map((facility) => facility.toJson()).toList();
    }
    if (this.bookings != null) {
      data['bookings'] =
          this.bookings.map((booking) => booking.toJson()).toList();
    }
    return data;
  }
}
