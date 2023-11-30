import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:learning/src/domain/entity/banner_response_entity.dart';
import 'package:learning/src/domain/usecase/banner/get_banners_usecase.dart';

part 'banner_event.dart';
part 'banner_state.dart';
part 'states/get_banner_states.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final GetBannersUsecase getBannersUsecase;

  BannerBloc({required this.getBannersUsecase}) : super(BannerInitial()) {
    on<BannerEvent>((event, emit) async {
      if (event is GetBannersEvent) {
        /// Set Loading
        emit(GetBannerLoadingState());

        /// Set Result
        List<BannerDataEntity>? data = await getBannersUsecase();
        if (data == null) {
          emit(GetBannerErrorState(errorMessage: 'Something went wrong!'));
        } else {
          emit(GetBannerSuccessState(banners: data));
        }
      }
    });
  }
}
