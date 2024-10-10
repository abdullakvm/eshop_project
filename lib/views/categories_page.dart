import 'package:eshop_project/controllers/product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:eshop_project/views/product_grid_view.dart';

class CategoriesPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCard(
              context,
              'assets/mencard1.jpeg',
              'MENS CLOTHING',
              () {
                productController.filterByCategory("men's clothing");
                Get.to(() => ProductGridView());
              },
            ),
            _buildCard(
              context,
              'assets/tewellerycard1.jpeg',
              'JEWELLERY',
              () {
                productController.filterByCategory('jewelery');
                Get.to(() => ProductGridView());
              },
            ),
            _buildCard(
              context,
              'assets/womencard1.jpeg',
              'WOMENS CLOTHING',
              () {
                productController.filterByCategory("women's clothing");
                Get.to(() => ProductGridView());
              },
            ),
            _buildCard(
              context,
              'assets/elecroniccard1.jpeg',
              'ELECTRONICS',
              () {
                productController.filterByCategory('electronics');
                Get.to(() => ProductGridView());
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String imagePath, String categoryName,
      VoidCallback onPressed) {
    return Card(
      margin: const EdgeInsets.only(top: 8, bottom: 8, left: 16, right: 16),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              imagePath,
              fit: BoxFit.fill,
              width: double.infinity,
              height: 160,
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 0.7),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                  width: 310,
                  child: TextButton(
                    onPressed: onPressed,
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 10.0),
                    ),
                    child: Text(
                      categoryName,
                      style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
