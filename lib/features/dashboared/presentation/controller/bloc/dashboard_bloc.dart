import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/features/dashboared/domain/entity/Banner.dart';
import 'package:ecommerce_application/features/dashboared/domain/usecases/banner_use_case.dart';
import 'package:equatable/equatable.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final BannerUseCase bannerUseCase;

  DashboardBloc(this.bannerUseCase) : super(const DashboardState()) {
    on<GetBannerdata>(getBannerData);
  }

  FutureOr<void> getBannerData(
      GetBannerdata event, Emitter<DashboardState> emit) async {
    final result = await bannerUseCase.call();
    result.fold(
      (l) => emit(DashboardState(
          errorMessage: l.message,
          requestStateEnum: AuthRequestStateEnum.failed)),
      (r) => emit(DashboardState(
          banners: r, requestStateEnum: AuthRequestStateEnum.success)),
    );
  }
}
