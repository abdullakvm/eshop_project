import 'dart:async';
import 'package:eshop_project/controllers/product_controller.dart';
import 'package:eshop_project/views/cart_page.dart';
import 'package:eshop_project/views/categories_page.dart';
import 'package:eshop_project/views/product_detail_view.dart';
import 'package:eshop_project/views/product_grid_view.dart';
import 'package:eshop_project/views/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late PageController _pageController;
  int _currentPage = 0;
  late Timer _timer;
  int _selectedIndex = 0;
  final PageController _bottomPageController = PageController();
  final ProductController productController = Get.put(ProductController());

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 3) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    _bottomPageController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _bottomPageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'TREND FACTORY',
          style: TextStyle(
            color: Color.fromARGB(255, 8, 1, 143),
            fontSize: 20,
            fontWeight: FontWeight.w900,
            letterSpacing: 5,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none_outlined,
              size: 30,
              color: Colors.grey[800],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.email_outlined,
              size: 30,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _bottomPageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index != 0) {
            _timer.cancel();
          } else {
            _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
              if (_currentPage < 3) {
                _currentPage++;
              } else {
                _currentPage = 0;
              }

              _pageController.animateToPage(
                _currentPage,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeIn,
              );
            });
          }
        },
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      top: 16, bottom: 16, left: 8, right: 8),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        SizedBox(
                          height: 200,
                          child: PageView(
                            controller: _pageController,
                            scrollDirection: Axis.horizontal,
                            onPageChanged: (index) {
                              setState(() {
                                _currentPage = index;
                              });
                            },
                            children: [
                              Image.asset(
                                'assets/mensclothing.png',
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                'assets/womensclothing.png',
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                'assets/jewellery_ad.jpeg',
                                fit: BoxFit.cover,
                              ),
                              Image.asset(
                                'assets/elecronicgadgets.png',
                                fit: BoxFit.cover,
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          child: SmoothPageIndicator(
                            controller: _pageController,
                            count: 4,
                            effect: const ExpandingDotsEffect(
                              dotHeight: 5,
                              dotWidth: 5,
                              activeDotColor: Color.fromARGB(255, 8, 1, 143),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                RichText(
                  text: const TextSpan(
                    text: 'Up to ',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: '65%',
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w900,
                              fontSize: 24)),
                      TextSpan(
                        text: ' Off on Branded Items',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(255, 215, 217, 250),
                        radius: 35,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/adidas-removebg-preview.png',
                            height: 60,
                            width: 60,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(255, 215, 217, 250),
                        radius: 35,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/lee-removebg-preview.png',
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(255, 215, 217, 250),
                        radius: 35,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/hand_m-removebg-preview.png',
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(255, 215, 217, 250),
                        radius: 35,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/nike-removebg-preview.png',
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 8, bottom: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Weekend Offers ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 28,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.whatshot,
                            size: 28,
                            color: Colors.orange[800],
                          )
                        ],
                      ),
                      const Column(
                        children: [
                          Text(
                            'Offer Ends in',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '2 Days',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            productController
                                .filterByCategory("women's clothing");
                            Get.to(() => ProductGridView());
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/kurtha.jpeg',
                                fit: BoxFit.cover,
                                height: 180,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 9),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            productController
                                .filterByCategory("men's clothing");
                            Get.to(() => ProductGridView());
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/shirt.jpeg',
                                fit: BoxFit.cover,
                                height: 180,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            productController.filterByCategory("electronics");
                            Get.to(() => ProductGridView());
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/ledtv.jpeg',
                                fit: BoxFit.cover,
                                height: 180,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 9),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            productController
                                .filterByCategory("men's clothing");
                            Get.to(() => ProductGridView());
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/t_shirt.jpeg',
                                fit: BoxFit.cover,
                                height: 180,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 16, bottom: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.red, width: 3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      width: 270,
                      child: TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          padding: const EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 10.0),
                        ),
                        child: const Text(
                          'Epic Price Drops !',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Obx(() {
                  if (productController.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          mainAxisSpacing: 5,
                          crossAxisSpacing: 5,
                          childAspectRatio: 0.8,
                        ),
                        itemCount: productController.productList.length,
                        itemBuilder: (context, index) {
                          var product = productController.productList[index];
                          return GestureDetector(
                            onTap: () {
                              Get.to(() => ProductDetailView(product: product));
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Image.network(
                                        product.image,
                                        height: 80,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                      Positioned(
                                        bottom: 3,
                                        left: 3,
                                        child: Card(
                                          color: Colors.white.withOpacity(0.7),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 4.0, vertical: 2.0),
                                            child: Row(
                                              children: [
                                                Icon(Icons.star,
                                                    color: Colors.yellow[800],
                                                    size: 12),
                                                const SizedBox(width: 3),
                                                Text(
                                                  product.rating.rate
                                                      .toString(),
                                                  style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      product.title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      '\$${product.price.toString()}',
                                      style: const TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }
                })
              ],
            ),
          ),
          CategoriesPage(),
          CartView(),
          const ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_outlined,
              size: 28,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category_outlined,
              size: 28,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart_outlined,
              size: 28,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outlined,
              size: 28,
            ),
            label: 'Profile',
          ),
        ],
        selectedItemColor: const Color.fromARGB(255, 8, 1, 143),
        unselectedItemColor: Colors.grey[700],
        showUnselectedLabels: true,
        selectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
        unselectedLabelStyle:
            const TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
      ),
    );
  }
}
