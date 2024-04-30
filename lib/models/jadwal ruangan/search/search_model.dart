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

  // SearchModel.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   name = json['name'];
  //   floor = json['floor'];
  //   image = json['image'];
  //   capacity = json['capacity'];
  //   if (json['room_facilities'] != null) {
  //     facilities = List<SearchFacilitiesModel>.from(json['room_facilities']
  //         .map((roomfacility) => SearchFacilitiesModel.fromJson(roomfacility)));
  //   }

  //   if (json['bookings'] != null) {
  //     bookings = List<BookingSearchModel>.from(
  //         json['bookings'].map((booking) => BookingModel.fromJson(booking)));
  //   }
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = id;
  //   data['name'] = name;
  //   data['floor'] = floor;
  //   data['image'] = image;
  //   data['capacity'] = capacity;
  //   if (this.facilities != null) {
  //     data['room_facilities'] =
  //         this.facilities.map((facility) => facility.toJson()).toList();
  //   }
  //   if (this.bookings != null) {
  //     data['bookings'] =
  //         this.bookings.map((booking) => booking.toJson()).toList();
  //   }
  //   return data;
  // }
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
