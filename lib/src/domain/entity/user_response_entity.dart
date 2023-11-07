import 'dart:convert';

class UserResponseEntity {
  final int status;
  final String message;
  final UserDataEntity data;

  UserResponseEntity({
    required this.status,
    required this.message,
    required this.data,
  });
}

class UserDataEntity {
  final String iduser;
  final String userName;
  final String userEmail;
  final String userFoto;
  final String userAsalSekolah;
  final String dateCreate;
  final String jenjang;
  final String userGender;
  final String userStatus;

  UserDataEntity({
    required this.iduser,
    required this.userName,
    required this.userEmail,
    required this.userFoto,
    required this.userAsalSekolah,
    required this.dateCreate,
    required this.jenjang,
    required this.userGender,
    required this.userStatus,
  });

  Map<String, dynamic> toMap() {
    return {
      'iduser': iduser,
      'userName': userName,
      'userEmail': userEmail,
      'userFoto': userFoto,
      'userAsalSekolah': userAsalSekolah,
      'dateCreate': dateCreate,
      'jenjang': jenjang,
      'userGender': userGender,
      'userStatus': userStatus,
    };
  }

  factory UserDataEntity.fromMap(Map<String, dynamic> map) {
    return UserDataEntity(
      iduser: map['iduser'] ?? '',
      userName: map['userName'] ?? '',
      userEmail: map['userEmail'] ?? '',
      userFoto: map['userFoto'] ?? '',
      userAsalSekolah: map['userAsalSekolah'] ?? '',
      dateCreate: map['dateCreate'] ?? '',
      jenjang: map['jenjang'] ?? '',
      userGender: map['userGender'] ?? '',
      userStatus: map['userStatus'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDataEntity.fromJson(String source) => UserDataEntity.fromMap(json.decode(source));
}
