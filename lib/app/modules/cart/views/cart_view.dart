import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../models/product.dart';
import '../../products/controllers/products_controller.dart';
import '../controllers/cart_controller.dart';



class CartView extends StatelessWidget {

  final ProductsController productsController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Obx(() => ListView.builder(
        itemCount: productsController.cartItems.length,
        itemBuilder: (context, index) {
          Product product = productsController.cartItems[index];
          return ListTile(
            contentPadding: EdgeInsets.all(16.0),
            title: Row(
              children: [
                // Image on the left
                Image.network(
                  product.imageUrl, // Replace with actual image URL
                  width: 60,
                  height: 60,
                ),
                SizedBox(width: 16),
                // Product title on the right
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        '\$${product.price.toStringAsFixed(2)}',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16),
                // Increment and decrement buttons
                // Increment and decrement buttons
                StatefulBuilder(
                  builder: (context, setState) => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          // Decrement the quantity of the product
                          productsController.decrementQuantity(product);
                          setState(() {}); // Update the state to rebuild the widget
                        },
                      ),
                      Text(product.quantity.toString()),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () {
                          // Increment the quantity of the product
                          productsController.incrementQuantity(product);
                          setState(() {}); // Update the state to rebuild the widget
                        },
                      ),
                    ],
                  ),
                ),

                // Delete icon button
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    // Remove the product from the cart
                    productsController.removeFromCart(product);
                  },
                ),
              ],
            ),
          );
        },
      )),
      bottomNavigationBar: Obx(() => Container(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Total Price: \$${productsController.totalPrice.value.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      )),
    );
  }
}

