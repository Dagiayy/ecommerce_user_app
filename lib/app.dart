import 'package:ecommerce_user_app/bindings/general_bindings.dart';
import 'package:ecommerce_user_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:ecommerce_user_app/utils/constants/colors.dart';
import 'package:ecommerce_user_app/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      initialBinding: generalBindings(),
      //circlar progress indicator meanwhile authenticating repository
      home:  const Scaffold(backgroundColor: TColors.primaryColor, body: Center(child: CircularProgressIndicator(color: Colors.white,),),),
    );


  }
}