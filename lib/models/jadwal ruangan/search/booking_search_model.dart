import '../../member_model.dart';

class BookingSearchModel {
  int id;
  int memberId;
  int roomId;
  String bookingDate;
  String bookingStartDate;
  String bookingEndDate;
  String attachment;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  String name;
  String nip;
  String phone;
  String description;
  String status;
  String participantType;
  int participantInternal;
  int participantExternal;
  int divisionId;
  MemberModel member;

  BookingSearchModel({
    this.id,
    this.memberId,
    this.roomId,
    this.bookingDate,
    this.bookingStartDate,
    this.bookingEndDate,
    this.attachment,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
    this.nip,
    this.phone,
    this.description,
    this.status,
    this.participantType,
    this.participantInternal,
    this.participantExternal,
    this.divisionId,
    this.member,
  });

  factory BookingSearchModel.fromJson(Map<String, dynamic> json) {
    return BookingSearchModel(
      id: json['id'],
      memberId: json['member_id'],
      roomId: json['room_id'],
      bookingDate: json['booking_date'],
      bookingStartDate: json['booking_start_date'],
      bookingEndDate: json['booking_end_date'],
      attachment: json['attachment'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
      name: json['name'],
      nip: json['nip'],
      phone: json['phone'],
      description: json['description'],
      status: json['status'],
      participantType: json['participant_type'],
      participantInternal: json['participant_internal'],
      participantExternal: json['participant_external'],
      divisionId: json['division_id'],
      member: MemberModel.fromJson(json['member']),
    );
  }
}