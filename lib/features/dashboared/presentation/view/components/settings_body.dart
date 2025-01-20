import 'package:ecommerce_application/core/constants/view_constants.dart';

import 'package:ecommerce_application/features/dashboared/presentation/view/components/change_password_button.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/text_styles.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        spacing: 10.0,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            ViewConstants.settings,
            style: TextStyles.textStyle34,
          ),
          Text(
            ViewConstants.personalInfo,
            style: TextStyles.textStyle18black,
          ),
          TextField(),
          TextField(),
          ChangePasswordButton(),
          TextField()
        ],
      ),
    );
  }
}
