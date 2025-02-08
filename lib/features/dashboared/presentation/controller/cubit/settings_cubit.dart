import 'package:bloc/bloc.dart';
import 'package:ecommerce_application/core/localization/localization_proxy.dart';
import 'package:equatable/equatable.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final BaseLocalization baseLocalizationProxy;
  SettingsCubit(this.baseLocalizationProxy) : super(const SettingsState());

  void convertLanguageToArabic() {
    baseLocalizationProxy.convertToArabic();
    emit(const SettingsState());
  }

  void convertLanguageToEnglish() {
    baseLocalizationProxy.convertToEnglish();
    emit(const SettingsState());
  }
}
