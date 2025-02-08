import 'package:bloc/bloc.dart';
import 'package:ecommerce_application/core/localization/localization_proxy.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:equatable/equatable.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  final BaseLocalization baseLocalizationProxy;
  SettingsCubit(this.baseLocalizationProxy) : super(const SettingsState());

   convertLanguageToArabic() async{
   await baseLocalizationProxy.convertToArabic();
    emit(const SettingsState(requestStateEnum: RequestStateEnum.success));
  }

   convertLanguageToEnglish() async{
  await  baseLocalizationProxy.convertToEnglish();
    emit(const SettingsState(requestStateEnum: RequestStateEnum.failed));
  }
}
