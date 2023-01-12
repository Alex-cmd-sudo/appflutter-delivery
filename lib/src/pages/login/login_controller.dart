import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void goToReigsterPage() {
    Get.toNamed('/register');
  }

  void login() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print('Email: ${email}');
    print('Password: ${password}');

    if(isValidForm(email, password)){
      Get.snackbar('Formulario valido', 'ok');
    }
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