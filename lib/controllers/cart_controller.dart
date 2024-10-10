import 'package:get/get.dart';
import '../models/product_model.dart';

class CartController extends GetxController {
  var quantity = 1.obs;
  var totalPrice = 0.0.obs;
  var cartItems = <Welcome>[].obs;

  void initializePrice(double price) {
    totalPrice.value = price;
    quantity.value = 1;
  }

  void increaseQuantity(double price) {
    quantity.value++;
    totalPrice.value = price * quantity.value;
  }

  void decreaseQuantity(double price) {
    if (quantity.value > 1) {
      quantity.value--;
      totalPrice.value = price * quantity.value;
    }
  }

  void addToCart(Welcome product) {
    cartItems.add(product);
    Get.snackbar("Cart", "${product.title} added to cart!");
  }

  void resetQuantity(double price) {
    quantity.value = 1;
    totalPrice.value = price;
  }

  void removeFromCart(Welcome product) {
    cartItems.remove(product);
    Get.snackbar("Cart", "${product.title} removed from cart!");
  }
}
