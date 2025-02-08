import 'package:ecommerce_application/core/extentions/localization_extention.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/user_cubit.dart';

String? changePasswordValidator({required UserCubit controller}) {
  if (controller.repeatPasswordController.text.isEmpty) {
    return "empty_field_error".localization;
  } else if (controller.repeatPasswordController.text !=
      controller.newPasswordController.text) {
    return "password_mismatch_error".localization;
  } else {
    return null;
  }
}
