// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'models.dart';

class UserModel {
  final String? username;
  final String? email;
  final String? uid;
  final String? photoProfile;
  final String? walletId;
  final bool? admin;

  UserModel({
    this.username,
    this.email,
    this.uid,
    this.photoProfile,
    this.walletId,
    this.admin,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'uid': uid,
      'photoProfile': photoProfile,
      'walletId': walletId,
      'admin': admin,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      username: map['username'] != null ? map['username'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      uid: map['uid'] != null ? map['uid'] as String : null,
      photoProfile:
          map['photoProfile'] != null ? map['photoProfile'] as String : null,
      walletId: map['walletId'] != null ? map['walletId'] as String : null,
      admin: map['admin'] != null ? map['admin'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  UserModel copyWith({
    String? username,
    String? email,
    String? uid,
    String? photoProfile,
    String? walletId,
    bool? admin,
  }) {
    return UserModel(
      username: username ?? this.username,
      email: email ?? this.email,
      uid: uid ?? this.uid,
      photoProfile: photoProfile ?? this.photoProfile,
      walletId: walletId ?? this.walletId,
      admin: admin ?? this.admin,
    );
  }
}
