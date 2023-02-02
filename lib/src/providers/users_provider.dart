import 'package:get/get.dart';
import 'package:udemy_fluter_delivery/src/enviroment/enviroment.dart';
import 'package:udemy_fluter_delivery/src/models/response_api.dart';
import 'package:udemy_fluter_delivery/src/models/user.dart';

class UsersProvider extends GetConnect {
  String url = Enviroment.API_URL + 'api/users';

  Future<Response> create(User user) async {
    Response response = await post
    (
      '$url/create', 
      user.toJson(),
      headers: {'Content-Type': 'application/json'}
    );

    return response;
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
      Get.snackbar('Error', 'No se puedo realizar la petición');
      return ResponseApi();
    }

    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }
}