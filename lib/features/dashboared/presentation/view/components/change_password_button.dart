import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/show_model_bottom_sheet_for_change_password.dart';
import 'package:flutter/material.dart';

class ChangePasswordButton extends StatelessWidget {
  const ChangePasswordButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          ViewConstants.password,
          style: TextStyles.textStyle18black,
        ),
        TextButton(
            onPressed: () {
              showChangePasswordBottomSheet(
                context: context,
              );
            },
            child: const Text(
              ViewConstants.change,
              style: TextStyles.textStyle18grey,
            ))
      ],
    );
  }
}
