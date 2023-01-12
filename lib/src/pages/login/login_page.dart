import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_fluter_delivery/src/pages/login/login_controller.dart';

class LoginPage extends StatelessWidget {

  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 50,
        child: _textDontHaveAccount(),
      ),
      body: Stack(//Posicionar elementos uno encima del otro
        children: [
          _backgroundCover(context),
          _boxForm(context),
          Column( //Posicionar elementos uno debajo del otro
           children: [
             _imageCover(),
             _textAppName()
           ],
          )
        ],
      ),
    );
  }

  Widget _backgroundCover(BuildContext context){
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.42,
      color: Colors.amber
    );
  }

  Widget _textAppName(){
    return const Text(
      'Hola',
      style:  TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black
      ),
    );
  }

  Widget _boxForm(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.33, left: 50, right: 50),
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
            _textFieldPassword(),
            _buttonLogin()
          ],
        ),
      ),
    );
  }

  Widget _textFieldEmail(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40),
      child: TextField(
        controller: loginController.emailController,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Correo electronico',
          prefixIcon: Icon(Icons.email)
        ),
      ),
    );
  }

  Widget _textFieldPassword(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child:  TextField(
        controller: loginController.passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        decoration:  InputDecoration(
            hintText: 'Contraseña',
            prefixIcon: Icon(Icons.lock)
        ),
      ),
    );
  }

  Widget _buttonLogin(){
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: ElevatedButton(
          onPressed: () => loginController.login(),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15)
          ),
          child: const Text(
            'Acceder',
            style: TextStyle(
              color: Colors.black
            ),
          )
      ),
    );
  }

  Widget _textYourInfo(){
    return Container(
      margin: const EdgeInsets.only(top: 40, bottom: 45),
      child: const Text(
          'Ingresa tu información',
        style: TextStyle(
          color: Colors.black
        ),
      ),
    );
  }

  Widget _textDontHaveAccount(){
    return Row( //Ubicar elementos uno al lado del otro
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '¿No tienes cuenta?',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () => loginController.goToReigsterPage(),
          child: const Text(
              'Registrarme',
            style: TextStyle(
              color: Colors.orangeAccent,
              fontWeight: FontWeight.bold
            ),
          ),
        )
      ],
    );
  }

  //Sin guion bajo es publico
  //Con guion bajo es privado  
  Widget _imageCover(){
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 15),
        alignment: Alignment.center,
        child: Image.asset('assets/img/delivery.png',
        width: 130,
        height: 130
        )
      ),
    );
  }
}
