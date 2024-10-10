import 'package:eshop_project/views/stackui.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Logopage extends StatefulWidget {
  const Logopage({super.key});

  @override
  _LogopageState createState() => _LogopageState();
}

class _LogopageState extends State<Logopage> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Welcomepage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 8, 1, 143),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              'assets/tf logoblur.png',
              width: 180,
              height: 180,
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'TREND FACTORY',
            style: TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w500,
              letterSpacing: 7,
            ),
          ),
        ],
      ),
    );
  }
}
