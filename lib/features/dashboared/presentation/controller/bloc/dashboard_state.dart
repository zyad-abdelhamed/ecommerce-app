part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  final List<Banners> banners;
  final RequestStateEnum requestStateEnum;
  final String errorMessage;
  const DashboardState(
      {this.banners = const [],
      this.errorMessage = '',
      this.requestStateEnum = RequestStateEnum.loading});

  @override
  List<Object> get props => [banners, errorMessage, requestStateEnum];
}
