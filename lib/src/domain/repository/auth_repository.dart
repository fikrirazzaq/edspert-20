import '../../data/model/model.dart';
import '../entity/user_response_entity.dart';

/// Interface
abstract class AuthRepository {
  bool isSignedInWithGoogle();

  String? getCurrentSignedInEmail();

  Future<UserDataEntity?> getUserByEmail({required String email});

  Future<bool> registerUser({required RegisterUserRequestModel request});

  Future<bool> isUserRegistered();

  Future<bool> signOut();
}
