import 'package:ecommerce_user_app/common/styles/spacing_styles.dart';
import 'package:ecommerce_user_app/common/widgets/login_signup/form_divider.dart';
import 'package:ecommerce_user_app/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ecommerce_user_app/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ecommerce_user_app/common/widgets/login_signup/social_button.dart';
import 'package:ecommerce_user_app/utils/constants/sizes.dart';
import 'package:ecommerce_user_app/utils/constants/text_strings.dart';
import 'package:ecommerce_user_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(

      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarWeight,
          child: Column(
            children: [
              const TLoginHeader(),

              const TLoginForm(),
                TFormDivider(divdierText: TTexts.signin.capitalize !,),
const SizedBox(height: TSizes.spaceBtwSections,),



         const TSocialButtons(),

                
            ],
          ),


        ) ,
      ),
    );
  }
}
