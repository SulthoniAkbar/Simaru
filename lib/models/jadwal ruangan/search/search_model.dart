import 'package:simaru/models/jadwal%20ruangan/search/search_facility.dart';

import 'booking_search_model.dart';

class SearchModel {
  int id;
  String name;
  int floor;
  int capacity;
  String image;
  List<BookingSearchModel> booking;
  List<SearchFacilitiesModel> facilities;

  SearchModel({
    this.id,
    this.name,
    this.floor,
    this.capacity,
    this.image,
    this.booking,
    this.facilities,
  });
  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      id: json['id'],
      name: json['name'],
      floor: json['floor'],
      capacity: json['capacity'],
      image: json['image'],
      facilities: json['room_facilities'] != null
          ? List<SearchFacilitiesModel>.from(
              json['room_facilities'].map(
                  (facilities) => SearchFacilitiesModel.fromJson(facilities)),
            )
          : [],
      booking: json['bookings'] != null
          ? List<BookingSearchModel>.from(
              json['bookings']
                  .map((bookings) => BookingSearchModel.fromJson(bookings)),
            )
          : [],
    );
  }
}
