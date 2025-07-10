import 'package:flutter/material.dart';
import '../theme/theme.dart';

Widget buildTextField({
  required BuildContext context,
  required String label,
  required TextEditingController controller,
  TextInputType? inputType,
  IconData? icon,
  String? Function(String?)? validator,
  bool isPriceField = false,
}) {
  final theme = Theme.of(context);

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: TextFormField(
      controller: controller,
      keyboardType: inputType,
      style: theme.textTheme.bodyMedium?.copyWith(
        color: Colors.grey[800], // O puedes usar: theme.colorScheme.onSurface
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: theme.textTheme.bodySmall?.copyWith(
          color: FordTheme.silver,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: FordTheme.silver),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: FordTheme.silver),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: FordTheme.fordBlue, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.red.shade400),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        filled: true,
        fillColor: FordTheme.white,
        prefixIcon: icon != null
            ? Icon(
                icon,
                color: FordTheme.silver,
              )
            : null,
        suffixIcon: isPriceField
            ? Padding(
                padding: const EdgeInsets.all(15),
                child: Text(
                  '\$',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: FordTheme.fordBlue,
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

Widget buildSwitchField({
  required BuildContext context,
  required String label,
  required bool value,
  required ValueChanged<bool> onChanged,
}) {
  final theme = Theme.of(context);

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: FordTheme.silver,
          ),
        ),
        Switch(
          value: value,
          onChanged: onChanged,
          activeColor: FordTheme.activeGreen,
          activeTrackColor: FordTheme.activeGreenLight,
          inactiveThumbColor: FordTheme.silver,
          inactiveTrackColor: FordTheme.white,
        ),
      ],
    ),
  );
}
