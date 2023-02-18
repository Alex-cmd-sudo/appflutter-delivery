import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_fluter_delivery/src/pages/client/profile/info/client_profile_info_controller.dart';

class ClientProfileInfoPage extends StatelessWidget {
  
  ClientProfileInfoController con = Get.put(ClientProfileInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(() => Stack(//Posicionar elementos uno encima del otro
          children: [
            _backgroundCover(context),
            _boxForm(context),
            _imageUser(context),
            _buttonLogOut()
          ],
        ))
    );
  }


  Widget _boxForm(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height * 0.45,
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
            _textName(),
            _textEmail(),
            _textPhone(),
            _buttonUpdate(context)
          ],
        ),
      ),
    );
  }

  Widget _buttonLogOut(){
    return SafeArea(
      child: Container(
          margin: const EdgeInsets.only(right: 20, top: 10),
          alignment: Alignment.topRight,
          child: IconButton(
              onPressed: () => con.logOut(),
              icon: const Icon(
                Icons.power_settings_new,
                color: Colors.white,
                size: 30,
              )
          )
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

  Widget _buttonUpdate(BuildContext context){
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: ElevatedButton(
          onPressed: () => con.goToProfileUpdate(),
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15)
          ),
          child: const Text(
            'Actualizar datos',
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
        margin: const EdgeInsets.only(top: 15),
        alignment: Alignment.topCenter,
        child: CircleAvatar(
          backgroundImage: con.user.value.image != null
              ? NetworkImage(con.user.value.image!)
              : AssetImage('assets/img/user_profile.png') as ImageProvider,
          radius: 60,
          backgroundColor: Colors.white,
        )
      )
    );
  }

  Widget _textName(){
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 30, right: 30),
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text('${con.user.value.name ?? ''} ${con.user.value.lastname ?? ''}'),
        subtitle: Text('Nombre de usuario'),
      )
    );
  }  Widget _textEmail(){
    return Container(
      margin: const EdgeInsets.only(top: 0, left: 30, right: 30),
      child: ListTile(
        leading: Icon(Icons.email),
        title: Text(con.user.value.email ?? ''),
        subtitle: Text('Correo electronico'),
      ),
    );
  }

  Widget _textPhone(){
    return Container(
      margin: const EdgeInsets.only(top: 0, left: 30, right: 30),
      child: ListTile(
        leading: Icon(Icons.phone),
        title: Text(con.user.value.telephone ?? ''),
        subtitle: Text('Celular'),
      ),
    );
  }


}
