import 'package:flutter/foundation.dart';

import '../../domain/entity/user_response_entity.dart';
import '../../domain/repository/auth_repository.dart';
import '../datasource/remote/auth_remote_datasource.dart';
import '../model/model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDatasource remoteDatasource;

  const AuthRepositoryImpl({required this.remoteDatasource});

  @override
  String? getCurrentSignedInEmail() {
    return '';
  }

  @override
  Future<UserDataEntity?> getUserByEmail({required String email}) async {
    UserResponseModel? userModel = await remoteDatasource.getUserByEmail(email: email);
    if (userModel != null) {
      final data = UserDataEntity(
        iduser: userModel.data?.iduser ?? '',
        userName: userModel.data?.userName ?? '',
        userEmail: userModel.data?.userEmail ?? '',
        userFoto: userModel.data?.userFoto ?? '',
        userAsalSekolah: userModel.data?.userAsalSekolah ?? '',
        dateCreate: userModel.data?.dateCreate ?? '',
        jenjang: userModel.data?.jenjang ?? '',
        userGender: userModel.data?.userGender ?? '',
        userStatus: userModel.data?.userStatus ?? '',
      );
      return data;
    }
    return null;
  }

  @override
  bool isSignedInWithGoogle() {
    return getCurrentSignedInEmail() != null;
  }

  @override
  Future<bool> isUserRegistered() async {
    return await getUserByEmail(email: getCurrentSignedInEmail() ?? '') != null;
  }

  @override
  Future<bool> registerUser({required RegisterUserRequestModel request}) async {
    final response = await remoteDatasource.registerUser(request: request);

    if (response.message == 'ok') {
      return true;
    }

    return false;
  }

  @override
  Future<bool> signOut() async {
    try {
      return true;
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Error signInWithGoogle: $e, $stackTrace');
      }
      return false;
    }
  }
}
