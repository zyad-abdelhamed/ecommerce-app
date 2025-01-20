import 'package:flutter/material.dart';

Widget getLoadingWidget() {
  return Center(
    child: Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                blurRadius: 5,
                offset: const Offset(0, 4),
                spreadRadius: 2,
                color: Colors.grey.withOpacity(0.3))
          ]),
      child: const CircularProgressIndicator(
        color: Colors.greenAccent,
      ),
    ),
  );
}
