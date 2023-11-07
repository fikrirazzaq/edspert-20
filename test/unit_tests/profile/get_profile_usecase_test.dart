import 'package:flutter_test/flutter_test.dart';
import 'package:learning/src/data/repository/profile_repository_impl.dart' show ProfileRepositoryImpl;
import 'package:learning/src/domain/entity/user_response_entity.dart';
import 'package:learning/src/domain/repository/profile_repository.dart';
import 'package:learning/src/domain/usecase/profile/get_profile_usecase.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_profile_usecase_test.mocks.dart';

@GenerateNiceMocks([MockSpec<ProfileRepositoryImpl>()])
void main() {
  late GetProfileUsecase getProfileUsecase;
  late ProfileRepository profileRepository;

  /// Arrange, setup/init usecase
  setUp(() {
    profileRepository = MockProfileRepositoryImpl();
    getProfileUsecase = GetProfileUsecase(repository: profileRepository);
  });

  UserDataEntity exampleSuccessData = UserDataEntity.fromMap({
    "iduser": "71091",
    "user_name": "Edufren",
    "user_email": "alitopan@widyaedu.com",
    "user_foto": "https://api.widyaedu.com/assets/uploads/avatar/5a57317764486c77636d396d6157786c_emptyprofile.png",
    "user_asal_sekolah": "SMA NEGERI 1 MEULABOH",
    "date_create": "2022-02-24 08:28:55",
    "jenjang": "SMA",
    "user_gender": "Laki-laki",
    "user_status": "verified",
    "kelas": "12"
  });

  /// Act
  test(
    'Get Profile',
    () async {
      /// Act(-ion)
      when(profileRepository.getProfile()).thenAnswer(
        (realInvocation) async => exampleSuccessData,
      );
      final result = await getProfileUsecase();

      /// Assert
      expect(result, exampleSuccessData);
      verify(await profileRepository.getProfile());
      verifyNoMoreInteractions(profileRepository);
    },
  );
}
