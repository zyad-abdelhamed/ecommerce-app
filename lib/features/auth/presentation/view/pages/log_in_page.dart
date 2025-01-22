import 'package:ecommerce_application/core/services/auth_dependency_injection.dart';
import 'package:ecommerce_application/features/auth/presentation/controller/cubit/auth_cubit.dart';
import 'package:ecommerce_application/features/auth/presentation/view/components/log_in_form_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/view_constants.dart';
import '../../../../../core/theme/text_styles.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        lazy: true,
        create: (context) => AuthCubit(sl(), sl()),
        child:  Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomScrollView(slivers: [
                SliverToBoxAdapter(
                    child: Text(
                      ViewConstants.login,
                      style: TextStyles.textStyle34(context: context),
                    ),
                  ),
                  const SliverToBoxAdapter(child: LogInFormComponent())])
                
            ),
          ),
        ));
  }
}
