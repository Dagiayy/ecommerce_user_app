import 'package:ecommerce_user_app/common/model/user/user_model.dart';
import 'package:ecommerce_user_app/data/repositories/repositories.authentication/authentication_repository.dart';
import 'package:ecommerce_user_app/data/repositories/user/user_repository.dart';
import 'package:ecommerce_user_app/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce_user_app/localization/internet/network_manager.dart';
import 'package:ecommerce_user_app/utils/constants/image_strings.dart';
import 'package:ecommerce_user_app/utils/popups/fullscreen_loader.dart';
import 'package:ecommerce_user_app/utils/popups/loaders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Variables
  final privacyPolicy = true.obs;
  final hidePassword = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
   GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  // Signup
  void signup() async {
  try {
    // Start loading
    FullScreenloader.openLoadingDialog(
        'We are Processing your information...', TImages.docerAnimation);

    // Check internet connectivity
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      FullScreenloader.stopLoading();
      return;
    }

    // Form validation
    if (!signupFormKey.currentState!.validate()) {
      FullScreenloader.stopLoading();
      return;
    }

    // Privacy policy check
    if (!privacyPolicy.value) {
      Loader.warningSnackBar(
        title: 'Accept privacy policy',
        message:
            'In order to create an account, you must have read and accept the privacy policy and terms of use.',
      );
      FullScreenloader.stopLoading();
      return;
    }

    // Register user in Firebase authentication and save data in Firebase
    final userCredential = await AuthenticationRepository.instance
        .registerWithEmailAndPassword(
            email.text.trim(), password.text.trim());

    // Save authenticated user in Firebase Firestore
    final newUser = UserModel(
      id: userCredential.user!.uid,
      firstName: firstName.text.trim(),
      lastName: lastName.text.trim(),
      username: username.text.trim(),
      email: email.text.trim(),
      phoneNumber: phoneNumber.text.trim(),
      profilePicture: '',
    );

    final userRepository = Get.put(UserRepository());
    await userRepository.saveUserRecord(newUser);

    // Remove loader
    FullScreenloader.stopLoading();

    // Show success message
    Loader.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been created! Verify email to continue.');

    // Move to verify email screen
    Get.to(() =>  VerifyEmailScreen(email: email.text.trim(),));

  } catch (e) {
    // Exception handling
    FullScreenloader.stopLoading(); // Stop loader
    Loader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
  }
}

}
