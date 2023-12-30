import 'package:simaru/models/booking_model.dart';
import 'package:simaru/models/jadwal%20ruangan/search/details/details_facility_model.dart';

class SearchModelDetails {
  int id;
  String name;
  int floor;
  int capacity;
  String image;
  List<DetailsFacilityModel> facilities;
  List<BookingModel> bookings;

  SearchModelDetails({
    this.id,
    this.name,
    this.floor,
    this.capacity,
    this.image,
    this.bookings,
    this.facilities,
  });

  SearchModelDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    floor = json['floor'];
    image = json['image'];
    capacity = json['capacity'];
    if (json['room_facilities'] != null) {
      facilities = List<DetailsFacilityModel>.from(json['room_facilities']
          .map((roomfacility) => DetailsFacilityModel.fromJson(roomfacility)));
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
    if (facilities != null) {
      data['room_facilities'] =
          this.facilities.map((facility) => facility.toJson()).toList();
    }
    if (bookings != null) {
      data['bookings'] =
          bookings.map((booking) => booking.toJson()).toList();
    }
    return data;
  }
}
