import 'package:learning/src/domain/repository/auth_repository.dart';

import '../../../data/model/register_user_request_model.dart';

class RegisterUserUsecase {
  final AuthRepository repository;

  const RegisterUserUsecase({required this.repository});

  Future<bool> call(RegisterUserRequestModel request) async => await repository.registerUser(request: request);
}
