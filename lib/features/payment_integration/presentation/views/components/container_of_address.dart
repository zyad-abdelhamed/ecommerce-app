import 'package:ecommerce_application/core/constants/view_constants.dart';
import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:flutter/material.dart';

Widget containerOfAddress(
    {required String name,
    required String address,
    required VoidCallback function}) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        boxShadow: ViewConstants.appShadow,
        color: Colors.white,
        borderRadius: BorderRadius.circular(8)),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                name,
                style: TextStyles.textStyle18black,
              ),
              TextButton(
                onPressed: function,
                child: const Text(
                  'Change',
                  style: TextStyles.textStyleNewPrice,
                ),
              )
            ],
          ),
          SizedBoxs.sizedBoxH10,
          Text(address)
        ],
      ),
    ),
  );
}
