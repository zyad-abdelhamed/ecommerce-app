import 'package:flutter/material.dart';

import '../../../../../core/constants/view_constants.dart';

Widget buildCustomContainerPayment({
  required String image,
  required Color color,
}) {
  return Container(
    width: 100,
    height: 70,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      border: Border.all(color: color, width: 2),
      boxShadow: ViewConstants.appShadow,
    ),
    child: Image.asset(
      image,
      fit: BoxFit.contain,
    ),
  );
}
