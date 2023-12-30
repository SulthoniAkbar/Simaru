class MediasModel {
  int id;
  String attachment;

  MediasModel({
    this.id,
    this.attachment,
  });

  MediasModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    attachment = json['attachment'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'attachment': attachment,
    };
  }
}
