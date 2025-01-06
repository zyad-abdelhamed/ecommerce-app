import 'package:ecommerce_application/features/auth/presentation/view/components/log_in_form_component.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/view_constants.dart';
import '../../../../../core/theme/text_styles.dart';
import '../../../../../core/utils/app_bottom_navigation_bar.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      bottomNavigationBar: appBottomNavigationBar(context),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              ViewConstants.login,
              style: TextStyles.textStyle34,
            ),
            LogInFormComponent()
          ],
        ),
      ),
    );
  }
}
