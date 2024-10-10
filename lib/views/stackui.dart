import 'package:eshop_project/views/login.dart';
import 'package:flutter/material.dart';

class Welcomepage extends StatelessWidget {
  const Welcomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/bgimage.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
                child: SizedBox(
                  height: 250,
                  width: 380,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.white.withOpacity(0.8),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const Text(
                            'Welcome to TrendFactory',
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 28,
                              color: Color.fromARGB(255, 8, 1, 143),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15, left: 7),
                            child: Text(
                              'Shop smart, live better! Discover',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey[410],
                              ),
                            ),
                          ),
                          Text(
                            'the joy of seamless shopping at',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[410],
                            ),
                          ),
                          Text(
                            '  your fingertips',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[410],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: SizedBox(
                                height: 15,
                                width: 35,
                                child: Card(
                                  color: Color.fromARGB(255, 8, 1, 143),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 55,
                                  width: 137,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: const ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            Colors.white)),
                                    child: const Text(
                                      'Sign up',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color:
                                              Color.fromARGB(255, 8, 1, 143)),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 55,
                                  width: 137,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => LoginPage()),
                                      );
                                    },
                                    style: const ButtonStyle(
                                        backgroundColor: WidgetStatePropertyAll(
                                            Color.fromARGB(255, 8, 1, 143))),
                                    child: const Text(
                                      'Get Started',
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
