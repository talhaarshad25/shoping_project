import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shoping_project/app/modules/cart/views/cart_view.dart';

import '../../../models/product.dart';
import '../controllers/products_controller.dart';



class ProductsView extends StatelessWidget {
   ProductsView({super.key});
   final ProductsController productsController = Get.put(ProductsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
        actions: [
          // Cart icon with the cart pointer
          IconButton(
            icon: Stack(
              children: [
                Icon(Icons.shopping_cart),
                Positioned(
                  right: 0,
                  child: CircleAvatar(
                    backgroundColor: Colors.red,
                    radius: 10,
                    child: Obx(() => Text(
                      productsController.cartPointer.toString(),
                      style: TextStyle(fontSize: 12, color: Colors.white),
                    )),
                  ),
                ),
              ],
            ),
            onPressed: () {
              // Navigate to the cart screen
              Navigator.push(context, MaterialPageRoute(builder: (context) => CartView(),));
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productsController.products.length,
        itemBuilder: (context, index) {
          Product product = productsController.products[index];
          return ListTile(
            leading: Image.network(product.imageUrl), // Replace with actual image URL
            title: Text(product.title),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.description),
                Text('\$${product.price.toStringAsFixed(2)}'),
              ],
            ),
            trailing: IconButton(
              icon: Icon(Icons.add_shopping_cart),
              onPressed: () {
                // Add the product to the cart
                productsController.addToCart(product);
              },
            ),
          );
        },
      ),
    );

  }
}


