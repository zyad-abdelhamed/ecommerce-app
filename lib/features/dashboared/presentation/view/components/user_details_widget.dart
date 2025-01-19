import 'package:ecommerce_application/core/theme/text_styles.dart';
import 'package:ecommerce_application/core/utils/enums.dart';
import 'package:ecommerce_application/core/widgets/loading_widget.dart';
import 'package:ecommerce_application/core/utils/sized_boxs.dart';
import 'package:ecommerce_application/features/dashboared/presentation/controller/cubit/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserDetailsWidget extends StatelessWidget {
  const UserDetailsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
       // final UserCubit controller = context.read<UserCubit>();
      return state.userDataState == RequestStateEnum.success?  SizedBox(
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
                  Text( state.userData.name,
                      style: TextStyles.textStyle18black
                          .copyWith(fontWeight: FontWeight.bold)),
                  Text(state.userData.email,
                      style: TextStyles.textStyle16grey),
                ],
              )
            ],
          ),
        ):  getLoadingWidget();
      },
    );
  }
}
