part of '../banner_bloc.dart';

class GetBannerLoadingState extends BannerState {}

class GetBannerSuccessState extends BannerState {
  final List<BannerDataEntity> banners;

  GetBannerSuccessState({required this.banners});
}

class GetBannerErrorState extends BannerState {
  final String errorMessage;

  GetBannerErrorState({required this.errorMessage});
}
