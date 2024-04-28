import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  GenderCard({required this.icon,required this.text});
  final IconData icon;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 60,
          color: Theme.of(context).primaryColor,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text.toUpperCase(),
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
}