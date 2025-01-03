part of 'dashboard_bloc.dart';

 class DashboardState extends Equatable {
  final List<Banners> banners ;
  final AuthRequestStateEnum requestStateEnum;
  final String errorMessage ;
   const DashboardState({this.banners = const[],this.errorMessage='',this.requestStateEnum = AuthRequestStateEnum.loading});
  
  @override
  List<Object> get props => [banners , errorMessage , requestStateEnum];
}

