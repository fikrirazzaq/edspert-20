import 'package:learning/src/domain/repository/banner_repository.dart';

import '../../domain/entity/banner_response_entity.dart';
import '../datasource/remote/banner_remote_datasource.dart';
import '../model/banner_response_model.dart';

class BannerRepositoryImpl implements BannerRepository {
  final BannerRemoteDatasource remoteDatasource;

  const BannerRepositoryImpl({required this.remoteDatasource});

  @override
  Future<List<BannerDataEntity>> getBanners() async {
    BannerResponseModel bannerResponseModel = await remoteDatasource.getBanners();
    List<BannerDataModel>? bannerDataModel = bannerResponseModel.data;

    if (bannerDataModel != null) {
      /// Online
      List<BannerDataEntity> bannerData = List<BannerDataModel>.from(bannerDataModel)
          .map(
            (e) => BannerDataEntity(
              eventImage: e.eventImage ?? '',
            ),
          )
          .toList();

      /// Save to Local DB (Backup for Offline-mode)
      /// ....saveToLocal();

      return bannerData;
    } else {
      /// Offline
      /// Get from Local DB
      return [];
    }
  }
}
