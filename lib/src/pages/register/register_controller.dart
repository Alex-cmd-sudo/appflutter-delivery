import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{

  static const String formInvalid = "Dato necesario";

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void register() {
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastName = lastNameController.text;
    String telephone = telephoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    print('Email: ${email}');
    print('Password: ${password}');

    if(isValidForm(email, name, lastName, telephone, password, confirmPassword)){
      Get.snackbar('Formulario valido', 'ok');
    }
  }

  bool isValidForm(String email, String name, String lastName, String telephone, String password, String confirmPassword){

    if(email.isEmpty){
      Get.snackbar(formInvalid, 'Debes ingresar un correo eletronico');
      return false;
    }

    if(!GetUtils.isEmail(email)){
      Get.snackbar(formInvalid, 'Valida tu correo eletronico');
      return false;
    }

    if(name.isEmpty){
      Get.snackbar(formInvalid, 'Debes ingresar tu nombre');
      return false;
    }

    if(lastName.isEmpty){
      Get.snackbar(formInvalid, 'Debes ingresar tu apellido');
      return false;
    }

    if(telephone.isEmpty){
      Get.snackbar(formInvalid, 'Debes ingresar tu numero celular');
      return false;
    }

    if(password.isEmpty){
      Get.snackbar(formInvalid, 'Debes ingresar una contraseña');
      return false;
    }

    if(confirmPassword.isEmpty){
      Get.snackbar(formInvalid, 'Debes ingresar la confirmación de tu contraseña');
      return false;
    }

    if(confirmPassword != password){
      Get.snackbar(formInvalid, 'Las contraseñas no coinciden');
      return false;
    }

    return true;
  }

}