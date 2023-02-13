import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:udemy_fluter_delivery/src/pages/restaurant/orders/list/restaurant_orders_list_controller.dart';

class RestaurantOrdersListPage extends StatelessWidget {

  RestaurantOrdersListController con = Get.put(RestaurantOrdersListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Restaurant Orders List'),
      ),
    );
  }
}
