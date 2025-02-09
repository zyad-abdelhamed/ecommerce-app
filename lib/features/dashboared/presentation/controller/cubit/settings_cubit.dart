import 'package:bloc/bloc.dart';
import 'package:ecommerce_application/core/localization/localization_proxy.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final BaseLocalization baseLocalizationProxy;
  SettingsCubit(this.baseLocalizationProxy) : super(const SettingsState());
  //localization
  Future<void> convertLanguageToArabic() async {
    await baseLocalizationProxy.convertToArabic();
    emit(state.copyWith(
        localizationStateEnum: LocalizationStateEnum.convertToArabic));
  }

  Future<void> convertLanguageToEnglish() async {
    await baseLocalizationProxy.convertToEnglish();
    emit(state.copyWith(
        localizationStateEnum: LocalizationStateEnum.convertToEnglish));
  }

  //theme
  bool switchValue = false;
  void enableLightMode() {
    // switchValue = false;
    enableLightMode();
    emit(state.copyWith(themeStateEnum: ThemeStateEnum.enableLightMode));
  }

  void enableDarkMode() {
    // switchValue = true;
    enableDarkMode();
    emit(state.copyWith(themeStateEnum: ThemeStateEnum.enableDarkMode));
  }

  void onChanged(bool value) {
    switchValue = value;
    if (switchValue == false) {
      enableDarkMode();
    } else {
      enableLightMode();
    }
  }
}
