import 'package:flutter/material.dart';

class ChangeValue extends StatelessWidget {
  const ChangeValue({super.key, required this.function,required this.icon});
final IconData icon;
final Function() function;


  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed:  function,
      child: Icon(icon,size: 50,color: Colors.white,),
    );
  }
}