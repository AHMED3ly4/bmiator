import 'package:flutter/material.dart';

void main() {
  runApp(Bmiator());
}


class Bmiator extends StatelessWidget {
  const Bmiator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bmiator",
      debugShowCheckedModeBanner: false,

    );
  }
}
