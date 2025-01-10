import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:flutter/material.dart';

class UserDetailsWidget extends StatelessWidget {
  const UserDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/test.jpg'),
          ),
      SizedBoxs.sizedBoxw15,
          Column(
                  mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
    
            children: [
            Text(
            'Matilda Brown',
            style: TextStyles.textStyle18black.copyWith(fontWeight: FontWeight.bold)
          ),
          Text(
            'matildabrown@mail.com',
            style: TextStyles.textStyle16grey
          ),
          ],)
          
        ],
      ),
    );
  }
}
