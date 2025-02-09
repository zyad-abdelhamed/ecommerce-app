part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final LocalizationStateEnum? localizationStateEnum;
  final ThemeStateEnum? themeStateEnum;
  const SettingsState({this.localizationStateEnum, this.themeStateEnum,});
  SettingsState copyWith(
      {LocalizationStateEnum? localizationStateEnum,
      ThemeStateEnum? themeStateEnum}) {
    return SettingsState(
        localizationStateEnum: localizationStateEnum ?? localizationStateEnum,
        themeStateEnum: themeStateEnum ?? themeStateEnum);
  }

  @override
  List<Object?> get props => [localizationStateEnum, themeStateEnum];
}
