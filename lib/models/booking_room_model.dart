class BookingRoomModel {
  int id;
  int idRoom;
  int idMember;
  DateTime bookingDate;
  String status;
  String bookingStartDate;
  String bookingEndDate;
  String name;
  String nip;
  String phone;
  String description;
  String participantInternal;
  String participantExternal;
  int devisi;
  String participanttype;
  String attachment;

  BookingRoomModel({
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
    this.participanttype,
    this.description,
    this.participantInternal,
    this.participantExternal,
    this.devisi,
    this.attachment,
  });

  BookingRoomModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idRoom = json['room_id'];
    idMember = json['member_id'];
    bookingStartDate = json['booking_start_date'];
    bookingEndDate = json['booking_end_date'];
    name = json['name'];
    nip = json['nip'];
    phone = json['phone'];
    status = json['status'];
    participanttype = json['participant_type'];
    description = json['description'];
    participantInternal = json['participant_internal'];
    participantExternal = json['participant_external'];
    devisi = json['division_id'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'nip': nip,
      'phone': phone,
      'booking_start_date': bookingStartDate,
      'booking_end_date': bookingEndDate,
      'participant_internal': participantInternal,
      'participant_external': participantExternal,
      'status': status,
      'description': description,
      'member_id': idMember,
      'participant_type': participanttype,
      'division_id': devisi,
      'attachment': attachment,
    };
  }
}
