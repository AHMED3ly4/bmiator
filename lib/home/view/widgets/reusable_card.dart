import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {

  ReusableCard({required this.color, this.cardChild, this.function});
  final Color color;
  final cardChild;
  final function;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        margin: const EdgeInsets.all(15),
        child: cardChild,
      ),
    );
  }
}