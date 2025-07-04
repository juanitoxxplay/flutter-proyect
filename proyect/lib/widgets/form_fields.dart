import 'package:flutter/material.dart';

Widget buildTextField({
  required String label,
  required TextEditingController controller,
  TextInputType? inputType,
  IconData? icon,
  String? Function(String?)? validator,
  bool isPriceField = false,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      controller: controller,
      keyboardType: inputType,
      style: TextStyle(
        color: Colors.grey[800],
        fontSize: 16,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          color: Colors.grey[600],
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.blue, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red[400]!),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[50],
        prefixIcon: icon != null
            ? Icon(
                icon,
                color: Colors.grey[600],
              )
            : null,
        suffixIcon: isPriceField
            ? const Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  '\$',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              )
            : null,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 16,
        ),
      ),
      validator: validator ??
          (value) => value == null || value.isEmpty ? 'Campo requerido' : null,
    ),
  );
}
