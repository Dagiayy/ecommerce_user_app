import 'package:ecommerce_user_app/common/widgets/sucess_screen/sucessscreen.dart';
import 'package:ecommerce_user_app/data/repositories/repositories.authentication/authentication_repository.dart';
import 'package:ecommerce_user_app/features/authentication/controllers/signup/verifyemail_controller.dart';
import 'package:ecommerce_user_app/features/authentication/screens/login/login.dart';
import 'package:ecommerce_user_app/utils/constants/image_strings.dart';
import 'package:ecommerce_user_app/utils/constants/sizes.dart';
import 'package:ecommerce_user_app/utils/constants/text_strings.dart';
import 'package:ecommerce_user_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key, this.email});
  final String? email;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VerifyEmailController());
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () =>AuthenticationRepository.instance.logout(),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              Image(
                image: const AssetImage(TImages.darkAppLogo),
                width: THelperFunctions.ScreenWidth() * 0.6,
              ),
              Text(
                TTexts.confirmemail,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                email ?? '',
                style: Theme.of(context).textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                TTexts.confirmemailsubtitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => controller.checkEmailVerificationStatus(),
                  child: const Text(TTexts.Continue),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: ()=> controller.sendEmailVerification(),
                  child: const Text(TTexts.resendEmail),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
