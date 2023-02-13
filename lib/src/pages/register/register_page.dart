import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_fluter_delivery/src/pages/register/register_controller.dart';

class RegisterPage extends StatelessWidget {

  RegisterController registerController = Get.put(RegisterController());

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
      height: MediaQuery.of(context).size.height * 0.65,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.29, left: 30, right: 30),
      decoration: const BoxDecoration(
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
            _textFieldEmail(),
            _textFieldName(),
            _textFieldLastName(),
            _textFieldTelephone(),
            _textFieldPassword(),
            _textFieldConfirmPassword(),
            _buttonRegister(context)
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

  Widget _textFieldEmail(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: TextField(
        controller: registerController.emailController,
        keyboardType: TextInputType.emailAddress,
        maxLength: 30,
        decoration: const InputDecoration(
            hintText: 'Correo electronico',
            prefixIcon: Icon(Icons.email)
        ),
      ),
    );
  }

  Widget _textFieldName(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: registerController.nameController,
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
        controller: registerController.lastNameController,
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
        controller: registerController.telephoneController,
        keyboardType: TextInputType.phone,
        maxLength: 10,
        decoration: const InputDecoration(
            hintText: 'Telefono celular',
            prefixIcon: Icon(Icons.phone)
        ),
      ),
    );
  }

  Widget _textFieldPassword(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: registerController.passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        maxLength: 20,
        decoration: const InputDecoration(
            hintText: 'Contraseña',
            prefixIcon: Icon(Icons.lock)
        ),
      ),
    );
  }

  Widget _textFieldConfirmPassword(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: TextField(
        controller: registerController.confirmPasswordController,
        keyboardType: TextInputType.text,
        obscureText: true,                
        maxLength: 20,
        decoration: const InputDecoration(            
            hintText: 'Confirmar Contraseña',
            prefixIcon: Icon(Icons.lock_outline)            
        ),
      ),
    );
  }

  Widget _buttonRegister(BuildContext context){
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: ElevatedButton(
          onPressed: () => registerController.register(context),
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15)
          ),
          child: const Text(
            'Registrarme',
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
          onTap: () => registerController.showAlertDialog(context),
          child: GetBuilder<RegisterController> (
            builder: (value) => CircleAvatar(
            backgroundImage: registerController.imageFile != null 
            ? FileImage(registerController.imageFile!)
            : AssetImage('assets/img/user_profile.png') as ImageProvider,
            radius: 80,
            backgroundColor: Colors.white,
          ),
          ),
        ),
      ),
    );
  }

  Widget _textYourInfo(){
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 15),
      child: const Text(
        'Ingresa tus datos',
        style: TextStyle(
            color: Colors.black,
            fontSize: 20
        ),
      ),
    );
  }

}
