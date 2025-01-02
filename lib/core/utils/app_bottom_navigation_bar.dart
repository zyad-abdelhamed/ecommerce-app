import 'package:ecommerce_application/core/utils/responsive_extention.dart';
import 'package:flutter/material.dart';

Widget appBottomNavigationBar(BuildContext context) {
  return Divider(
    thickness: 5,
    color: Colors.black,
    indent: context.width * 1 / 3,
    endIndent: context.width * 1 / 3,
  );
}
