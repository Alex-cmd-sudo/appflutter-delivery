import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:udemy_fluter_delivery/src/enviroment/enviroment.dart';
import 'package:udemy_fluter_delivery/src/models/user.dart';

class CategoriesProvider extends GetConnect{

  static const String url = '${Enviroment.API_URL}api/categories';
  User user = User.fromJson(GetStorage().read('user') ?? {});




}