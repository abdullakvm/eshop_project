import 'package:eshop_project/service/api_service.dart';
import 'package:get/get.dart';
import '../models/product_model.dart';

class ProductController extends GetxController {
  var productList = <Welcome>[].obs;
  var filteredList = <Welcome>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    try {
      isLoading(true);
      var products = await ApiService.fetchProducts();
      if (products != null) {
        productList.assignAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  void filterByCategory(String category) {
    if (category == 'All') {
      filteredList.assignAll(productList);
    } else {
      filteredList.assignAll(productList
          .where((p) => p.category.toLowerCase() == category.toLowerCase())
          .toList());
    }
  }
}
