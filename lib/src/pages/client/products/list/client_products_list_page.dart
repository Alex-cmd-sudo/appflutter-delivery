import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_fluter_delivery/src/pages/client/products/list/client_products_list_controller.dart';

class ClientProductsListPage extends StatelessWidget {

  ClientProductsListController con = Get.put(ClientProductsListController());

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text('Client products list')
      )
    );
  }

}
