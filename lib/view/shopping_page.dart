import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile/controllers/cart_controller.dart';
import 'package:mobile/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {

  final shoppingController= Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(
              builder: (controller) {
                return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder:(context,index){
                  return Card(
                    margin: const EdgeInsets.all(12),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${controller.products[index].productName}',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                      '${controller.products[index].productDescription}'),
                                ],
                              ),
                              Text('\$${controller.products[index].price}',
                                  style: TextStyle(fontSize: 24)),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              cartController.addToCart(controller.products[index]);
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blue,
                              onPrimary: Colors.white,
                            ),
                            child: Text('Add to Cart'),
                          ),
                          // Obx(() => IconButton(
                          //   icon: controller
                          //       .products[index].isFavorite.value
                          //       ? Icon(Icons.check_box_rounded)
                          //       : Icon(Icons
                          //       .check_box_outline_blank_outlined),
                          //   onPressed: () {
                          //     controller.products[index].isFavorite
                          //         .toggle();
                          //   },
                          // ))
                        ],
                      ),
                    ),
                  );
                }
                );
              }
            ),
          ),
          GetX<CartController>(
            builder: (controller) {
              return Text('Total amount : \$ ${controller.totalPrice}',
              style: TextStyle(fontSize: 32,color: Colors.black),);
            }
          ),
          SizedBox(height: 100),
        ],
      )
    );
  }
}
