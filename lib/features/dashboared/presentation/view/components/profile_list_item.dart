import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final GestureTapCallback function;
  const ProfileListTile(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.function});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: TextStyles.textStyle18black),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: function,
    );
  }
}
