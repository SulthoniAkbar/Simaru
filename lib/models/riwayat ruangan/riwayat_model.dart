import 'package:simaru/models/riwayat%20ruangan/room_riwayat_model.dart';

class RiwayatModel {
  int id;
  String idRoom;
  String idMember;
  String attachment;
  String bookingDate;
  String bookingStartDate;
  String bookingEndDate;
  String name;
  String nip;
  String status;
  String phone;
  String description;
  String participant;
  String devisi;
  RoomRiwayatModel room;

  RiwayatModel({
    this.id,
    this.idRoom,
    this.idMember,
    this.bookingDate,
    this.bookingEndDate,
    this.bookingStartDate,
    this.name,
    this.nip,
    this.status,
    this.phone,
    this.description,
    this.participant,
    this.devisi,
    this.room,
    this.attachment,
  });

  RiwayatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idRoom = json['room_id'];
    idMember = json['member_id'];
    bookingDate = json['booking_date'];
    bookingStartDate = json['booking_start_date'];
    bookingEndDate = json['booking_end_date'];
    name = json['name'];
    nip = json['nip'];
    status = json['status'];
    phone = json['phone'];
    description = json['description'];
    participant = json['participant'];
    room = RoomRiwayatModel.fromJson(json['room']);
    attachment = json['attachment'];
    devisi = json['division_id'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': room,
      'nip': nip,
      'phone': phone,
      'status': status,
      'booking_date': bookingDate,
      'booking_start_date': bookingStartDate,
      'booking_end_date': bookingEndDate,
      'participant': participant,
      'attachment': attachment,
      'description': description,
      'division_id': devisi,
    };
  }
}
