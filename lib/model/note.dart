/// notes_id : "24"
/// notes_title : "darc"
/// notes_content : "darc content"
/// notes_image : ""
/// notes_user : "17"

class Note {
  Note({
    this.notesId,
    this.notesTitle,
    this.notesContent,
    this.notesImage,
    this.notesUser,
  });

  Note.fromJson(Map json) {
    notesId = json['notes_id'];
    notesTitle = json['notes_title'];
    notesContent = json['notes_content'];
    notesImage = json['notes_image'];
    notesUser = json['notes_user'];
  }

  String? notesId;
  String? notesTitle;
  String? notesContent;
  String? notesImage;
  String? notesUser;

  Note copyWith({
    String? notesId,
    String? notesTitle,
    String? notesContent,
    String? notesImage,
    String? notesUser,
  }) =>
      Note(
        notesId: notesId ?? this.notesId,
        notesTitle: notesTitle ?? this.notesTitle,
        notesContent: notesContent ?? this.notesContent,
        notesImage: notesImage ?? this.notesImage,
        notesUser: notesUser ?? this.notesUser,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['notes_id'] = notesId;
    map['notes_title'] = notesTitle;
    map['notes_content'] = notesContent;
    map['notes_image'] = notesImage;
    map['notes_user'] = notesUser;
    return map;
  }
}
