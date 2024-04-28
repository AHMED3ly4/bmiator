import 'package:bmiator/auth/data/models/bmi_model.dart';
import 'package:bmiator/home/view/widgets/reusable_card.dart';
import 'package:bmiator/shared/theming/app_theme.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  static const routeName="/Result screen";
  const ResultScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final bmi  =ModalRoute.of(context)!.settings.arguments as BMIModel;
    return Scaffold(

      appBar: AppBar(
        title: Text('Result'),
      ),
      body: Column(
        children: [
          Container(
            child: Text(
              'Your result',
              style: TextStyle(fontSize: 50),
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: AppTheme.cardColor,
              cardChild: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    bmi.grade.toStringAsFixed(2),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    bmi.statue,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
