import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_fluter_delivery/src/pages/client/profile/info/update/client_profile_update_controller.dart';

class ClientProfileUpdatedPage extends StatelessWidget {

  ClientProfileUpdateController con = Get.put(ClientProfileUpdateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(//Posicionar elementos uno encima del otro
          children: [
            _backgroundCover(context),
            _imageUser(context),
            _boxForm(context),
            _buttonBack()
          ],
        )
    );
  }

  Widget _buttonBack(){
    return SafeArea(
      child: Container(
          margin: const EdgeInsets.only(left: 20, top: 20),
          child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 30,
              )
          )
      ),
    );
  }

  Widget _boxForm(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height * 0.55,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.29, left: 30, right: 30),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(35)),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54,
                blurRadius: 15,
                offset: Offset(0,0.75)
            )
          ]
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textYourInfo(),
            _textFieldName(),
            _textFieldLastName(),
            _textFieldTelephone(),
            _buttonUpdate(context)
          ],
        ),
      ),
    );
  }

  Widget _backgroundCover(BuildContext context){
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.35,
        color: Colors.amber
    );
  }

  Widget _textFieldName(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: con.nameController,
        keyboardType: TextInputType.text,
        maxLength: 20,
        decoration: const InputDecoration(
            hintText: 'Nombre',
            prefixIcon: Icon(Icons.person)
        ),
      ),
    );
  }

  Widget _textFieldLastName(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child:  TextField(
        controller: con.lastNameController,
        keyboardType: TextInputType.text,
        maxLength: 20,
        decoration: const InputDecoration(
            hintText: 'Apellido(s)',
            prefixIcon: Icon(Icons.person_outline)
        ),
      ),
    );
  }

  Widget _textFieldTelephone(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: TextField(
        controller: con.telephoneController,
        keyboardType: TextInputType.phone,
        maxLength: 10,
        decoration: const InputDecoration(
            hintText: 'Telefono celular',
            prefixIcon: Icon(Icons.phone)
        ),
      ),
    );
  }

  Widget _buttonUpdate(BuildContext context){
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: ElevatedButton(
          onPressed: () => con.updateInfo(context),
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15)
          ),
          child: const Text(
            'Actualizar',
            style: TextStyle(
                color: Colors.black,
                fontSize: 15
            ),
          )
      ),
    );
  }

  Widget _imageUser(context){
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        alignment: Alignment.topCenter,
        child: GestureDetector(
          onTap: () => con.showAlertDialog(context),
          child: GetBuilder<ClientProfileUpdateController> (
            builder: (value) => CircleAvatar(
              backgroundImage: con.imageFile != null
                  ? FileImage(con.imageFile!)
                  : con.user.image != null
                    ? NetworkImage(con.user.image!)
                    : AssetImage('assets/img/user_profile.png') as ImageProvider,
              radius: 70,
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Widget _textYourInfo(){
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 25),
      child: const Text(
        'Mi información',
        style: TextStyle(
            color: Colors.black,
            fontSize: 20
        ),
      ),
    );
  }

}
