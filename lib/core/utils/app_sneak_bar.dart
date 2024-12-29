import 'package:flutter/material.dart';

ScaffoldFeatureController<MaterialBanner, MaterialBannerClosedReason> appSneakBar(
        {required BuildContext context, required String message}) =>
    ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
     actions:const [],
     content: Text(message),
    ));
