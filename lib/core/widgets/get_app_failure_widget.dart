import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:flutter/material.dart';

Widget getAppFailureWidget({required String message}) {
 return Center(child: Text(message,style: TextStyles.textStyle20Boldgreen));
}