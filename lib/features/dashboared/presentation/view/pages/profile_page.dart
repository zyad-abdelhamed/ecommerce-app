import 'package:ecommerce_application/core/extentions/localization_extention.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/user_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/profile_body.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/sign_out_button_bloc_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        lazy: true,
        create: (context) => UserCubit(sl(), sl(), sl())..getUserData(),
        child: SingleChildScrollView(
            padding: const EdgeInsets.only(
                top: 100, left: 16.0, right: 16.0, bottom: 16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SignOutButtonBlocBuilder(),
              Text(
                "My profile".localization,
                style: TextStyles.textStyle34(context: context),
              ),
              SizedBoxs.sizedBoxH20,
              const ProfileBody()
            ])));
  }
}
