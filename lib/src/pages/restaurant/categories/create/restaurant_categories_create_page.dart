import 'package:flutter/material.dart';

class RestaurantCategoriesCreatePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(//Posicionar elementos uno encima del otro
          children: [
            _backgroundCover(context),
            _textNewCategory(context),
            _boxForm(context)
          ],
        )
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
            _textFieldDescription(),
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
        //controller: con.nameController,
        keyboardType: TextInputType.text,
        maxLength: 20,
        decoration: InputDecoration(
            hintText: 'Nombre',
            prefixIcon: Container(
              margin: EdgeInsets.only(bottom: 10),
                child: Icon(Icons.category)
            )
        ),
      ),
    );
  }

  Widget _textFieldDescription(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child:  TextField(
        //controller: con.lastNameController,
        keyboardType: TextInputType.text,
        maxLines: 4,
        maxLength: 100,
        decoration: InputDecoration(
            hintText: 'Descripcion',
            prefixIcon: Container(
              margin: EdgeInsets.only(bottom: 60),
              child: Icon(Icons.description)
            )
        ),
      ),
    );
  }

  Widget _buttonUpdate(BuildContext context){
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: ElevatedButton(
          onPressed: () => {},
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15)
          ),
          child: const Text(
            'Crear',
            style: TextStyle(
                color: Colors.black,
                fontSize: 15
            ),
          )
      ),
    );
  }

  Widget _textNewCategory(context){
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Icon(Icons.category, size: 100),
            Text(
                'Nueva categoria',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23
                ),
            ),
          ],
        )
      ),
    );
  }

  Widget _textYourInfo(){
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 25, left: 30, right: 30),
      child: Text(
        'Información para la nueva categoria',
        style: TextStyle(
            color: Colors.black,
            fontSize: 15
        ),
      ),
    );
  }
}
