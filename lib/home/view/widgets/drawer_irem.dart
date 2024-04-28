import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  void Function()? onTap;
  final String text;
  final IconData icon;
  DrawerItem({super.key, required this.text, required this.icon,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsetsDirectional.all(8),
        margin: const EdgeInsetsDirectional.symmetric(vertical: 12),
        decoration: const BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(color: Colors.grey),
            vertical: BorderSide.none,
          ),
        ),
        child:  Row(
          children: [
            Text(
              text,
              style: const TextStyle(color: Colors.black,fontSize: 24),
            ),
            const Spacer(),
             Icon(icon),
          ],
        ),
      ),
    );
  }
}
