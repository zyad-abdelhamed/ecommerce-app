import 'package:flutter/material.dart';

import '../../../../../core/theme/text_styles.dart';

Widget customRowforPayment({required String text, required String price}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text,
        style: TextStyles.textStyle16grey,
      ),
      Text(
        price,
        style: TextStyles.textStyle18black,
      )
    ],
  );
}
