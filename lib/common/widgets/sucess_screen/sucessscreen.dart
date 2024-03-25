import 'package:ecommerce_user_app/common/styles/spacing_styles.dart';
import 'package:ecommerce_user_app/features/authentication/screens/login/login.dart';
import 'package:ecommerce_user_app/utils/constants/image_strings.dart';
import 'package:ecommerce_user_app/utils/constants/sizes.dart';
import 'package:ecommerce_user_app/utils/constants/text_strings.dart';
import 'package:ecommerce_user_app/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SucessScreen extends StatelessWidget {
  const SucessScreen({super.key,  this.image, this.title, this.subTitle, required this.onPressed});

  final image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarWeight*2,
          child: Column(
            children: [
              Image(
  image: image != null ? AssetImage(image) : const AssetImage(TImages.darkAppLogo),
  width: THelperFunctions.ScreenWidth() * 0.6,
),

              const SizedBox(height: TSizes.spaceBtwSections,),


              Text(
  title ?? 'Default Title',
  style: Theme.of(context).textTheme.headlineMedium,
  textAlign: TextAlign.center,
),

              const SizedBox(height: TSizes.spaceBtwItems,),
              Text(
  subTitle ?? 'Default Subtitle',
  style: Theme.of(context).textTheme.labelMedium,
  textAlign: TextAlign.center,
),

const SizedBox(height: TSizes.spaceBtwSections,),


SizedBox(width: double.infinity, child: ElevatedButton(onPressed: ()=> Get.to(()=> const LoginScreen()),child: const Text(TTexts.Continue),),)
            ],
          ),
          
          ),
      ),
    );
  }
}