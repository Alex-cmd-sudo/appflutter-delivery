import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        child: _textDontHaveAccount(),
      ),
      body: Stack(//Posicionar elementos uno encima del otro
        children: [
          _backroundCover(context),
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

  Widget _backroundCover(BuildContext context){
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.4,
      color: Colors.amber
    );
  }

  Widget _textAppName(){
    return Text(
      'Hola',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black
      ),
    );
  }

  Widget _textDontHaveAccount(){
    return Row( //Ubicar elementos uno al lado del otro
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿No tienes cuenta?',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        SizedBox(width: 10),
        Text(
            'Registrarme',
          style: TextStyle(
            color: Colors.orangeAccent,
            fontWeight: FontWeight.bold
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
        margin: EdgeInsets.only(top: 20, bottom: 15),
        alignment: Alignment.center,
        child: Image.asset('assets/img/delivery.png',
        width: 130,
        height: 130
        )
      ),
    );
  }
}
