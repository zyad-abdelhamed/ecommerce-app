import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/show_model_bottom_sheet_for_change_password.dart';
import 'package:flutter/material.dart';

class SettingsRow extends StatelessWidget {
  final String startString;
  final TextStyle textStyle;
  final String textButtonText;

  const SettingsRow({
    super.key,
    required this.startString,
    this.textStyle = TextStyles.textStyleNewPrice,
    this.textButtonText = 'update',
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          startString,
          style: TextStyles.textStyle18black,
        ),
        TextButton(
            onPressed: () {
              showChangePasswordBottomSheet(
                context: context,
              );
            },
            child: Text(
              textButtonText,
              style: textStyle,
            ))
      ],
    );
  }
}
