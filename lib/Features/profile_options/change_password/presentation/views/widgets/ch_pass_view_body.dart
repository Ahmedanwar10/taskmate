import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskmate_app/core/app_style.dart';
import 'package:taskmate_app/core/common/widgets/custtom_button.dart';
import 'package:taskmate_app/core/common/widgets/text_form.dart';
import 'package:taskmate_app/core/constants/color_manager.dart';
import 'package:taskmate_app/generated/l10n.dart';

class ChangePasswordViewBody extends StatelessWidget {
  const ChangePasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.all(8.0),
      child:  Column(

        children: [
          const SizedBox(height: 45,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            IconButton(onPressed: (){
            GoRouter.of(context).go('/profile');
          }, icon: const Icon(Icons.arrow_back,color: Colors.black,)),
          const SizedBox(width: 20,),
          Center(child: Text(S.of(context).change_password,style: AppStyles.styleSomarSansBold20(context),)),
          ],),
         const  SizedBox(height: 20,),
          CustomTextFormField(hint: S.of(context).old_password,),
           const  SizedBox(height: 20,),
          CustomTextFormField(hint:S.of(context).new_password,),
          const   SizedBox(height: 20,),
          CustomTextFormField(hint: S.of(context).confirm_new_password,),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
          CustomButton(
            color: ColorManager.primary,
            height: 50,
            text: S.of(context).save,textStyle: AppStyles.styleSomarSansSemiBold26(context)
                          .copyWith(fontSize: 20, color: Colors.white),
           onPressed: (){})
      
        ],
      ),
    );
  }
}