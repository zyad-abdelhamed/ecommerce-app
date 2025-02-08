part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final RequestStateEnum? requestStateEnum;
  const SettingsState({this.requestStateEnum});

  @override
  List<Object?> get props => [requestStateEnum];
}
