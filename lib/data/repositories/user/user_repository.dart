

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_user_app/common/model/user/user_model.dart';
import 'package:ecommerce_user_app/data/repositories/repositories.authentication/authentication_repository.dart';
import 'package:ecommerce_user_app/utils/exception/custom_exception.dart';
import 'package:ecommerce_user_app/utils/exception/firebaseauthexception.dart';
import 'package:ecommerce_user_app/utils/exception/format_exception.dart';
import 'package:ecommerce_user_app/utils/exception/platform_exception.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController{

  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // function to save user data to ifirestore

  Future<void> saveUserRecord(UserModel user) async {
    try{
      await _db.collection("Users").doc(user.id).set(user.tojson());
       print('Attempting to save user record: $user');
   
    print('User record saved successfully');

     }on FirebaseAuthException catch (e){
          throw TFirebaseAuthException(e.code).message;
        }on FormatException catch (e){
          throw TFormatException();
        }on PlatformException catch (e){
          throw TPlatformException(e.code).message;
        }catch (e){
          throw "Something Went Wrong. please try again";
        }
      }

// delete user data from firestore
  Future<void> removeUserRecord(String userId ) async {
    try{
      await _db.collection("Users").doc(userId).delete();
      
   
    print('User deleted sucessfully');

     }on FirebaseAuthException catch (e){
          throw TFirebaseAuthException(e.code).message;
        }on FormatException catch (e){
          throw TFormatException();
        }on PlatformException catch (e){
          throw TPlatformException(e.code).message;
        }catch (e){
          throw "Something Went Wrong. please try again";
        }
      }
      // fun to fetch user detail based on user id

      Future<UserModel> fetchUserDetails() async {
    try{
      final DocumentSnapshot = await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).get();
      if(DocumentSnapshot.exists){
        return UserModel.fromSnapshot(DocumentSnapshot);
      }else{
        return UserModel.empty();
      }

     }on FirebaseAuthException catch (e){
          throw TFirebaseAuthException(e.code).message;
        }on FormatException catch (e){
          throw TFormatException();
        }on PlatformException catch (e){
          throw TPlatformException(e.code).message;
        }catch (e){
          throw "Something Went Wrong. please try again";
        }
      }

      // update user data in firestore

      Future<void> updateUserDetails(UserModel updateUser) async {
    try{
     await _db.collection("Users").doc(updateUser.id).update(updateUser.tojson());

     }on FirebaseAuthException catch (e){
          throw TFirebaseAuthException(e.code).message;
        }on FormatException catch (e){
          throw TFormatException();
        }on PlatformException catch (e){
          throw TPlatformException(e.code).message;
        }catch (e){
          throw "Something Went Wrong. please try again";
        }
      }

      //  update any field in specific Users collection
Future<void> updateSingleField(Map<String, dynamic> json) async {
    try{
     await _db.collection("Users").doc(AuthenticationRepository.instance.authUser?.uid).update(json);

     }on FirebaseAuthException catch (e){
          throw TFirebaseAuthException(e.code).message;
        }on FormatException catch (e){
          throw TFormatException();
        }on PlatformException catch (e){
          throw TPlatformException(e.code).message;
        }catch (e){
          throw "Something Went Wrong. please try again";
        }
      }




  }
