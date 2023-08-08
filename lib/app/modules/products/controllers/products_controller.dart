import 'package:get/get.dart';

import '../../../models/cart.dart';
import '../../../models/product.dart';

class ProductsController extends GetxController {
  //TODO: Implement ProductsController

  final products = <Product>[

    Product(title:"Product 1", description:"Description 1", price:10.0,imageUrl:"https://us.soundcore.com/cdn/shop/products/A3040031_Noise_Cancelling_Headphones_TD01.jpg?v=1668154743"),
    Product(title:"Product 2", description:"Description 2", price:10.0,imageUrl:"https://ae01.alicdn.com/kf/S37e5201703e74e02be192f81d08fc3ccv/2022New-Style-Bluetooth-Headphone-Wireless-Earphones-HiFi-Stereo-In-Ear-Earbuds-Noise-Reduction-Audio-Headset-With.jpg"),
    Product(title:"Product 3", description:"Description 3", price:10.0,imageUrl:"https://us.soundcore.com/cdn/shop/products/A3040031_Noise_Cancelling_Headphones_TD01.jpg?v=1668154743"),
    Product(title:"Product 4", description:"Description 4", price:10.0,imageUrl:"https://us.soundcore.com/cdn/shop/products/A3040031_Noise_Cancelling_Headphones_TD01.jpg?v=1668154743"),
    Product(title:"Product 5", description:"Description 5", price:10.0,imageUrl:"https://us.soundcore.com/cdn/shop/products/A3040031_Noise_Cancelling_Headphones_TD01.jpg?v=1668154743"),
    Product(title:"Product 6", description:"Description 6", price:10.0,imageUrl:"https://us.soundcore.com/cdn/shop/products/A3040031_Noise_Cancelling_Headphones_TD01.jpg?v=1668154743"),
    Product(title:"Product 7", description:"Description 7", price:10.0,imageUrl:"https://us.soundcore.com/cdn/shop/products/A3040031_Noise_Cancelling_Headphones_TD01.jpg?v=1668154743"),
    Product(title:"Product 8", description:"Description 8", price:10.0,imageUrl:"https://us.soundcore.com/cdn/shop/products/A3040031_Noise_Cancelling_Headphones_TD01.jpg?v=1668154743"),
    Product(title:"Product 9", description:"Description 9", price:10.0,imageUrl:"https://us.soundcore.com/cdn/shop/products/A3040031_Noise_Cancelling_Headphones_TD01.jpg?v=1668154743"),
    Product(title:"Product 10", description:"Description 10", price:10.0,imageUrl:"https://us.soundcore.com/cdn/shop/products/A3040031_Noise_Cancelling_Headphones_TD01.jpg?v=1668154743"),
    Product(title:"Product 11", description:"Description 11", price:10.0,imageUrl:"https://us.soundcore.com/cdn/shop/products/A3040031_Noise_Cancelling_Headphones_TD01.jpg?v=1668154743"),
    // Add more products here
  ].obs;

  // Cart items and cart pointer
  final cartItems = <Product>[].obs;
  final cartPointer = 0.obs;

  // Add to cart function
  void addToCart(Product product) {
    int index = cartItems.indexWhere((p) => p.title == product.title);

    if (index == -1) {
      // Product does not exist in cart, add a new instance
      cartItems.add(product);
    } else {
      // Product already exists in cart, increase the quantity
      cartItems[index].quantity++;
    }

    cartPointer.value = cartItems.length;
    updateTotalPrice();
  }

  // Increment quantity of a specific product
  void incrementQuantity(Product product) {
    product.quantity++;
    updateTotalPrice();
  }

  // Decrement quantity of a specific product
  void decrementQuantity(Product product) {
    if (product.quantity > 1) {
      product.quantity--;
      updateTotalPrice();
    }
  }

  // Remove product from the cart
  void removeFromCart(Product product) {
    cartItems.remove(product);
    updateTotalPrice();
  }

  // Total price of all items in the cart
  final totalPrice = 0.0.obs;

  // Update the total price based on the cart items
  void updateTotalPrice() {
    double total = 0.0;
    for (var product in cartItems) {
      total += product.price * product.quantity;
    }
    totalPrice.value = total;
  }


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
