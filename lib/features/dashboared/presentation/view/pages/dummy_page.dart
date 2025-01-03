import 'package:ecommerce_application/features/dashboared/presentation/view/components/banner_widgt.dart';
import 'package:flutter/material.dart';

class DummyPage extends StatelessWidget {
  const DummyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BannerWidgt(),
    );
  }
}