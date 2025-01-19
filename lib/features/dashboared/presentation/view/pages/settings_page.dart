
import 'package:ecommerce_application/features/dashboared/presentation/view/components/settings_body.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(FontAwesomeIcons.arrowLeftLong),
      ),
      body: SettingsBody(),
    );
  }
}
