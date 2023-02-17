import 'dart:convert';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:udemy_fluter_delivery/src/enviroment/enviroment.dart';
import 'package:udemy_fluter_delivery/src/models/response_api.dart';
import 'package:udemy_fluter_delivery/src/models/user.dart';

class UsersProvider extends GetConnect {
  static const String url = '${Enviroment.API_URL}api/users';
  User userSession = User.fromJson(GetStorage().read('user') ?? {});

  //Creando registro sin imagen
  Future<Response> create(User user) async {
    Response response = await post
    (
      '$url/create', 
      user.toJson(),
      headers: {'Content-Type': 'application/json'}
    );

    return response;
  }

  //Creando registro con imagen
  Future<Stream> createUserWithImage(User user, File image) async{
    
    Uri uri = Uri.http(Enviroment.API_URL_OLD, '/api/users/createWithImage');
    final request = http.MultipartRequest('POST', uri);

    request.files.add(http.MultipartFile(
      'image',
      http.ByteStream(image.openRead().cast()),
      await image.length(),
      filename: basename(image.path)
      ));

    request.fields['user'] = json.encode(user);
    final response = await request.send();
    return response.stream.transform(utf8.decoder);
  }

  //Actualizando registro sin imagen
  Future<ResponseApi> update(User user) async {
    Response response = await put
      (
        '$url/updateWithoutImage',
        user.toJson(),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': userSession.sessionToken ?? ''
        }
    );

    if(response.body == null){
      Get.snackbar('Error', 'Ocurrio un error al intentar actualizar la información');
      return ResponseApi();
    }

    if(response.statusCode == 401){
      Get.snackbar('Error', 'No esta autorizado para realizar esta petición');
      return ResponseApi();
    }

    ResponseApi responseApi = ResponseApi.fromJson(response.body);

    return responseApi;
  }

  //Actualizando registro con imagen
  Future<Stream> updateWithImage(User user, File image) async{

    Uri uri = Uri.http(Enviroment.API_URL_OLD, '/api/users/update');
    final request = http.MultipartRequest('PUT', uri);
    request.headers['Authorization'] = userSession.sessionToken ?? '';
    request.files.add(http.MultipartFile(
      'image',
      http.ByteStream(image.openRead().cast()),
      await image.length(),
      filename: basename(image.path)
      ));

    request.fields['user'] = json.encode(user);
    final response = await request.send();
    return response.stream.transform(utf8.decoder);
  }

  //Utilizando GetX
  Future<ResponseApi> createUserWithImageGetX(User user, File image) async{
    
    FormData form = FormData({
      'image': MultipartFile(image, filename: basename(image.path)),
      'user': json.encode(user)
    });

    Response response = await post('$url/createWithImage', form);

    if(response.body == null){
      Get.snackbar('Error en la solicitud', 'No se puedo realizar la petición');
      return ResponseApi();
    }

    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }

  Future<ResponseApi> login(String email, String password) async{
    Response response = await post
    (
      '$url/login',
      {
        'email': email,
        'password': password
      },
      headers: { 'Content-Type': 'application/json' }
    );

    if(response.body == null){
      Get.snackbar('Error en la solicitud', 'No se puedo realizar la petición');
      return ResponseApi();
    }

    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }
}