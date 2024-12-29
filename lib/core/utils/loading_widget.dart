import 'package:flutter/material.dart';

Widget get getLoadingWidget => const Center(
  child: CircleAvatar(
    backgroundColor: Colors.white,
    child: CircularProgressIndicator(
      color: Colors.greenAccent,
    ),
  ),
);
