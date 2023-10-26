import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Center(
            child: Text(
              "Category Screen",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
