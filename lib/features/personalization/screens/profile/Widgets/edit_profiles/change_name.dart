import 'package:ecommerce_user_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_user_app/features/personalization/controllers/user_edit_controller/update_name_controller.dart';
import 'package:ecommerce_user_app/utils/constants/sizes.dart';
import 'package:ecommerce_user_app/utils/constants/text_strings.dart';
import 'package:ecommerce_user_app/utils/validators/validator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(UpdateNameController());

    return  Scaffold(

      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Change Name', style: Theme.of(context).textTheme.headlineSmall,),
      ),

      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Text(
              'use real name',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(height: TSizes.spaceBtwSections,),

            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) => TValidator.ValidateEmptyText('First Name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: TTexts.firstName, prefixIcon: Icon(Iconsax.user)),
                  ),
                     const SizedBox(height: TSizes.spaceBtwInputFields,),
                    TextFormField(
                    controller: controller.lastName,
                    validator: (value) => TValidator.ValidateEmptyText('Last Name', value),
                    expands: false,
                    decoration: const InputDecoration(labelText: TTexts.lastName, prefixIcon: Icon(Iconsax.user)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections,),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: ()=> controller.updateUserName(), child: Text('Save')),
            )


          ],
        ),
        ),
    );
  }
}