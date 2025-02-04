import 'package:bloc/bloc.dart';
import 'package:ecommerce_application/core/localization/localization_proxy.dart';
import 'package:equatable/equatable.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final BaseLocalizationProxy baseLocalizationProxy;
  SettingsCubit(this.baseLocalizationProxy) : super(const SettingsState());

  convertLanguageToArabic(){
    baseLocalizationProxy.convertToArabic();
    emit(const SettingsState());
  }

  convertLanguageToEnglish(){
    baseLocalizationProxy.convertToEnglish();
    emit(const SettingsState());
  }
}
