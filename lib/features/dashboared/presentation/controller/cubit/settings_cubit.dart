import 'package:bloc/bloc.dart';
import 'package:ecommerce_application/core/helper_functions/enable_dark_mode.dart';
import 'package:ecommerce_application/core/helper_functions/enable_light_mode.dart';
import 'package:ecommerce_application/core/localization/localization_proxy.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final BaseLocalization baseLocalizationProxy;
  SettingsCubit(this.baseLocalizationProxy) : super(SettingsState());
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

  ThemeMode themeMode = ThemeMode.light;
  bool switchValue = false;
  void onChanged(bool value) {
    if (switchValue == false) {
      switchValue = value;
      themeMode = ThemeMode.dark;
      emit(state.copyWith(themeStateEnum: ThemeStateEnum.enableDarkMode));
    } else {
      switchValue = value;
      themeMode = ThemeMode.light;
      emit(state.copyWith(themeStateEnum: ThemeStateEnum.enableLightMode));
    }
  }
}
