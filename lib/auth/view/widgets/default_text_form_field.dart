import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
  final bool obscure;
  final String? Function(String?)? validator;
  final String label;
  final TextEditingController controller;
  const DefaultTextFormField(
      {super.key,  this.obscure=false, this.validator, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscure,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black12),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).primaryColor),
        ),
        label: Text(
          label,
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
