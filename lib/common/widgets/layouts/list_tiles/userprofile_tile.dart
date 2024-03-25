
import 'package:ecommerce_user_app/common/widgets/circular_image/circular_image.dart';
import 'package:ecommerce_user_app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_user_app/utils/constants/colors.dart';
import 'package:ecommerce_user_app/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({
    super.key, required this.onPressed, 
    
  });
final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final controller=UserController.instance;

    return ListTile(
     leading: const TCircularImage(
         image: TImages.user, width: 50, height: 50, padding: 0),
         title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white),),
         subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodySmall!.apply(color: TColors.white),),
         trailing: IconButton(onPressed: onPressed, icon: const Icon(Iconsax.edit, color: TColors.white,)),
    
    
                    );
  }
}
