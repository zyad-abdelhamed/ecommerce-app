import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/profile_list_item.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/user_details_widget.dart';
import 'package:flutter/material.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        UserDetailsWidget(),
        SizedBoxs.sizedBoxH20,
        Divider(),
        ProfileListTile(
          title: 'My orders',
          subtitle: 'Already have 12 orders',
        ),
        ProfileListTile(
          title: 'Shipping addresses',
          subtitle: '3 addresses',
        ),
        ProfileListTile(
          title: 'Payment methods',
          subtitle: 'Visa **34',
        ),
        ProfileListTile(
          title: 'Promocodes',
          subtitle: 'You have special promocodes',
        ),
        ProfileListTile(
          title: 'My reviews',
          subtitle: 'Reviews for 4 TileProfileListTiles',
        ),
        ProfileListTile(
          title: 'Settings',
          subtitle: 'Notifications, password',
        ),
      ],
    );
  }
}

