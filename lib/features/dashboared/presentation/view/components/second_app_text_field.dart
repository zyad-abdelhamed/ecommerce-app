import 'package:ecommerce_application/core/localization/localization_proxy.dart';
import 'package:ecommerce_application/core/models/Text_field_input_model.dart';
import 'package:ecommerce_application/core/services/dependancy_injection/global_dependency_injection.dart';
import 'package:ecommerce_application/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

Widget getSecondAppTextfield(
        {required AppTextFieldInputMdel appTextFieldInputMdel}) =>
    Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: TextFormField(
            onChanged: appTextFieldInputMdel.onChangedFunction,
            controller: appTextFieldInputMdel.controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.whiteOrBlackDesignColor,
              hintText: appTextFieldInputMdel.textFieldLabel,
              hintStyle:
                  const TextStyle(color: Color.fromARGB(255, 209, 207, 207)),
              border: InputBorder.none,
            ),
          ),
        ),
    
        //icon button
       
             Align(
              alignment: sl<BaseLocalization>().isarabic() ? Alignment.centerLeft : Alignment.centerRight,
               child: GestureDetector(
                  onTap: appTextFieldInputMdel.iconFunction,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    child: Icon(
                      appTextFieldInputMdel.icon,
                      color: Colors.white,
                    ),
                  )),
             )
      ],
    );
