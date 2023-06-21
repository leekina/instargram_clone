class IUser {
  String? uid;
  String? nicname;
  String? thumbnail;
  String? description;

  IUser({
    this.uid,
    this.nicname,
    this.thumbnail,
    this.description,
  });

  factory IUser.fromJson(Map<String, dynamic> json) {
    return IUser(
      uid: json['uid'] == null ? '' : json['uid'] as String,
      nicname: json['nicname'] == null ? '' : json['nicname'] as String,
      thumbnail: json['thumbnail'] == null ? '' : json['thumbnail'] as String,
      description:
          json['description'] == null ? '' : json['description'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'nicname': nicname,
      'thumbnail': thumbnail,
      'description': description,
    };
  }

  IUser copyWith({
    String? uid,
    String? nicname,
    String? thumbnail,
    String? description,
  }) {
    return IUser(
      uid: uid ?? this.uid,
      nicname: nicname ?? this.nicname,
      thumbnail: thumbnail ?? this.thumbnail,
      description: description ?? this.description,
    );
  }
}
