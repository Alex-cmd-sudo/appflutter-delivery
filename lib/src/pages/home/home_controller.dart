import 'package:get/state_manager.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:udemy_fluter_delivery/src/models/user.dart';

class HomeController extends GetxController{

  User user = User.fromJson(GetStorage().read('user') ?? {});

  HomeController(){
    print('Usuario de sesión: ${user.toJson()}');
  }

  void logOut(){

    GetStorage().remove('user');
    Get.offNamedUntil('/', (route) => false);//Eliminar historial de pantallas
    
  }

}