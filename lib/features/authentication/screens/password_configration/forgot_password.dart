import 'package:ecommerce_user_app/features/authentication/controllers/forgot+password/forgotpasword+controller.dart';
import 'package:ecommerce_user_app/features/authentication/screens/password_configration/reser_password.dart';
import 'package:ecommerce_user_app/utils/constants/sizes.dart';
import 'package:ecommerce_user_app/utils/constants/text_strings.dart';
import 'package:ecommerce_user_app/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class forgotpassword extends StatelessWidget {
  const forgotpassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(ForgetPasswordController());

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Text(TTexts.forgotpasswordtitle, style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: TSizes.spaceBtwItems,),
             Text(TTexts.forgotpasswordsubtitle, style: Theme.of(context).textTheme.headlineMedium,),
             const SizedBox(height: TSizes.spaceBtwSections*2,),


             Form(
              key: controller.forgetPasswordFormKey,
               child: TextFormField(
               controller: controller.email,
               validator:  TValidator.validateEmail,
               decoration: const InputDecoration(labelText: TTexts.email, prefixIcon: Icon(Icons.arrow_forward)),  
               
                          ),
             ),
                 const SizedBox(height: TSizes.spaceBtwSections,),
           SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=> controller.sendPasswordResetEmail(),child: const Text(TTexts.submit),),)

          ],
        ),
        ),
    );
  }
}