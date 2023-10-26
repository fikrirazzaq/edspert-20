import 'package:learning/src/domain/repository/auth_repository.dart';

import '../../entity/user_response_entity.dart';

class GetUserUsecase {
  final AuthRepository repository;

  const GetUserUsecase({required this.repository});

  Future<UserDataEntity?> call(String email) async => await repository.getUserByEmail(email: email);
}
