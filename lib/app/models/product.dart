class Product {
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  int quantity;

  Product({required this.title, required this.description, required this.price, required this.imageUrl,this.quantity = 1});
}