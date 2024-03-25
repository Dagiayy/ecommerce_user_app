import 'package:ecommerce_user_app/common/widgets/login_signup/form_divider.dart';
import 'package:ecommerce_user_app/common/widgets/login_signup/social_button.dart';
import 'package:ecommerce_user_app/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:ecommerce_user_app/utils/constants/sizes.dart';
import 'package:ecommerce_user_app/utils/constants/text_strings.dart';
import 'package:ecommerce_user_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(

      appBar: AppBar(
        
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // title
              Text(TTexts.signin, style: Theme.of(context).textTheme.headlineMedium,),

              const SizedBox(height: TSizes.spaceBtwSections,),


              const SignupForm(),
                TFormDivider(divdierText: TTexts.orSignupwith.capitalize !),
const SizedBox(height: TSizes.spaceBtwSections,),
                const TSocialButtons(),
                const SizedBox(height: TSizes.spaceBtwSections,),
            ],

          ),
          ),
      ),
    );
  }
}
