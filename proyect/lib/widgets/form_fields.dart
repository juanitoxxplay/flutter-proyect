import 'package:flutter/material.dart';

Widget buildTextField({
  required String label,
  required TextEditingController controller,
  TextInputType? inputType,
  IconData? icon,
  String? Function(String?)? validator,
}) {
  return TextFormField(
    controller: controller,
    keyboardType: inputType,
    decoration: InputDecoration(
      labelText: label,
      border: const OutlineInputBorder(),
      prefixIcon: icon != null ? Icon(icon) : null,
    ),
    validator: validator ??
        (value) => value == null || value.isEmpty ? 'Campo requerido' : null,
  );
}
