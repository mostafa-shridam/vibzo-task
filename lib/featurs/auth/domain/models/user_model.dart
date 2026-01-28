class UserModel {
  String? id;
  String? name;
  String? email;
  String? phone;
  String? avatar;
  String? deviceId;
  String? createdAt;
  String? updatedAt;
  bool? isVerified;
  bool? isBlocked;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.avatar,
    this.deviceId,
    this.createdAt,
    this.updatedAt,
    this.isVerified,
    this.isBlocked,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      avatar: json['avatar'] as String?,
      deviceId: json['deviceId'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      isVerified: json['isVerified'] as bool?,
      isBlocked: json['isBlocked'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'avatar': avatar,
      'deviceId': deviceId,
      'createdAt': createdAt,
      'updatedAt': DateTime.now().toIso8601String(),
      'isVerified': isVerified,
      'isBlocked': isBlocked,
    };
  }

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phone,
    String? avatar,
    String? deviceId,
    String? createdAt,
    String? updatedAt,
    bool? isVerified,
    bool? isBlocked,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      avatar: avatar ?? this.avatar,
      deviceId: deviceId ?? this.deviceId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isVerified: isVerified ?? this.isVerified,
      isBlocked: isBlocked ?? this.isBlocked,
    );
  }
}
