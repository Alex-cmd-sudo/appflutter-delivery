import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:udemy_fluter_delivery/src/pages/delivery/orders/list/delivery_orders_list_controller.dart';

class DeliveryOrdersListPage extends StatelessWidget {

  DeliveryOrderListController con =  Get.put(DeliveryOrderListController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Delivery Orders List'),
      ),
    );
  }
}
