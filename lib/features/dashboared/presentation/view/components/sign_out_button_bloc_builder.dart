import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignOutButtonBlocBuilder extends StatelessWidget {
  const SignOutButtonBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        UserCubit cubit = context.read<UserCubit>();
        return Align(
          alignment: Alignment.topRight,
          child: IconButton(
              onPressed: () {
                cubit.signOut(context: context);
              },
              icon: const Icon(Icons.exit_to_app)),
        );
      },
    );
  }
}
