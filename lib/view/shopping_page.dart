import 'package:example1/controller/cart_controller.dart';
import 'package:example1/controller/shopping_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({super.key});

  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(builder: (controller) {
              return ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.all(12),
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${controller.products[index].productName}',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                      '${controller.products[index].productDescription}'),
                                ],
                              ),
                              Text(
                                '\$${controller.products[index].price}',
                                style: TextStyle(fontSize: 24),
                              ),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              cartController.addToItems(controller.products[index]);
                            },
                            child: Text(
                              'Add to cart',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.blue)),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          SizedBox(
            height: 30,
          ),
          GetX<CartController>(
            builder: (controller) {
              return Text(
                'Total amount : \$ ${controller.totalPrice}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              );
            }
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: GetX<CartController>(
          builder: (controller) {
            return Text(
              controller.count.toString(),
              style: TextStyle(fontSize: 20),
            );
          }
        ),
        icon: Icon(
          Icons.add_shopping_cart_rounded,
        ),
        backgroundColor: Colors.yellow,
      ),
    );
  }
}
