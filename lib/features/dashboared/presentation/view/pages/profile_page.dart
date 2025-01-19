import 'package:ecommerce_application/core/services/dashboard_debendency_injection.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/user_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => UserCubit(dsl(), dsl(),dsl())..getUserData(),
        child: const SingleChildScrollView(
            padding: EdgeInsets.only(
                top: 100, left: 16.0, right: 16.0, bottom: 16.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'My profile',
                style: TextStyles.textStyle34,
              ),
              SizedBoxs.sizedBoxH20,
              ProfileBody()
            ])));
  }
}
