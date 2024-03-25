import 'package:ecommerce_user_app/localization/internet/network_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class generalBindings extends Bindings{
  @override
  void dependencies() {
   Get.put(NetworkManager());
  }

}