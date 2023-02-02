import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:udemy_fluter_delivery/src/models/response_api.dart';
import 'package:udemy_fluter_delivery/src/providers/users_provider.dart';

class LoginController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  void goToReigsterPage() {
    Get.toNamed('/register');
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('Email: ${email}');
    print('Password: ${password}');

    if(isValidForm(email, password)){      
     
      ResponseApi responseApi = await usersProvider.login(email, password);

      if(responseApi.success == true){       
        _goToHomePage(responseApi);
      }
      else{
        Get.snackbar('Inicio de sesión fallido', responseApi.message ?? '');  
      }
    }    
  }

  void _goToHomePage(ResponseApi responseApi){

    GetStorage().write('user', responseApi.data);
    Get.snackbar('Inicio de sesión exitoso', responseApi.message ?? '');  
    Get.offNamedUntil('/home', ((route) => false));
    
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