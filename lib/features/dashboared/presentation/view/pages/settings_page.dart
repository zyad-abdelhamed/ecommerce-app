import 'package:ecommerce_application/core/extentions/localization_extention.dart';
import 'package:ecommerce_application/core/localization/localization_proxy.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';
import 'package:ecommerce_application/core/theme/app_colors.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/bloc/dashboard_bloc.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/bottom_navigation_bar_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/settings_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/user_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/settings_body.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/settings_textfields_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit(sl(), sl(), sl())..getUserData(),
        ),
        BlocProvider(
          create: (context) => SettingsCubit(sl()),
        )
      ],
      child: BlocBuilder<SettingsCubit, SettingsState>(
        builder: (context, state) {
          final SettingsCubit controller = context.read<SettingsCubit>();
          return Directionality(
            textDirection: sl<BaseLocalization>().getDirectionality(),
            child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {
                     BottomNavigationBarCubit navigationBarCubit =BottomNavigationBarCubit();
                     Navigator.pushNamedAndRemoveUntil(
                        context,
                        'dashboard',
                        (route) => false,
                      );
                     navigationBarCubit.onChangeTabIndex(4);
                     navigationBarCubit.onPageChanged(4);
                      
                    },
                    icon: const Icon(Icons.arrow_back_ios_new)),
              ),
              body: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
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
                    const  SettingsTextFieldsBlocBuilder(),
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
                      SwitchListTile.adaptive(
                        activeColor: AppColors.greenDesignColor,
                        activeTrackColor: AppColors.inActiveGreenDesignColor,
                        inactiveTrackColor: AppColors.inActiveBlackColor,
                        inactiveThumbColor: AppColors.blackDesignColor,
                        value:controller.switchValue,
                        onChanged: controller.onChanged,
                        title:const Text(
                          'Dark Mode',
                          style: TextStyles.textStyle18black,
                        ),
                      ),
                      SizedBoxs.sizedBoxH30
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
