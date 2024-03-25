import 'dart:async';

import 'package:ecommerce_user_app/features/authentication/screens/login/login.dart';
import 'package:ecommerce_user_app/features/authentication/screens/onboarding/onboarding.dart';
import 'package:flutter/material.dart';


class Splash extends StatefulWidget {
  final bool isUserLoggedIn;

  const Splash({Key? key, required this.isUserLoggedIn}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => widget.isUserLoggedIn ? const LoginScreen() : const OnBoardingScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
          Color(0xffB81736),
                Color(0xff281537),
            ],
          ),
        ),
        child:const  Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
               Image(image: AssetImage('assets/logos/ecommerce.png')),
                Text(
                  'Shega Store',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
