import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:udemy_fluter_delivery/src/models/user.dart';

class ClientProfileInfoController extends GetxController{

    var user = User.fromJson(GetStorage().read('user') ?? {}).obs;

    void logOut(){
      GetStorage().remove('user');
      Get.offNamedUntil('/', (route) => false);//Eliminar historial de pantallas
    }

    void goToProfileUpdate(){
      Get.toNamed('/client/profile/update');
    }
}