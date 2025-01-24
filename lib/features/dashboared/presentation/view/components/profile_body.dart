import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/profile_list_item.dart';
import 'package:ecommerce_application/features/dashboared/presentation/view/components/user_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const UserDetailsWidget(),
        SizedBoxs.sizedBoxH20,
        const Divider(),
        ProfileListTile(
          title: 'My orders',
          subtitle: 'Already have 12 orders',
          function: () {},
        ),
        ProfileListTile(
          title: 'Shipping addresses',
          subtitle:
              '3 addresses',
          function: () => context.push('/ShippingAddressesPage'),
        ),
        ProfileListTile(
          title: 'Payment methods',
          subtitle: 'Visa **34',
          function: () {},
        ),
        ProfileListTile(
          title: 'Promocodes',
          subtitle: 'You have special promocodes',
          function: () {},
        ),
        ProfileListTile(
          title: 'My reviews',
          subtitle: 'Reviews for 4 TileProfileListTiles',
          function: () {},
        ),
        ProfileListTile(
          title: 'Settings',
          subtitle: 'Notifications, password',
          function: () {
            context.pushReplacement('/settings');
          },
        ),
      ],
    );
  }
}
