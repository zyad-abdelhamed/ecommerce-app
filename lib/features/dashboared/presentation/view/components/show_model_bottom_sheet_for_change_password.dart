import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/user_cubit.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/change_password_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/app_sneak_bar.dart';
import '../../../../../core/utils/enums.dart';

void showChangePasswordBottomSheet({
  required BuildContext context,
}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    builder: (context) {
      return BlocProvider(
        create: (context) => UserCubit(sl(), sl(), sl()),
        child: BlocConsumer<UserCubit, UserState>(
          listener: (context, state) async {
            print(state);
            print(state.changePasswordMessage);
            if (state.changePasswordState == RequestStateEnum.success) {
              Navigator.pop(context);
              appSneakBar(
                  context: context,
                  message: 'password changed successfully',
                  isError: false);
            } else if (state.changePasswordState == RequestStateEnum.failed) {
              Navigator.pop(context);

              appSneakBar(
                context: context,
                message: state.changePasswordMessage.isNotEmpty
                    ? state.changePasswordMessage
                    : 'Failed to change password',
                isError: true,
              );
            }
          },
          builder: (context, state) {
            final UserCubit controller = context.read<UserCubit>();
            return ChangePasswordBottomSheet(
              buttonname: state.changePasswordState == RequestStateEnum.loading
                  ? 'LOADING...'
                  : 'SAVE PASSWORD',
              controller: controller,
            );
          },
        ),
      );
    },
  );
}
