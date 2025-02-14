import 'package:bloc/bloc.dart';
import 'package:ecommerce_application/core/helper_functions/enable_dark_mode.dart';
import 'package:ecommerce_application/core/helper_functions/enable_light_mode.dart';
import 'package:ecommerce_application/core/localization/localization_proxy.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final BaseLocalization baseLocalizationProxy;
  SettingsCubit(this.baseLocalizationProxy) : super( SettingsState());
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
 

  void onChanged(bool value) {
      print("Switch toggled: $value"); // تحقق مما إذا كان يتم استدعاء الوظيفة

    if (state. switchValue == false) {
      enableDarkMode();
          state.switchValue = value;

          emit(state.copyWith(themeStateEnum: ThemeStateEnum.enableDarkMode));

      
    } else {
      enableLightMode();
         state. switchValue = value;

          emit(state.copyWith(themeStateEnum: ThemeStateEnum.enableLightMode));

    }
  
  }
 

}
