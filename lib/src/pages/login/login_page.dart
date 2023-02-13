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
      'Bienvenido',
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
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.35, left: 30, right: 30),
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
            _textFieldEmail(),
            _textFieldPassword(),
            _buttonLogin(context)
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
        maxLength: 20,
        decoration: const InputDecoration(
          hintText: 'Correo electronico',
          prefixIcon: Icon(Icons.email)
        ),
      ),
    );
  }

  Widget _textFieldPassword(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
      child:  TextField(
        controller: loginController.passwordController,
        keyboardType: TextInputType.text,
        obscureText: true,
        maxLength: 20,
        decoration:  const InputDecoration(
            hintText: 'Contraseña',
            prefixIcon: Icon(Icons.lock)
        ),
      ),
    );
  }

  Widget _buttonLogin(BuildContext context){
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: ElevatedButton(
          onPressed: () => loginController.login(context),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15)
          ),
          child: const Text(
            'Acceder',
            style: TextStyle(
              color: Colors.black,
              fontSize: 15
            ),
          )
      ),
    );
  }

  Widget _textYourInfo(){
    return Container(
      margin: const EdgeInsets.only(top: 40, bottom: 25),
      child: const Text(
          'Ingresa tu información',
        style: TextStyle(
          color: Colors.black,
          fontSize: 20
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
            fontSize: 15
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () => loginController.goToReigsterPage(),
          child: const Text(
              'Registrarme',
            style: TextStyle(
              color: Colors.orangeAccent,
              fontWeight: FontWeight.bold,
              fontSize: 15
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
        margin: const EdgeInsets.only(top: 10, bottom: 20),
        alignment: Alignment.center,
        child: Image.asset('assets/img/delivery.png',
        width: 150,
        height: 150
        )
      ),
    );
  }
}
