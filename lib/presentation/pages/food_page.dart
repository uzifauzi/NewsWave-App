import 'package:flutter/material.dart';

class FoodPage extends StatelessWidget {
  const FoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          10,
          (index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 120,
              width: double.infinity,
              color: Colors.green[100 * ((index % 9) + 1)],
              child: Center(child: Text("Food Item ${index + 1}")),
            ),
          ),
        ),
      ),
    );
  }
}
