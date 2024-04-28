import 'package:flutter/material.dart';
import 'change_value.dart';

class DataCard extends StatelessWidget {
  const DataCard({super.key, required this.dataName,required this.dataNumber,required this.plusFunction,required this.minusFunction});
  final String dataName;
  final int dataNumber;
  final Function() plusFunction;
  final Function() minusFunction;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          dataName.toUpperCase(),
          style:Theme.of(context).textTheme.bodyMedium,
        ),
        Text(
          dataNumber.toString(),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ChangeValue(
              function: minusFunction,
              icon: Icons.remove,
            ),
            const SizedBox(
              width: 10,
            ),
            ChangeValue(
              function: plusFunction,
              icon: Icons.add,
            ),
          ],
        ),
      ],
    );
  }
}