import 'package:firstgetx/controllar/CartController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controllar/shoping_Page.dart';

class ShopingPage extends StatelessWidget {
  final shoppingpageData = Get.put(shoping_controllar());
  final cardControllers = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(child: GetX<shoping_controllar>(builder: (controller) {
            return ListView.builder(
                itemCount: controller.Products.length,
                itemBuilder: (context, index) {
                  return Card(
                      child: Container(
                        height: 100,
                        child: ListTile(
                    title: Text(controller.Products[index].ProductName),
                    subtitle:
                          Text(controller.Products[index].ProductDescription),
                    trailing: Container(
                        height: 150,
                        width: 100,
                        child: Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text('\$' +
                                  controller.Products[index].ProductPrice
                                      .toString()),
                                 ElevatedButton(
                                    onPressed: () {
                                      cardControllers
                                          .addTocart(controller.Products[index]);
                                    },
                                    child: Text('add to card')),
                              
                              Obx(() {
                                return IconButton(
                                  onPressed: () {
                                    controller.Products[index].favorite
                                        .toggle(); // is auto value change true to false or false to true in get
                                  },
                                  icon: controller.Products[index].favorite.value
                                      ? Icon(Icons.check_box_rounded)
                                      : Icon(
                                          Icons.check_box_outline_blank_outlined),
                                );
                              })
                            ],
                          ),
                        ),
                    ),
                  ),
                      ));
                });
          })),
          GetX<CartController>(builder: (controller) {
            return Text(
              'Total Amount \$${controller.totalPrice} ',
              style: TextStyle(fontSize: 20),
            );
          }),
          GetBuilder<CartController>(builder: (controller) {
            return Text(
              'Total Amount \$${controller.testvalue} ',
              style: TextStyle(fontSize: 20),
            );
          }),
          Obx(() {
            return Text(
              cardControllers.totalPrice.toString(),
              style: TextStyle(fontSize: 30),
            );
          }),
          SizedBox(
            height: 100,
          )
        ],
      )),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          icon: Icon(
            Icons.add_shopping_cart_outlined,
          ),
          label: GetX<CartController>(builder: (controller) {
            return Text(
              controller.count.toString(),
              style: TextStyle(fontSize: 20),
            );
          })),
    );
  }

  static cardcontroller() {}
}
