import 'package:ecommerce_user_app/utils/constants/colors.dart';
import 'package:ecommerce_user_app/utils/constants/sizes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AnimationLoaderWidget extends StatelessWidget {
  const AnimationLoaderWidget({super.key, required this.text, required this.animation,  this.showAction=false, this.actionText, this.anActionPressed
  
  });

final String text;
final String animation;
final bool showAction;
final String? actionText;
final VoidCallback? anActionPressed; 
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Lottie.asset(animation, width:MediaQuery.of(context).size.width*0.8),
          const SizedBox(height: TSizes.defaultSpace,),

          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSizes.defaultSpace,),

          showAction
          ?
          SizedBox(
            width: 250,
            child: OutlinedButton(
              onPressed: anActionPressed,
              style: OutlinedButton.styleFrom(backgroundColor: TColors.dark),

              child: Text(
                actionText!,
                style: Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.light),

              )
              ),
          ) : const SizedBox(),
        ],
      ),
    );
  }
}