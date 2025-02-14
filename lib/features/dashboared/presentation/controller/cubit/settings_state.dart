part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final LocalizationStateEnum? localizationStateEnum;
   bool switchValue ;
 
  final ThemeStateEnum? themeStateEnum;
   SettingsState( {this.localizationStateEnum, this.themeStateEnum,this.switchValue= false});
  SettingsState copyWith(
      {
        bool? switchValue,
        LocalizationStateEnum? localizationStateEnum,
      ThemeStateEnum? themeStateEnum}) {
    return SettingsState(
      switchValue: switchValue ?? this.switchValue,
        localizationStateEnum: localizationStateEnum ?? localizationStateEnum,
        themeStateEnum: themeStateEnum ?? themeStateEnum);
  }

  @override
  List<Object?> get props => [localizationStateEnum, themeStateEnum,switchValue];
}

