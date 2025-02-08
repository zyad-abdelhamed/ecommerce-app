import 'package:ecommerce_application/core/extentions/localization_extention.dart';
import 'package:ecommerce_application/core/localization/localization_proxy.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';
import 'package:ecommerce_application/core/theme/app_colors.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/settings_cubit.dart';

import 'package:ecommerce_application/features/dashboared/presentation/view/components/settings_textfields_bloc_builder.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/text_styles.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key, required this.controller});
final SettingsCubit controller;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(physics:const BouncingScrollPhysics(),
            child: Column(
              spacing: 10.0,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "settings".localization,
                  style: TextStyles.textStyle34(context: context),
                ),
                Text(
                  "personal_info".localization,
                  style: TextStyles.textStyle18black,
                ),
                const SettingsTextFieldsBlocBuilder(),
                SizedBoxs.sizedBoxH30,
                Text(
                  "language".localization,
                  style: TextStyles.textStyle18black,
                ),
                languageRow(
                    language: 'English',
                    currnetLanguage: 'en',
                    onTap: controller.convertLanguageToEnglish),
                languageRow(
                    language: 'العربية',
                    currnetLanguage: 'ar',
                    onTap: controller.convertLanguageToArabic),
                    SizedBoxs.sizedBoxH30
              ],
            ),
         
      ),
    );
  }
}

InkWell languageRow(
    {required String language,
    required String currnetLanguage,
    required VoidCallback onTap}) {
  return InkWell(
    onTap:  onTap,
    child: Row(
      children: [
        Text(
          language,
          style: TextStyles.textStyle18grey,
        ),
        Visibility(
            visible:
                currnetLanguage == sl<BaseLocalization>().language,
            child: const Icon(
              Icons.done,
              color: AppColors.greenDesignColor,
            ))
      ],
    ),
  );
}
