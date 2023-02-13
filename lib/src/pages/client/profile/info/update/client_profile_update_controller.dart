import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sn_progress_dialog/progress_dialog.dart';
import 'package:udemy_fluter_delivery/src/models/response_api.dart';
import 'package:udemy_fluter_delivery/src/models/user.dart';
import 'package:udemy_fluter_delivery/src/pages/client/profile/info/client_profile_info_controller.dart';
import 'package:udemy_fluter_delivery/src/providers/users_provider.dart';
import 'package:udemy_fluter_delivery/src/utils/SnackBarGeneric.dart';

class ClientProfileUpdateController extends GetxController{

  User user = User.fromJson(GetStorage().read('user'));

  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();

  ImagePicker picker = ImagePicker();
  File? imageFile;

  UsersProvider usersProvider = UsersProvider();
  ClientProfileInfoController clientProfileInfoController = Get.find();

  ClientProfileUpdateController (){
    nameController.text = user.name ?? '';
    lastNameController.text = user.lastname ?? '';
    telephoneController.text = user.telephone ?? '';
  }

  void updateInfo(BuildContext context) async {
    String name = nameController.text;
    String lastName = lastNameController.text;
    String telephone = telephoneController.text.trim();

    if(isValidForm(name, lastName, telephone)){

      ProgressDialog progressDialog = ProgressDialog(context: context);
      progressDialog.show(max: 300, msg: 'Actualizando información...');

      User myUser = User(
          id: user.id,
          name: name,
          lastname: lastName,
          telephone: telephone,
          sessionToken: user.sessionToken
      );

      if(imageFile == null){

        ResponseApi responseApi = await usersProvider.update(myUser);
        progressDialog.close();

          if(responseApi.success == true){
            GetStorage().write('user', responseApi.data);
            clientProfileInfoController.user.value = User.fromJson(GetStorage().read('user') ?? {});
            
            Get.snackbar('Proceso terminado', responseApi.message ?? '');
          }
          else{
            Get.snackbar('Error', responseApi.message ?? '');
          }

      }
      else{
        Stream stream = await usersProvider.updateWithImage(myUser, imageFile!);
        stream.listen((res) {

          progressDialog.close();
          ResponseApi responseApi = ResponseApi.fromJson(json.decode(res));

          if(responseApi.success == true){
            GetStorage().write('user', responseApi.data);
            clientProfileInfoController.user.value = User.fromJson(GetStorage().read('user') ?? {});
            Get.snackbar('Proceso terminado', responseApi.message ?? '');
          }
          else{
            Get.snackbar('Error', responseApi.message ?? '');
          }

        });
      }
    }
  }

  bool isValidForm(String name, String lastName, String telephone){

    if(name.isEmpty){
      Get.snackbar('Campo necesario', 'Debes ingresar tu nombre o nombres');
      return false;
    }

    if(lastName.isEmpty){
      Get.snackbar('Campo necesario', 'Debes ingresar tu apellido o apellidos');
      return false;
    }

    if(telephone.isEmpty){
      Get.snackbar('Campo necesario', 'Debes ingresar tu numero celular');
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

  Widget showSnack(String message) {
    return MaterialApp(
      home: Scaffold(
        body: SnackBar(
          content: Text(message),
        ),
      ),
    );

  }

}