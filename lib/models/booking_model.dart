import 'package:flutter/cupertino.dart';

class BookingModel {
  int id;
  String idRoom;
  String idMember;
  DateTime bookingDate;
  String bookingStartDate;
  String bookingEndDate;
  String name;
  String nip;
  String phone;
  String description;
  int participant;
  int devisi;

  BookingModel({
    this.id,
    this.idRoom,
    this.idMember,
    this.bookingDate,
    this.bookingEndDate,
    this.bookingStartDate,
    this.name,
    this.nip,
    this.phone,
    this.description,
    this.participant,
    this.devisi,
  });

  BookingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idRoom = json['room_id'];
    idMember = json['member_id'];
    bookingDate = DateTime.tryParse(json['booking_date']);
    bookingStartDate = json['booking_start_date'];
    bookingEndDate = json['booking_end_date'];
    name = json['name'];
    nip = json['nip'];
    phone = json['phone'];
    description = json['description'];
    participant = json['participant'];
    devisi = json['division_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nip': nip,
      'phone': phone,
      'booking_start_date': bookingStartDate,
      'booking_end_date': bookingEndDate,
      'participant': participant,
      'description': description,
      'member_id': idMember,
      'division_id': devisi,
    };
  }
}
