
import 'package:ecommerce_user_app/features/authentication/controllers/login/login_controller.dart';
import 'package:ecommerce_user_app/features/authentication/screens/password_configration/forgot_password.dart';
import 'package:ecommerce_user_app/features/authentication/screens/signup/signup.dart';
import 'package:ecommerce_user_app/navigation_menu.dart';
import 'package:ecommerce_user_app/utils/constants/sizes.dart';
import 'package:ecommerce_user_app/utils/constants/text_strings.dart';
import 'package:ecommerce_user_app/utils/validators/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller= Get.put(LoginController());
    return Form(
     key: controller.loginFormKey,
      
      child:  Padding(
      padding: const EdgeInsets.symmetric(
        vertical:  TSizes.spaceBtwInputFields),
        child: Column(
          children: [
            TextFormField(
              controller:controller.email,
              validator:(value)=> TValidator.validateEmail(value),
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.arrow_forward), labelText: TTexts.email
                
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields),
          Obx(
                   ()=> TextFormField(
                     validator: (value)=> TValidator.ValidateEmptyText('password', value),
                    controller: controller.password,
                   
                    // expands must be true here
                   obscureText: controller.hidepassword.value,
                   
                    decoration:  InputDecoration(labelText: TTexts.password, prefixIcon: Icon(Iconsax.password_check ), 
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidepassword.value = !controller.hidepassword.value,
                      icon:  Icon(controller.hidepassword.value ? Iconsax.eye_slash: Iconsax.eye))),
                                   ),
                 ),
            const SizedBox(height: TSizes.spaceBtwInputFields/2),
                        
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Obx( () =>  Checkbox(value: controller.rememberMe.value,  onChanged: ( value) => controller.rememberMe.value=!controller.rememberMe.value)),
                        
                    const Text(TTexts.remeberMe)
                  ]
                ),
                        
                TextButton(onPressed: ()=> Get.to(()=> const forgotpassword()), child: const Text(TTexts.forgotpassword)),
              ]
            ),
            const SizedBox(height: TSizes.spaceBtwInputFields,),
                        
            SizedBox(width: double.infinity, child: ElevatedButton(onPressed: () =>controller.emailAndPasswordSignIn(), child: const Text(TTexts.signin)),),
            const SizedBox(height: TSizes.spaceBtwItems),
                        
            SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => Get.to(() => const SignupScreen()), child: const Text(TTexts.createaccount)),),
              const SizedBox(height: TSizes.spaceBtwSections), 
          ],
        ),
      ),
      );
  }
}
