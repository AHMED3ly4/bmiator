import 'package:bmiator/shared/theming/app_theme.dart';
import 'package:flutter/material.dart';

class DefaultElevatedButton extends StatelessWidget {
  final void Function()? onPressed;
  final String label;
  const DefaultElevatedButton({
    super.key,
    this.onPressed,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
            padding: const EdgeInsets.symmetric(vertical: 12)),
        child: Text(
          label,
          style: const TextStyle(color: AppTheme.whiteColor, fontSize: 22),
        ),
      ),
    );
  }
}
