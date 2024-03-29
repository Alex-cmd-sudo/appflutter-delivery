import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:udemy_fluter_delivery/src/models/response_api.dart';
import 'package:udemy_fluter_delivery/src/models/user.dart';
import 'package:udemy_fluter_delivery/src/providers/users_provider.dart';

class RegisterController extends GetxController{

  static const String formInvalid = "Dato necesario";

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  ImagePicker picker = ImagePicker();
  File? imageFile;

  void register(BuildContext context) async {
    String email = emailController.text.trim();
    String name = nameController.text;
    String lastName = lastNameController.text;
    String telephone = telephoneController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    //print('Email: ${email}');
    //print('Password: ${password}');

    if(isValidForm(email, name, lastName, telephone, password, confirmPassword)){

      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(max: 300, msg: 'Registrando usuario');

      User user = User(
        email: email,
        name: name,
        lastname: lastName,
        telephone: telephone,
        password: password
      );

      //Response response = await usersProvider.create(user);
      //Get.snackbar('Registro correcto', 'Te has registrado exitosamente');

      Stream stream = await usersProvider.createUserWithImage(user, imageFile!);
      stream.listen((res) { 
        
        progressDialog.close();
        ResponseApi responseApi = ResponseApi.fromJson(json.decode(res));

        if(responseApi.success == true){
          _goToHomePage(responseApi);
        }
        else{
          Get.snackbar('Registro fallido', responseApi.message ?? '');
        }

      });
    }
  }

    void _goToHomePage(ResponseApi responseApi){
      GetStorage().write('user', responseApi.data);
      Get.offNamedUntil('/client/products/list', ((route) => false));
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

    if(imageFile == null){
      Get.snackbar(formInvalid, 'Es necesario una imagen de perfil');
      return false;
    }

    return true;
  }

  Future selectImage(ImageSource imageSource) async{
    
    XFile? image = await picker.pickImage(source: imageSource);
    
    if(image != null){
      imageFile = File(image.path);
      update();
    }

  }

  void showAlertDialog(BuildContext context){

    Widget galleryButton = ElevatedButton(
      onPressed: () {
        Get.back();
        selectImage(ImageSource.gallery);
      },
      child: const Text('Galeria',
        style: TextStyle(
          color: Colors.black
        ))
      );

      Widget cameraButton = ElevatedButton(
      onPressed: () {
        Get.back();
        selectImage(ImageSource.camera);
      },
      child: const Text('Camara',
        style: TextStyle(
          color: Colors.black
          ))
      );

      AlertDialog alertDialog = AlertDialog(
        title: const Text('Selecciona una opción', textAlign: TextAlign.center),
        actionsAlignment: MainAxisAlignment.center,
      actions: [
        galleryButton,
        cameraButton
      ]
      );
  
    showDialog(context: context, builder: (BuildContext context) {
      return alertDialog;
    });
  }

}