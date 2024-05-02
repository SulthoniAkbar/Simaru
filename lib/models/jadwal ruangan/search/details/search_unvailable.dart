class RoomBooking {
  int id;
  int memberId;
  int roomId;
  String bookingDate;
  String bookingStartDate;
  String bookingEndDate;
  String attachment;
  DateTime createdAt;
  DateTime updatedAt;
  String name;
  String nip;
  String phone;
  String description;
  String status;
  String participantType;
  int participantInternal;
  int participantExternal;
  int divisionId;
  Member member;

  RoomBooking({
      this.id,
      this.memberId,
      this.roomId,
      this.bookingDate,
      this.bookingStartDate,
      this.bookingEndDate,
      this.attachment,
      this.createdAt,
      this.updatedAt,
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

  factory RoomBooking.fromJson(Map<String, dynamic> json) {
    return RoomBooking(
      id: json['id'],
      memberId: json['member_id'],
      roomId: json['room_id'],
      bookingDate: json['booking_date'],
      bookingStartDate: json['booking_start_date'],
      bookingEndDate: json['booking_end_date'],
      attachment: json['attachment'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      name: json['name'],
      nip: json['nip'],
      phone: json['phone'],
      description: json['description'],
      status: json['status'],
      participantType: json['participant_type'],
      participantInternal: json['participant_internal'],
      participantExternal: json['participant_external'],
      divisionId: json['division_id'],
      member: Member.fromJson(json['member']),
    );
  }
}

class Member {
  int id;
  int userId;
  int divisionId;
  String name;
  String gender;
  String address;
  String nip;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Member({
      this.id,
      this.userId,
      this.divisionId,
      this.name,
      this.gender,
      this.address,
      this.nip,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
  });

  factory Member.fromJson(Map<String, dynamic> json) {
    return Member(
      id: json['id'],
      userId: json['user_id'],
      divisionId: json['division_id'],
      name: json['name'],
      gender: json['gender'],
      address: json['address'],
      nip: json['nip'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'],
    );
  }
}

class RoomData {
  String message;
  List<Room> data;

  RoomData({  this.message,   this.data});

  factory RoomData.fromJson(Map<String, dynamic> json) {
    return RoomData(
      message: json['message'],
      data: List<Room>.from(json['data'].map((x) => Room.fromJson(x))),
    );
  }
}

class Room {
  int id;
  String name;
  int floor;
  int capacity;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;
  List<Feedback> feedbacks;
  List<RoomFacility> roomFacilities;
  List<RoomBooking> bookings;

  Room({
      this.id,
      this.name,
      this.floor,
      this.capacity,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.feedbacks,
      this.roomFacilities,
      this.bookings,
  });

  factory Room.fromJson(Map<String, dynamic> json) {
    return Room(
      id: json['id'],
      name: json['name'],
      floor: json['floor'],
      capacity: json['capacity'],
      image: json['image'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'],
      feedbacks: List<Feedback>.from(json['feedbacks'].map((x) => Feedback.fromJson(x))),
      roomFacilities: List<RoomFacility>.from(json['room_facilities'].map((x) => RoomFacility.fromJson(x))),
      bookings: List<RoomBooking>.from(json['bookings'].map((x) => RoomBooking.fromJson(x))),
    );
  }
}

class Feedback {
  int id;
  int memberId;
  int roomId;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Feedback({
      this.id,
      this.memberId,
      this.roomId,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
  });

  factory Feedback.fromJson(Map<String, dynamic> json) {
    return Feedback(
      id: json['id'],
      memberId: json['member_id'],
      roomId: json['room_id'],
      description: json['description'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'],
    );
  }
}

class RoomFacility {
  int roomId;
  int facilityId;
  int id;
  int quantity;
  Facility facility;

  RoomFacility({
      this.roomId,
      this.facilityId,
      this.id,
      this.quantity,
      this.facility,
  });

  factory RoomFacility.fromJson(Map<String, dynamic> json) {
    return RoomFacility(
      roomId: json['room_id'],
      facilityId: json['facility_id'],
      id: json['id'],
      quantity: json['quantity'],
      facility: Facility.fromJson(json['facility']),
    );
  }
}

class Facility {
  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  Facility({
      this.id,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
  });

  factory Facility.fromJson(Map<String, dynamic> json) {
    return Facility(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      deletedAt: json['deleted_at'],
    );
  }
}
