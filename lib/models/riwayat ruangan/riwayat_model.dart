import 'package:simaru/models/riwayat%20ruangan/room_riwayat_model.dart';

class RiwayatModel {
  int id;
  int idMember;
  int idRoom;
  String bookingDate;
  String bookingStartDate;
  String bookingEndDate;
  String attachment;
  String name;
  String nip;
  String phone;
  String description;
  String status;
  String participantType;
  int participantInternal;
  int participantExternal;
  int devisi;
  RoomRiwayatModel room;

  RiwayatModel({
    this.id,
    this.idMember,
    this.idRoom,
    this.bookingDate,
    this.bookingStartDate,
    this.bookingEndDate,
    this.attachment,
    this.name,
    this.nip,
    this.phone,
    this.description,
    this.status,
    this.participantInternal,
    this.participantType,
    this.participantExternal,
    this.devisi,
    this.room,
  });

  RiwayatModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idRoom = json['room_id'];
    idMember = json['member_id'];
    bookingDate = json['booking_date'];
    bookingStartDate = json['booking_start_date'];
    bookingEndDate = json['booking_end_date'];
    attachment = json['attachment'];
    name = json['name'];
    nip = json['nip'];
    phone = json['phone'];
    description = json['description'];
    status = json['status'];
    participantType = json['participant_type'];
    participantInternal = json['participant_internal'];
    participantExternal = json['participant_external'];
    room = RoomRiwayatModel.fromJson(json['room']);
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
      'participant_type': participantType,
      'participant_internal': participantType,
      'participant_external': participantType,
      'attachment': attachment,
      'description': description,
      'division_id': devisi,
    };
  }
}
