import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/product_model.dart';
import '../controllers/cart_controller.dart';

class ProductDetailView extends StatelessWidget {
  final Welcome product;
  final CartController cartController = Get.put(CartController());

  ProductDetailView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    cartController.initializePrice(product.price);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(
              color: Color.fromARGB(255, 8, 1, 143),
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                product.image,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              product.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Category: ${product.category}',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow[800], size: 20),
                const SizedBox(width: 5),
                Text(
                  product.rating.rate.toString(),
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 5),
                Text(
                  '(${product.rating.count} reviews)',
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Obx(() => Text(
                  '\$${cartController.totalPrice.toString()}',
                  style: const TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 16),
            Text(
              product.description,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Text('Quantity',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            cartController.decreaseQuantity(product.price);
                          },
                          icon: const Icon(Icons.remove),
                          color: Colors.red,
                          iconSize: 28,
                        ),
                        Obx(() => Text('${cartController.quantity}',
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black))),
                        IconButton(
                          onPressed: () {
                            cartController.increaseQuantity(product.price);
                          },
                          icon: const Icon(Icons.add),
                          color: Colors.green,
                          iconSize: 28,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 8, 1, 143),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  Get.snackbar("Purchase", "Its take some time");
                },
                child: const Text(
                  'Buy Now',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  cartController.addToCart(product);
                  cartController.resetQuantity(product.price);
                },
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(
                      fontSize: 18, color: Color.fromARGB(255, 8, 1, 143)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
