import 'package:ecommerce_user_app/common/widgets/custome_shapes/primery_header_container.dart';
import 'package:ecommerce_user_app/features/ANYTHING/screens/Home/widgets/home_appbar.dart';
import 'package:ecommerce_user_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimeryHeaderContainer(
                child: Column(
              children: [
                THomeAppBar(),
                   SizedBox(height: TSizes.spaceBtwSections *8,),// reduce this when we have more widgets inside
              ],
            )),
          ],
        ),
      ),
    );
  }
}
