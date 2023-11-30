import '../entity/banner_response_entity.dart';

abstract class BannerRepository {
  Future<List<BannerDataEntity>?> getBanners();
}
