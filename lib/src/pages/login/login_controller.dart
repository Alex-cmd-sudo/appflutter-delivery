import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:udemy_fluter_delivery/src/models/response_api.dart';
import 'package:udemy_fluter_delivery/src/models/user.dart';
import 'package:udemy_fluter_delivery/src/providers/users_provider.dart';

class LoginController extends GetxController{

  User user = User.fromJson(GetStorage().read('user') ?? {});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  void goToReigsterPage() {
    Get.toNamed('/register');
  }

  void login(BuildContext context) async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    //print('Email: ${email}');
    //print('Password: ${password}');

    if(isValidForm(email, password)){

      ResponseApi responseApi = await usersProvider.login(email, password);

      if(responseApi.success == true){       
        GetStorage().write('user', responseApi.data);

        if(user.roles!.length > 1){
          _goToRolesPage(responseApi);
        }
        else{
          _goToClientProductListPage(responseApi);
        }
      }
      else{
        Get.snackbar('Inicio de sesión fallido', responseApi.message ?? '');  
      }

    }    
  }

  void _goToClientProductListPage(ResponseApi responseApi){
    Get.offNamedUntil('/client/products/list', ((route) => false));
  }

  void _goToRolesPage(ResponseApi responseApi){
    Get.offNamedUntil('/roles', ((route) => false));
  }

  bool isValidForm(String email, String password){

    if(email.isEmpty){
      Get.snackbar('Formulario no valido', 'El correo eletronico es necesario');
      return false;
    }

    if(!GetUtils.isEmail(email)){
      Get.snackbar('Formulario no valido', 'Valida tu correo eletronico');
      return false;
    }

    if(password.isEmpty){
      Get.snackbar('Formulario no valido', 'Valida tu contraseña');
      return false;
    }

    return true;
  }

}