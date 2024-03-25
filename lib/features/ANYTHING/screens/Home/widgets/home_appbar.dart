
import 'package:ecommerce_user_app/common/widgets/appbar/appbar.dart';
import 'package:ecommerce_user_app/common/widgets/loader/ShimmerEffect.dart';
import 'package:ecommerce_user_app/common/widgets/notification/natification.dart';
import 'package:ecommerce_user_app/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce_user_app/utils/constants/colors.dart';
import 'package:ecommerce_user_app/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final controller =Get.put(UserController());

    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         Text( TTexts.homeAppbarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: const Color.fromARGB(255, 104, 104, 104),),),
         Obx((){
          if(controller.profileLoading.value){
            return const ShimmerEffect(width: 80, height: 80);
          }else{
 return Text( controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.white,),
         );
          }
        
         }
         ),
  
        ],
      ),
      actions: [
        TNotificationCountericon(onPressed: () {  }, iconColor: TColors.white,),
      ],
    );
  }
}
